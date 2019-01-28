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

_VERSION = '0.4.5'

--[[------------------------------------------------------------------------
	Version Check 
	Credits to EssentialMode 
------------------------------------------------------------------------]]--
PerformHttpRequest( "https://thestonedturtle.github.io/version.txt", function( err, text, headers )
	Citizen.Wait( 1000 ) -- just to reduce clutter in the console on startup 
	RconPrint( "\nCurrent MelloTrainer Version: " .. _VERSION)
	RconPrint( "\nLatest MelloTrainer Version: " .. text)
	
	if ( text ~= _VERSION ) then
		RconPrint( "\n\n\t|||||||||||||||||||||||||||||||||\n\t||  MelloTrainer is Outdated   ||\n\t|| Download the latest version ||\n\t||    From the FiveM Forums    ||\n\t|||||||||||||||||||||||||||||||||\n\n" )
	else
		RconPrint( "\nMelloTrainer is up to date!\n" )
	end
end, "GET", "", { what = 'this' } )


--[[------------------------------------------------------------------------
	Steam Only Connection 
------------------------------------------------------------------------]]--
AddEventHandler( 'playerConnecting', function( name, cb )
	if ( Config.settings.steamOnly ) then 
		local id = DATASAVE:GetIdentifier( source, "steam" )

		if ( id == nil ) then 
			cb( "Pour rejoindre le serveur tu dois avoir steam ouvert avant de lancer fivem." )
			CancelEvent()
		end 
	end 
end )