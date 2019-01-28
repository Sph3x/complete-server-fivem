# README #
This is an english translation of the GCIdentity script located here( https://github.com/Gannon001/gcidentity )

 
### Dependencies ###
* mysql-async
* Essential Mode 4.6.1+


### Optional Dependencies ###


### Features ###
* mysql async support
* identification system 

### CURRENT KNOWN BUGS ###


### CURRENT POSSIBLE FEATURES FOR FUTURE RELEASES ###
*Let me know.

### How do I get set up? ###
* Download all the resources
* Add to your FX server resources folder.
* Auto start resources in your server.cfg.
* If there are errors with your sql db try running the SQL file included.

### Contribution ###
* If you would like to contribute please let me know.

### Credits ###
* The author of the GCIdentity script (https://github.com/Gannon001/gcidentity)
* The author of the async script
* The author of Essentila mode.


### Who do I talk to? ###
* JinkLeft


### API

```lua
### EVENTS ###

-- (client) Show your identity card to the nearest person
TriggerServerEvent('gcIdentity:showIdentity'))

-- (client) Display your identity card
TriggerServerEvent('gcIdentity:openMeIdentity')
```


```lua

### EXPORTS ###
-- @export, Recover your identity
export.gcidentity:getIdentity()

```