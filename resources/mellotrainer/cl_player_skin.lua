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
---------------------------------------------------------------------------]]

-- Skin DB
local components = {
	{ name = 'Head/Face', t = 0},
	{ name = 'Beard/Mask', t = 1},
	{ name = 'Hair/Hats', t = 2},
	{ name = 'Top/Shirts', t = 3},
	{ name = 'Legs/Pants', t = 4},
	{ name = 'Gloves/Hands', t = 5},
	{ name = 'Shoes/Feet', t = 6},
	{ name = 'Neck/Eyes', t = 7},
	{ name = 'Accessories-Top', t = 8},
	{ name = 'Accessories-Extra', t = 9},
	{ name = 'Badges/Decals', t = 10},
	{ name = 'Shirt/Jacket', t = 11}
}


-- Prop DB
local propComponents = {
	{ name = "Hats/Mask/Helmets", t = 0},
	{ name = "Glasses", t = 1},
	{ name = "Ears/Accessories", t = 2}
}


-- Error message
local modifyEmpty = "~r~Nothing to modify!"

-- Set Skin Function 
function SetSkin( skin )
	local ped = GetPlayerPed( -1 )

	if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
		if ( IsModelValid( skin ) ) then 
			_LoadModel( skin )
			SetPlayerModel( PlayerId(), skin )
			SetPedDefaultComponentVariation( PlayerId() )
			SetModelAsNoLongerNeeded( skin )
		end 
	end 
end 

--[[------------------------------------------------------------------------
	Skin Saving and Loading 
------------------------------------------------------------------------]]--
local skins = {}
local skinsCount = 0

RegisterNetEvent( 'wk:RecieveSavedSkins' )
AddEventHandler( 'wk:RecieveSavedSkins', function( dataTable )
    skins = dataTable
    skinsCount = getTableLength( dataTable )
end )

function CreateSkinOptions( index )
	local spawnSkin = {
		[ "menuName" ] = "Apply To Player", 
		[ "data" ] = {
			[ "action" ] = "spawnsavedskin " .. index
		}
	}

	local overwriteSave = {
		[ "menuName" ] = "Overwrite With Current", 
		[ "data" ] = {
			[ "action" ] = "skinsave " .. index
		}
	}

	local renameSkin = {
		[ "menuName" ] = "Rename Save", 
		[ "data" ] = {
			[ "action" ] = "skinsave " .. index .. " r"
		}
	}

	local deleteSkin = {
		[ "menuName" ] = "Delete", 
		[ "data" ] = {
			[ "action" ] = "deletesavedskin " .. index
		}
	}

	local options = { spawnSkin, overwriteSave, renameSkin, deleteSkin }

	return options 
end 

RegisterNUICallback( "loadsavedskins", function( data, cb ) 
	local validOptions = {}
 
    for k, v in pairs( skins ) do
    	local skinOptions = CreateSkinOptions( k )

        table.insert( validOptions, 1, {
            [ "menuName" ] = v[ "saveName" ],
            [ "data" ] = {
                [ "sub" ] = k 
            },
            [ "submenu" ] = skinOptions
        } )
    end

    table.insert( validOptions, {
    	[ "menuName" ] = "Create New Skin Save", 
    	[ "data" ] = {
    		[ "action" ] = "skinsave"
    	}
    } )
 
    local customJSON = "{}"

    if ( getTableLength( validOptions ) > 0 ) then
        customJSON = json.encode( validOptions, { indent = true } )
    end
 
    SendNUIMessage( {
        createmenu = true,
        menuName = "loadsavedskins",
        menudata = customJSON
    } )
   
    if ( cb ) then cb( "ok" ) end
end )

RegisterNUICallback( "skinsave", function( data, cb ) 
	Citizen.CreateThread( function()
		local ped = GetPlayerPed( -1 )
		local skinTableData = {}
		local saveName = nil 
		local overwriting 
        local renaming 
        local index 

        if ( data.action == nil ) then 
        	overwriting = false 
        	renaming = false 
        else 
        	if ( data.data[3] ~= nil ) then 
        		renaming = true 
        	else 
        		overwriting = true 
        	end 

        	index = tonumber( data.action )
        end 

		if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
			while ( (saveName == nil and not overwriting) or (saveName == nil and renaming) ) do 
                saveName = requestInput( "Enter save name", 24 )
                Citizen.Wait( 1 )
            end 

            if ( saveName or overwriting or renaming ) then 
            	local model = GetEntityModel( ped )

            	if ( renaming or not overwriting ) then 
					skinTableData[ "saveName" ] = saveName 
				else 
					skinTableData[ "saveName" ] = skins[index][ "saveName" ]
				end 

            	skinTableData[ "model" ] = tostring( model )

            	local components = {}

            	for i = 0, 11 do 
            		local drawable = GetPedDrawableVariation( ped, i )
            		local texture = GetPedTextureVariation( ped, i )

            		components[i]  = { drawable, texture }
            	end 

            	skinTableData[ "components" ] = components  

            	local props = {}

            	for i = 0, 9 do
            		local drawable = GetPedPropIndex( ped, i )
            		local texture = GetPedPropTextureIndex( ped, i )

            		props[i] = { drawable, texture }
            	end 

            	skinTableData[ "props" ] = props 

                if ( not renaming and not overwriting ) then 
                	skinsCount = skinsCount + 1
                	skins[skinsCount] = skinTableData
                	TriggerServerEvent( 'wk:DataSave', "skins", skinTableData, skinsCount )

                	SendNUIMessage({
						reshowmenu = true 
					})
                else 
                	skins[index] = skinTableData
                	TriggerServerEvent( 'wk:DataSave', "skins", skinTableData, index )

                	SendNUIMessage({
						trainerback = true 
					})

					SendNUIMessage({
						reshowmenu = true 
					})
                end 

                resetTrainerMenus( "loadsavedskins" )
            end 
		end 
	end )
end )

RegisterNUICallback( "spawnsavedskin", function( data, cb ) 
	local saveData = skins[ tonumber( data.action ) ]
	local model = tonumber( saveData[ "model" ] )

	local ped = GetPlayerPed( -1 )

	if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
		SetSkin( model )
		ApplySavedSettingsToPed( saveData )
	end 
end )

RegisterNUICallback( "deletesavedskin", function( data, cb ) 
	local index = tonumber( data.action )

	-- Citizen.Trace( "Found " .. index .. " with type " .. type( index ) )

	if ( skinsCount > 0 ) then 
		skins[index] = nil 
		TriggerServerEvent( 'wk:DataSave', "skins", nil, index )

		SendNUIMessage({
			trainerback = true 
		})

		SendNUIMessage({
			trainerback = true 
		})

		resetTrainerMenus( "loadsavedskins" )
	end 
end )

function ApplySavedSettingsToPed( data )
	local components = data[ "components" ]
	local props = data[ "props" ]

	local ped = GetPlayerPed( -1 )

	for k, v in pairs( components )	do 
		-- Citizen.Trace( k .. " " .. type(k) .. " - (" .. v[1] .. " " .. type( v[1] ) .. ", " .. v[2] .. " " .. type( v[2] ) .. ")" )
		local index = tonumber( k )

		SetPedComponentVariation( ped, index, v[1], v[2], 0 )
	end 

	ClearAllPedProps( ped )

	for k, v in pairs( props ) do 
		-- Citizen.Trace( k .. " " .. type(k) .. " - (" .. v[1] .. " " .. type( v[1] ) .. ", " .. v[2] .. " " .. type( v[2] ) .. ")" )
		local index = tonumber( k )		

		SetPedPropIndex( ped, index, v[1], v[2], 0 )
	end 
end 

-- Change players skin.
RegisterNUICallback("playerskin", function(data, cb)
	local model
	if data.action == "input" then
		model = GetHashKey(requestInput("", 60))
	else
		model = GetHashKey(data.action)
	end
	if(not(IsModelValid(model)))then
		drawNotification("~r~Invalid Model Name")
		return
	end
	
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(1)
	end

	SetPlayerModel(PlayerId(), model)
	SetPedDefaultComponentVariation(GetPlayerPed(-1))
	drawNotification("~g~Changed Player Model.")
	resetTrainerMenus("playerskinmodify playerpropmodify")

	if(cb)then cb("ok")end
end)



-- Return all player skin variations in JSON format.
RegisterNUICallback("playerskinmodify", function(data, cb)
	local validOptions = {}
	local optCount = 0

	for i=1,#components,1 do
		local validComponents = checkValidComponents(components[i].t)

		if #validComponents > 0 then
			table.insert(validOptions, 1, {
				["menuName"] = components[i].name.." ("..#validComponents..")",
				["data"] = {
					["sub"] = components[i].t
				},
				["submenu"] = validComponents
			})

			optCount = optCount + 1
		end
	end

	if (optCount > 0) then
		local SkinJSON = json.encode(validOptions, {indent = true})

		--Citizen.Trace(SkinJSON);

		SendNUIMessage({
			createmenu = true,
			menuName = "playerskinmodify",
			menudata = SkinJSON
		})
	else
		drawNotification(modifyEmpty)
	end
end)


-- Return all player prop components in JSON format.
RegisterNUICallback("playerpropmodify", function(data, cb)
	local validOptions = {}
	local optCount = 0

	for i=1,#propComponents,1 do
		local validComponents = checkValidPropComponents(propComponents[i].t)

		if #validComponents > 0 then
			table.insert(validOptions, 1, {
				["menuName"] = propComponents[i].name.." ("..#validComponents..")",
				["data"] = {
					["sub"] = propComponents[i].t
				},
				["submenu"] = validComponents
			})

			optCount = optCount + 1
		end
	end

	if (optCount > 0) then
		local PropJSON = json.encode(validOptions, {indent = true})

		--Citizen.Trace(PropJSON);

		SendNUIMessage({
			createmenu = true,
			menuName = "playerpropmodify",
			menudata = PropJSON
		})	
	else
		drawNotification(modifyEmpty)
	end
end)


-- Default Skin/Clear Props for current skin.
RegisterNUICallback("defaultskin", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if(data.action == "skin") then
		SetPedDefaultComponentVariation(playerPed)
	end

	if(data.action == "props") then
		ClearAllPedProps(playerPed)
	end

	if(cb)then cb("ok")end
end)


-- Remove Individual Props from the current skin.
RegisterNUICallback("clearpropid", function(data, cb)
	local componentID = tonumber(data.action)

	ClearPedProp(GetPlayerPed(-1), componentID)

	if(cb)then cb("ok")end
end)



-- Random skin/prop variations for the current skin.
RegisterNUICallback("randomskin", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	if(data.action == "skin") then
		SetPedRandomComponentVariation(playerPed)
	end

	if(data.action == "props") then
		SetPedRandomProps(playerPed)
	end

	if(cb)then cb("ok")end
end)



-- Changes the current component to the requested variation (Skin/Props)
local defaultSkinAction = "changeskin skin"
local defaultPropAction = "changeskin props"
RegisterNUICallback("changeskin", function(data, cb)
	local playerPed = GetPlayerPed(-1)
	local componentID = tonumber(data.data[3])
	local drawableID = tonumber(data.data[4]) - 1
	local textureID = tonumber(data.data[5])
	if(textureID == nil)then
		textureID = 0
	end

	if(data.action == "skin") then
		SetPedComponentVariation(playerPed, componentID, drawableID, textureID)

	elseif(data.action == "props") then
		SetPedPropIndex(playerPed, componentID, drawableID, textureID, true)

	end
	--Citizen.Trace("ComponentID: "..tostring(componentID)..", Drawable ID:"..tostring(drawableID)..", Texture ID:"..tostring(textureID))


	if(cb)then cb("ok")end
end)








-- Get all valid skin variations for the current skin.
function checkValidComponents(componentID)
	local playerPed = GetPlayerPed(-1)
	local valid = {}
	local pedCount = GetNumberOfPedDrawableVariations(playerPed, componentID)
	for i = 1, pedCount, 1 do

		local textureCount = GetNumberOfPedTextureVariations(playerPed, componentID, i - 1)
		local textures = {}

		for textureIndex=0,textureCount-1,1 do
			local textureObj = {
				["menuName"] = "Texture #"..tostring(textureIndex),
				["data"] = {
					["hover"] = defaultSkinAction.." "..tostring(componentID).." "..tostring(i).." "..tostring(textureIndex)
				}
			}

			table.insert(textures, textureObj)
		end


		if(textureCount > 0)then
			valid[i] = { 
				["menuName"] = "Drawable #"..tostring(i),
				["data"] = {
					["hover"] = defaultSkinAction.." "..tostring(componentID).." "..tostring(i).." 0",
					["sub"] = i
				},
				["submenu"] = textures
			}
		end
	end
	return valid
end


-- Get all Valid Prop components for the current skin
function checkValidPropComponents(propID)
	local playerPed = GetPlayerPed(-1)
	local valid = {}
	local propCount = GetNumberOfPedPropDrawableVariations(playerPed, propID)
	for i = 1, propCount, 1 do
		local textureCount = GetNumberOfPedPropTextureVariations(playerPed, propID, i - 1)
		local textures = {}

		for textureIndex=0,textureCount-1,1 do
			local textureObj = {
				["menuName"] = "Texture #"..tostring(textureIndex),
				["data"] = {
					["hover"] = defaultPropAction.." "..tostring(propID).." "..tostring(i).." "..tostring(textureIndex)
				}
			}

			table.insert(textures, textureObj)
		end

		if(textureIndex ~= nil)then

		end

		if(textureCount > 0)then
			table.insert(valid, { 
				["menuName"] = "Drawable #"..tostring(i),
				["data"] = {
					["hover"] = defaultPropAction.." "..tostring(propID).." "..tostring(i).." 0",
					["sub"] = i
				},
				["submenu"] = textures
			})
		end
	end

	if(propCount ~= nil)then
		table.insert(valid, 1, {
			["menuName"] = "Clear Prop",
			["data"] = {
				["hover"] = "clearpropid "..tostring(propID)
			}
		})	
	end
	return valid
end
