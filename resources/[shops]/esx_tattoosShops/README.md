# esx_tattooshop
Tattoo shop for FXServer built on top of ESX. Modified and improved fork by the ESX dev team.

- [FiveM forum thread](https://forum.fivem.net/t/release-esx-tattoos-shops/51496)

### Requirements
- [skinchanger](https://github.com/ESX-Org/skinchanger)
- [esx_skin](https://github.com/ESX-Org/esx_skin)

## Download & Installation

### Using [fvm](https://github.com/qlaffont/fvm-installer)
```
fvm install --save --folder=esx esx-public/esx_tattooshop
```

### Using Git
```
cd resources
git clone https://github.com/ESX-PUBLIC/esx_tattooshop [esx]/esx_tattooshop
```

### Manually
- Download https://github.com/ESX-PUBLIC/esx_tattooshop/archive/master.zip
- Put it in the `[esx]` directory

## Installation
- Import `esx_tattooshop.sql` in your database
- Add this in your server.cfg :

```
start esx_tattooshop
```