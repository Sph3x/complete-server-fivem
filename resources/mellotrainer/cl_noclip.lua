--[[--------------------------------------------------------------------------
    *
    * Mello Trainer
    * (C) Michael Goodwin 2017
    * http://github.com/thestonedturtle/mellotrainer/releases
    *
    * This menu used the Scorpion Trainer as a framework to build off of.
    * https://github.com/pongo1231/ScorpionTrainer
    * (C) Emre Cürgül 2017
    * 
    * A lot of useful functionality has been converted from the lambda menu.
    * https://lambda.menu
    * (C) Oui 2017
    *
    * Additional Contributors:
    * WolfKnight (https://forum.fivem.net/u/WolfKnight)
    *
    * Credits to @Oui (Lambda Menu). Converted by @TheStonedTurtle
---------------------------------------------------------------------------]]


-- Animation Variables
local loadedAnims = false
local noclip_ANIM_A = "amb@world_human_stand_impatient@male@no_sign@base"
local noclip_ANIM_B = "base"

-- Noclip Variables
local in_noclip_mode = false
local travelSpeed = 4
local curLocation
local curRotation
local curHeading
local target

function createNoClipMenuOptions()
    local options = {"Noclip Toggle: F2","W = Move Forward","S = Move Backwards","A = Rotate Left","D = Rotate Right","Q = Move Upwards","Z = Move Downwards","Shift = Change Speed"}
    local speeds = { "Slowest", "Slower", "Slow", "Normal", "Fast", "Faster", "Fastest" }
    local menuOpts = {}
    for index,value in pairs(options)do
        local item = {["menuName"] = value}
        table.insert(menuOpts, 1, item)
    end

    local curSpeed = {["menuName"] = "Current Speed = "..(speeds[travelSpeed] or "NA")}
    table.insert(menuOpts, 1, curSpeed)

    return menuOpts
end

function refreshNoClipMenu()
    local menuOpts = createNoClipMenuOptions()
    local customJSON = json.encode( menuOpts, { indent = true } )

    SendNUIMessage({
        showtrainer = true, -- Refreshes the trainer/ensures its visible.
        createmenu = true,
        menuName = "noclipmenu",
        menudata = customJSON,
        removeSelectedClass = true
    })
    showtrainer = true -- Sync state with cl_general.lua
end


function toggleNoClipMode()
    if(in_noclip_mode)then
        turnNoClipOff()
    else
        turnNoClipOn()
    end
end

function turnNoClipOff()
    local playerPed = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle( playerPed, false )

    if ( inVehicle ) then
        local veh = GetVehiclePedIsUsing( playerPed )
        SetEntityInvincible( veh, false )
    else
        ClearPedTasksImmediately( playerPed )
    end

    SetUserRadioControlEnabled( true )
    SetPlayerInvincible( PlayerId(), false )
    SetEntityInvincible( target, false )

    in_noclip_mode = false

    SendNUIMessage({
        resettrainer = true
    })

    showtrainer = false -- Sync state with cl_general.lua    
    blockinput = false -- Allow Trainer Access Again
end

function turnNoClipOn()
    blockinput = true -- Prevent Trainer access while in noclip mode.
    local playerPed = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle( playerPed, false )   

    if ( not inVehicle ) then
        _LoadAnimDict( noclip_ANIM_A )
        loadedAnims = true
    end

    -- Update starting position for noclip
    local x, y, z = table.unpack( GetEntityCoords( playerPed, false ) )
    curLocation = { x = x, y = y, z = z }
    curRotation = GetEntityRotation( playerPed, false )
    curHeading = GetEntityHeading( playerPed )

    in_noclip_mode = true
    refreshNoClipMenu()
end

-- Credits to @Oui (Lambda Menu)
function degToRad( degs )
    return degs * 3.141592653589793 / 180 
end

-- Handles all No Clipping.
Citizen.CreateThread( function()
    local rotationSpeed = 2.5
    local forwardPush = 1.8

    local speeds = { 0.05, 0.2, 0.8, 1.8, 3.6, 5.4, 15.0 }

    local moveUpKey = 44      -- Q
    local moveDownKey = 20    -- Z
    local moveForwardKey = 32 -- W
    local moveBackKey = 33    -- S
    local rotateLeftKey = 34  -- A
    local rotateRightKey = 35 -- D
    local changeSpeedKey = 21 -- LSHIFT

    -- Sync Forward Push with Travel Speed. Only called when travelSpeed is updated.
    function updateForwardPush()
        forwardPush = speeds[ travelSpeed ]

        refreshNoClipMenu()
    end

    -- Updates the players position
    function handleMovement(xVect,yVect)
        if ( IsControlJustPressed( 1, changeSpeedKey ) or IsDisabledControlJustPressed( 1, changeSpeedKey ) ) then
            travelSpeed = travelSpeed + 1 

            if ( travelSpeed > getTableLength(speeds) ) then 
                travelSpeed = 1
            end

            updateForwardPush();
        end 

        if ( IsControlPressed( 1, moveUpKey ) or IsDisabledControlPressed( 1, moveUpKey ) ) then
            curLocation.z = curLocation.z + forwardPush / 2
        elseif ( IsControlPressed( 1, moveDownKey ) or IsDisabledControlPressed( 1, moveDownKey ) ) then
            curLocation.z = curLocation.z - forwardPush / 2
        end

        if ( IsControlPressed( 1, moveForwardKey ) or IsDisabledControlPressed( 1, moveForwardKey ) ) then
            curLocation.x = curLocation.x + xVect
            curLocation.y = curLocation.y + yVect
        elseif ( IsControlPressed( 1, moveBackKey ) or IsDisabledControlPressed( 1, moveBackKey ) ) then
            curLocation.x = curLocation.x - xVect
            curLocation.y = curLocation.y - yVect
        end

        if ( IsControlPressed( 1, rotateLeftKey ) or IsDisabledControlPressed( 1, rotateLeftKey ) ) then
            curHeading = curHeading + rotationSpeed
        elseif ( IsControlPressed( 1, rotateRightKey ) or IsDisabledControlPressed( 1, rotateRightKey ) ) then
            curHeading = curHeading - rotationSpeed
        end 
    end

     while true do
        Citizen.Wait( 0 )

        if ( in_noclip_mode ) then
            local playerPed = PlayerPedId()

            if ( IsEntityDead( playerPed ) ) then
                turnNoClipOff()

                -- Ensure we get out of noclip mode
                Citizen.Wait( 100 )
            else 
                target = playerPed 
                
                -- Handle Noclip Movement.
                local inVehicle = IsPedInAnyVehicle( playerPed, true )

                if ( inVehicle ) then
                    target = GetVehiclePedIsUsing( playerPed )
                end

                SetEntityVelocity( playerPed, 0.0, 0.0, 0.0 )
                SetEntityRotation( playerPed, 0, 0, 0, 0, false )

                -- Prevent Conflicts/Damage
                SetUserRadioControlEnabled( false )
                SetPlayerInvincible( PlayerId(), true )
                SetEntityInvincible( target, true )

                -- Play animation on foot.
                if ( not inVehicle ) then
                    TaskPlayAnim( playerPed, noclip_ANIM_A, noclip_ANIM_B, 8.0, 0.0, -1, 9, 0, 0, 0, 0 ) 
                end

                local xVect = forwardPush * math.sin( degToRad( curHeading ) ) * -1.0
                local yVect = forwardPush * math.cos( degToRad( curHeading ) )

                handleMovement( xVect, yVect )

                -- Update player postion.
                SetEntityCoordsNoOffset( target, curLocation.x, curLocation.y, curLocation.z, true, true, true )
                SetEntityHeading( target, curHeading - rotationSpeed )
            end
        end
     end
end )