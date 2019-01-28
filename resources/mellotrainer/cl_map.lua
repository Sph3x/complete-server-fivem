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

function createAllMapBlips()
	open1 = AddBlipForCoord(2448.48, 4977.57, 57.4330);
	open2 = AddBlipForCoord(-71.5885, 6264.2, 31.2179); --cluckin bell
	open3 = AddBlipForCoord(3620.4, 3743.74, 28.6901); --humane labs
	open4 = AddBlipForCoord(1121.54, 2641.9, 41.2971); --motel
	open5 = AddBlipForCoord(2330.66, 2573.8, 46.7123); --battery garage
	open6 = AddBlipForCoord(1391.94, 1146.21, 118.749); --farm mansion
	open7 = AddBlipForCoord(-3092.93, 346.163, 14.4409); --beach condo
	open8 = AddBlipForCoord(-774.938, 310.977, 85.6981); --eclipse tower
	open9 = AddBlipForCoord(241.353, 361.132, 121.082); --epsilon off-street storage room
	open10 = AddBlipForCoord(-107.61, -9.10006, 78.8356); --small apt
	open11 = AddBlipForCoord(-1044.94, -230.653, 39.0144); --life invader
	open12 = AddBlipForCoord(-632.481, -238.269, 38.0723); --vangelico jewellery
	open13 = AddBlipForCoord(-583.175, -282.91, 35.4548); --unfinished building
	open14 = AddBlipForCoord(-1012.51, -480.672, 39.9707); --solomons
	open15 = AddBlipForCoord(-1896.4, -570.371, 11.8312); --beach condo2
	open16 = AddBlipForCoord(137.559, -613.671, 44.2187); --iaa
	open17 = AddBlipForCoord(104.346, -744.276, 45.7547); --fib
	open18 = AddBlipForCoord(-74.4777, -681.664, 33.8156); --union depository parking lot
	open19 = AddBlipForCoord(289.682, -584.825, 43.2609); --hospital interior entrance
	open20 = AddBlipForCoord(718.132, -976.571, 24.909); -- lester kuruma heist setup warehouse
	open21 = AddBlipForCoord(-61.1991, -1093.43, 26.4959); --bring stolen cars here, premium deluxe motor sports
	open22 = AddBlipForCoord(-1353.12, -1127.52, 4.06726); --medium apartment
	open23 = AddBlipForCoord(-1149.36, -1522.7, 10.6281); --cousin floyd's apartment
	open24 = AddBlipForCoord(-610.156, -1608.65, 26.8976); --rogers salvage scrap
	open25 = AddBlipForCoord(-253.885, -2027.53, 29.946); --fame or shame audition
	open26 = AddBlipForCoord(-14.3065, -1442.07, 31.1011); --franklins
	open27 = AddBlipForCoord(239.485, -1380.89, 33.7418); --alt hospital entrance
	open28 = AddBlipForCoord(486.97, -1314.74, 29.234); --hayes auto garage
	open29 = AddBlipForCoord(257.477, -1722.68, 29.6541); --lamars?
	open30 = AddBlipForCoord(132.582, -2203.08, 7.18643); --torture garage
	open31 = AddBlipForCoord(959.647, -2185.74, 30.5073); --cattle butchery
	open32 = AddBlipForCoord(1083.29, -1974.89, 32.4946); --metal refinery
	open33 = AddBlipForCoord(1275.04, -1721.64, 54.6551); --lesters
	open34 = AddBlipForCoord(-622.681, 58.0646, 43.2455); --one of the high class apts i forget name
	--	open35 = AddBlipForCoord(5321.08, -5188.19, 83.5188); --north yankton bank

	SetBlipSprite(open1, 357);
	SetBlipSprite(open2, 357);
	SetBlipSprite(open3, 357);
	SetBlipSprite(open4, 357);
	SetBlipSprite(open5, 357);
	SetBlipSprite(open6, 357);
	SetBlipSprite(open7, 357);
	SetBlipSprite(open8, 357);
	SetBlipSprite(open9, 357);
	SetBlipSprite(open10, 357);
	SetBlipSprite(open11, 357);
	SetBlipSprite(open12, 357);
	SetBlipSprite(open13, 357);
	SetBlipSprite(open14, 357);
	SetBlipSprite(open15, 357);
	SetBlipSprite(open16, 357);
	SetBlipSprite(open17, 357);
	SetBlipSprite(open18, 357);
	SetBlipSprite(open19, 357);
	SetBlipSprite(open20, 357);
	SetBlipSprite(open21, 357);
	SetBlipSprite(open22, 357);
	SetBlipSprite(open23, 357);
	SetBlipSprite(open24, 357);
	SetBlipSprite(open25, 357);
	SetBlipSprite(open26, 357);
	SetBlipSprite(open27, 357);
	SetBlipSprite(open28, 357);
	SetBlipSprite(open29, 357);
	SetBlipSprite(open30, 357);
	SetBlipSprite(open31, 357);
	SetBlipSprite(open32, 357);
	SetBlipSprite(open33, 357);
	SetBlipSprite(open34, 357);
	--	SetBlipSprite(open35, 367);

	SetBlipColour(open1, 0);
	SetBlipColour(open2, 0);
	SetBlipColour(open3, 0);
	SetBlipColour(open4, 0);
	SetBlipColour(open5, 0);
	SetBlipColour(open6, 0);
	SetBlipColour(open7, 0);
	SetBlipColour(open8, 0);
	SetBlipColour(open9, 0);
	SetBlipColour(open10, 0);
	SetBlipColour(open11, 0);
	SetBlipColour(open12, 0);
	SetBlipColour(open13, 0);
	SetBlipColour(open14, 0);
	SetBlipColour(open15, 0);
	SetBlipColour(open16, 0);
	SetBlipColour(open17, 0);
	SetBlipColour(open18, 0);
	SetBlipColour(open19, 0);
	SetBlipColour(open20, 0);
	SetBlipColour(open21, 0);
	SetBlipColour(open22, 0);
	SetBlipColour(open23, 0);
	SetBlipColour(open24, 0);
	SetBlipColour(open25, 0);
	SetBlipColour(open26, 0);
	SetBlipColour(open27, 0);
	SetBlipColour(open28, 0);
	SetBlipColour(open29, 0);
	SetBlipColour(open30, 0);
	SetBlipColour(open31, 0);
	SetBlipColour(open32, 0);
	SetBlipColour(open33, 0);
	SetBlipColour(open34, 0);
	--	SetBlipColour(open35, 24);


	SetBlipAsShortRange(open1, 1);
	SetBlipAsShortRange(open2, 1);
	SetBlipAsShortRange(open3, 1);
	SetBlipAsShortRange(open4, 1);
	SetBlipAsShortRange(open5, 1);
	SetBlipAsShortRange(open6, 1);
	SetBlipAsShortRange(open7, 1);
	SetBlipAsShortRange(open8, 1);
	SetBlipAsShortRange(open9, 1);
	SetBlipAsShortRange(open10, 1);
	SetBlipAsShortRange(open11, 1);
	SetBlipAsShortRange(open12, 1);
	SetBlipAsShortRange(open13, 1);
	SetBlipAsShortRange(open14, 1);
	SetBlipAsShortRange(open15, 1);
	SetBlipAsShortRange(open16, 1);
	SetBlipAsShortRange(open17, 1);
	SetBlipAsShortRange(open18, 1);
	SetBlipAsShortRange(open19, 1);
	SetBlipAsShortRange(open20, 1);
	SetBlipAsShortRange(open21, 1);
	SetBlipAsShortRange(open22, 1);
	SetBlipAsShortRange(open23, 1);
	SetBlipAsShortRange(open24, 1);
	SetBlipAsShortRange(open25, 1);
	SetBlipAsShortRange(open26, 1);
	SetBlipAsShortRange(open27, 1);
	SetBlipAsShortRange(open28, 1);
	SetBlipAsShortRange(open29, 1);
	SetBlipAsShortRange(open30, 1);
	SetBlipAsShortRange(open31, 1);
	SetBlipAsShortRange(open32, 1);
	SetBlipAsShortRange(open33, 1);
	SetBlipAsShortRange(open34, 1);
	--	SetBlipAsShortRange(open35, 1);

	--shirt icons --71 pale yellow
	ponsonbys1 = AddBlipForCoord(-712.407, -153.909, 44.9965);
	ponsonbys2 = AddBlipForCoord(-158.312, -305.009, 81.6358);
	ponsonbys3 = AddBlipForCoord(-1455.1, -233.229, 53.6423);
	SetBlipSprite(ponsonbys1, 73);
	SetBlipSprite(ponsonbys2, 73);
	SetBlipSprite(ponsonbys3, 73);
	SetBlipColour(ponsonbys1, 71);
	SetBlipColour(ponsonbys2, 71);
	SetBlipColour(ponsonbys3, 71);
	SetBlipAsShortRange(ponsonbys1, 1);
	SetBlipAsShortRange(ponsonbys2, 1);
	SetBlipAsShortRange(ponsonbys3, 1);

	--shirt icons --71 pale yellow
	discount1 = AddBlipForCoord(80.665, -1391.67, 34.8334);
	discount2 = AddBlipForCoord(1687.98, 4820.54, 45.9631);
	discount3 = AddBlipForCoord(-1098.12, 2709.18, 19.1079);
	discount4 = AddBlipForCoord(1197.97, 2704.22, 43.0591);
	discount5 = AddBlipForCoord(-0.823129, 6514.77, 36.1644);
	SetBlipSprite(discount1, 73);
	SetBlipSprite(discount2, 73);
	SetBlipSprite(discount3, 73);
	SetBlipSprite(discount4, 73);
	SetBlipSprite(discount5, 73);
	SetBlipColour(discount1, 71);
	SetBlipColour(discount2, 71);
	SetBlipColour(discount3, 71);
	SetBlipColour(discount4, 71);
	SetBlipColour(discount5, 71);
	SetBlipAsShortRange(discount1, 1);
	SetBlipAsShortRange(discount2, 1);
	SetBlipAsShortRange(discount3, 1);
	SetBlipAsShortRange(discount4, 1);
	SetBlipAsShortRange(discount5, 1);

	--shirt icons --71 pale yellow
	binco1 = AddBlipForCoord(-818.52, -1077.54, 15.4707);
	binco2 = AddBlipForCoord(419.633, -809.586, 36.2622);
	SetBlipSprite(binco1, 73);
	SetBlipSprite(binco2, 73);
	SetBlipColour(binco1, 71);
	SetBlipColour(binco2, 71);
	SetBlipAsShortRange(binco1, 1);
	SetBlipAsShortRange(binco2, 1);

	--shirt icons --71 pale yellow
	suburban1 = AddBlipForCoord(-1199.71, -776.697, 26.2131);
	suburban2 = AddBlipForCoord(618.287, 2752.56, 48.5239);
	suburban3 = AddBlipForCoord(126.786, -212.513, 59.8468);
	suburban4 = AddBlipForCoord(-3168.87, 1055.28, 27.6547);
	SetBlipSprite(suburban1, 73);
	SetBlipSprite(suburban2, 73);
	SetBlipSprite(suburban3, 73);
	SetBlipSprite(suburban4, 73);
	SetBlipColour(suburban1, 71);
	SetBlipColour(suburban2, 71);
	SetBlipColour(suburban3, 71);
	SetBlipColour(suburban4, 71);
	SetBlipAsShortRange(suburban1, 1);
	SetBlipAsShortRange(suburban2, 1);
	SetBlipAsShortRange(suburban3, 1);
	SetBlipAsShortRange(suburban4, 1);

	--lsc --10 --icey grape
	lsc1 = AddBlipForCoord(-1145.29, -1991.23, 13.1622);
	lsc2 = AddBlipForCoord(723.129, -1089.07, 31.1061);
	lsc3 = AddBlipForCoord(-354.526, -135.274, 59.9924);
	lsc4 = AddBlipForCoord(1174.8, 2644.42, 43.5054);
	lsc5 = AddBlipForCoord(110.046, 6623.03, 39.2303); --beekers
	lsc6 = AddBlipForCoord(-207.123, -1310.3, 31.296); --bennys shop
	SetBlipSprite(lsc1, 72);
	SetBlipSprite(lsc2, 72);
	SetBlipSprite(lsc3, 72);
	SetBlipSprite(lsc4, 72);
	SetBlipSprite(lsc5, 72);
	SetBlipSprite(lsc6, 72);
	SetBlipColour(lsc1, 10);
	SetBlipColour(lsc2, 10);
	SetBlipColour(lsc3, 10);
	SetBlipColour(lsc4, 10);
	SetBlipColour(lsc5, 10);
	SetBlipColour(lsc6, 10);
	SetBlipAsShortRange(lsc1, 1);
	SetBlipAsShortRange(lsc2, 1);
	SetBlipAsShortRange(lsc3, 1);
	SetBlipAsShortRange(lsc4, 1);
	SetBlipAsShortRange(lsc5, 1);
	SetBlipAsShortRange(lsc6, 1);

	--tattoos --41 --flesh
	tattoo1 = AddBlipForCoord(321.737, 179.474, 127.758);
	tattoo2 = AddBlipForCoord(1861.78, 3750.06, 37.2415);
	tattoo3 = AddBlipForCoord(-290.16, 6199.09, 35.6482);
	tattoo4 = AddBlipForCoord(-1156.55, -1420.59, 1126.49);
	tattoo5 = AddBlipForCoord(1322.4, -1651.04, 57.4641);
	tattoo6 = AddBlipForCoord(-3196.48, 1074.81, 25.4839);
	SetBlipSprite(tattoo1, 75);
	SetBlipSprite(tattoo2, 75);
	SetBlipSprite(tattoo3, 75);
	SetBlipSprite(tattoo4, 75);
	SetBlipSprite(tattoo5, 75);
	SetBlipSprite(tattoo6, 75);
	SetBlipColour(tattoo1, 41);
	SetBlipColour(tattoo2, 41);
	SetBlipColour(tattoo3, 41);
	SetBlipColour(tattoo4, 41);
	SetBlipColour(tattoo5, 41);
	SetBlipColour(tattoo6, 41);
	SetBlipAsShortRange(tattoo1, 1);
	SetBlipAsShortRange(tattoo2, 1);
	SetBlipAsShortRange(tattoo3, 1);
	SetBlipAsShortRange(tattoo4, 1);
	SetBlipAsShortRange(tattoo5, 1);
	SetBlipAsShortRange(tattoo6, 1);

	--gun --6 -- red
	ammo1 = AddBlipForCoord(1697.88, 3753.23, 39.1827);
	ammo2 = AddBlipForCoord(244.749, -45.6379, 83.3083);
	ammo3 = AddBlipForCoord(843.485, -1025.05, 37.0438);
	ammo4 = AddBlipForCoord(-325.984, 6077.07, 37.1471);
	ammo5 = AddBlipForCoord(-664.477, -944.667, 21.7855);
	ammo6 = AddBlipForCoord(-1313.87, -391.032, 43.3075);
	ammo7 = AddBlipForCoord(-1112.89, 2690.44, 18.5839);
	ammo8 = AddBlipForCoord(-3165.23, 1082.86, 25.4796);
	ammo9 = AddBlipForCoord(2569.69, 302.509, 117.451);
	ammo10 = AddBlipForCoord(812.434, -2148.97, 39.4198); --shooting range icon
	ammo11 = AddBlipForCoord(17.7044, -1114.19, 42.373); --shooting range icon
	SetBlipSprite(ammo1, 110);
	SetBlipSprite(ammo2, 110);
	SetBlipSprite(ammo3, 110);
	SetBlipSprite(ammo4, 110);
	SetBlipSprite(ammo5, 110);
	SetBlipSprite(ammo6, 110);
	SetBlipSprite(ammo7, 110);
	SetBlipSprite(ammo8, 110);
	SetBlipSprite(ammo9, 110);
	SetBlipSprite(ammo10, 313);
	SetBlipSprite(ammo11, 313);
	SetBlipColour(ammo1, 6);
	SetBlipColour(ammo2, 6);
	SetBlipColour(ammo3, 6);
	SetBlipColour(ammo4, 6);
	SetBlipColour(ammo5, 6);
	SetBlipColour(ammo6, 6);
	SetBlipColour(ammo7, 6);
	SetBlipColour(ammo8, 6);
	SetBlipColour(ammo9, 6);
	SetBlipColour(ammo10, 6);
	SetBlipColour(ammo11, 6);
	SetBlipAsShortRange(ammo1, 1);
	SetBlipAsShortRange(ammo2, 1);
	SetBlipAsShortRange(ammo3, 1);
	SetBlipAsShortRange(ammo4, 1);
	SetBlipAsShortRange(ammo5, 1);
	SetBlipAsShortRange(ammo6, 1);
	SetBlipAsShortRange(ammo7, 1);
	SetBlipAsShortRange(ammo8, 1);
	SetBlipAsShortRange(ammo9, 1);
	SetBlipAsShortRange(ammo10, 1);
	SetBlipAsShortRange(ammo11, 1);

	--barber --15 --light blue
	barber1 = AddBlipForCoord(-822.051, -187.093, 48.1654);
	barber2 = AddBlipForCoord(133.515, -1710.83, 36.5914);
	barber3 = AddBlipForCoord(-1287.14, -1116.47, 10.1592);
	barber4 = AddBlipForCoord(1933.07, 3726.17, 36.7415);
	barber5 = AddBlipForCoord(1208.28, -470.83, 71.8597);
	barber6 = AddBlipForCoord(-30.4352, -147.733, 62.3003);
	barber7 = AddBlipForCoord(-280.715, 6231.77, 37.1876);
	SetBlipSprite(barber1, 71);
	SetBlipSprite(barber2, 71);
	SetBlipSprite(barber3, 71);
	SetBlipSprite(barber4, 71);
	SetBlipSprite(barber5, 71);
	SetBlipSprite(barber6, 71);
	SetBlipSprite(barber7, 71);
	SetBlipColour(barber1, 15);
	SetBlipColour(barber2, 15);
	SetBlipColour(barber3, 15);
	SetBlipColour(barber4, 15);
	SetBlipColour(barber5, 15);
	SetBlipColour(barber6, 15);
	SetBlipColour(barber7, 15);
	SetBlipAsShortRange(barber1, 1);
	SetBlipAsShortRange(barber2, 1);
	SetBlipAsShortRange(barber3, 1);
	SetBlipAsShortRange(barber4, 1);
	SetBlipAsShortRange(barber5, 1);
	SetBlipAsShortRange(barber6, 1);
	SetBlipAsShortRange(barber7, 1);

	--store --43 --light green
	store1 = AddBlipForCoord(-1486.71, -381.852, 40.1634);
	store2 = AddBlipForCoord(-1224.04, -906.344, 12.3264);
	store3 = AddBlipForCoord(-711.191, -912.376, 19.2156);
	store4 = AddBlipForCoord(29.5184, -1344.23, 29.497);
	store5 = AddBlipForCoord(-48.8503, -1753.41, 29.421);
	store6 = AddBlipForCoord(1159.23, -322.147, 69.205);
	store7 = AddBlipForCoord(1138.09, -981.366, 46.4158);
	store8 = AddBlipForCoord(378.322, 327.247, 103.566);
	store9 = AddBlipForCoord(1699.92, 4927.63, 42.0637);
	store10 = AddBlipForCoord(1965.32, 3739.66, 31.6488);
	store11 = AddBlipForCoord(-2974.7, 390.901, 15.0319);
	store12 = AddBlipForCoord(2683.1, 3282.11, 55.2406);

	SetBlipSprite(store1, 52);
	SetBlipSprite(store2, 52);
	SetBlipSprite(store3, 52);
	SetBlipSprite(store4, 52);
	SetBlipSprite(store5, 52);
	SetBlipSprite(store6, 52);
	SetBlipSprite(store7, 52);
	SetBlipSprite(store8, 52);
	SetBlipSprite(store9, 52);
	SetBlipSprite(store10, 52);
	SetBlipSprite(store11, 52);
	SetBlipSprite(store12, 52);
	SetBlipColour(store1, 43);
	SetBlipColour(store2, 43);
	SetBlipColour(store3, 43);
	SetBlipColour(store4, 43);
	SetBlipColour(store5, 43);
	SetBlipColour(store6, 43);
	SetBlipColour(store7, 43);
	SetBlipColour(store8, 43);
	SetBlipColour(store9, 43);
	SetBlipColour(store10, 43);
	SetBlipColour(store11, 43);
	SetBlipColour(store12, 43);
	SetBlipAsShortRange(store1, 1);
	SetBlipAsShortRange(store2, 1);
	SetBlipAsShortRange(store3, 1);
	SetBlipAsShortRange(store4, 1);
	SetBlipAsShortRange(store5, 1);
	SetBlipAsShortRange(store6, 1);
	SetBlipAsShortRange(store7, 1);
	SetBlipAsShortRange(store8, 1);
	SetBlipAsShortRange(store9, 1);
	SetBlipAsShortRange(store10, 1);
	SetBlipAsShortRange(store11, 1);
	SetBlipAsShortRange(store12, 1);

	--cops --54 --dark blue
	policestation1 = AddBlipForCoord(430.568, -979.734, 43.6916); --4
	policestation2 = AddBlipForCoord(642.056, 0.739643, 82.7867); --1
	policestation4 = AddBlipForCoord(-445.692, 6014.96, 31.7164); --5 --los santos sheriff
	policestation5 = AddBlipForCoord(-635.936, -121.363, 38.9876); --2 firestation
	policestation6 = AddBlipForCoord(1853.78, 3685.63, 43.2671);--county sherff
	policestation7 = AddBlipForCoord(-378.117, 6117.44, 35.4394); --firestation
	policestation8 = AddBlipForCoord(1696.98, 3586.01, 34.8975); --firestation
	policestation9 = AddBlipForCoord(360.454, -1584.85, 29.2919); --davis sheriff
	policestation10 = AddBlipForCoord(827.447, -1290.29, 28.2407); --lspd
	policestation11 = AddBlipForCoord(-1108.19, -845.159, 19.3169); --vespucci police dep
	SetBlipSprite(policestation1, 60);
	SetBlipSprite(policestation2, 60);
	SetBlipSprite(policestation4, 60);
	SetBlipSprite(policestation5, 60);
	SetBlipSprite(policestation6, 60);
	SetBlipSprite(policestation7, 60);
	SetBlipSprite(policestation8, 60);
	SetBlipSprite(policestation9, 60);
	SetBlipSprite(policestation10, 60);
	SetBlipSprite(policestation11, 60);
	SetBlipColour(policestation1, 54);
	SetBlipColour(policestation2, 54);
	SetBlipColour(policestation4, 54);
	SetBlipColour(policestation5, 59); --fire station red
	SetBlipColour(policestation6, 54);
	SetBlipColour(policestation7, 59); --fire station red
	SetBlipColour(policestation8, 59); --fire station red
	SetBlipColour(policestation9, 54);
	SetBlipColour(policestation10, 54);
	SetBlipColour(policestation11, 54);
	SetBlipAsShortRange(policestation1, 1);
	SetBlipAsShortRange(policestation2, 1);
	SetBlipAsShortRange(policestation4, 1);
	SetBlipAsShortRange(policestation5, 1);
	SetBlipAsShortRange(policestation6, 1);
	SetBlipAsShortRange(policestation7, 1);
	SetBlipAsShortRange(policestation8, 1);
	SetBlipAsShortRange(policestation9, 1);
	SetBlipAsShortRange(policestation10, 1);
	SetBlipAsShortRange(policestation11, 1);

	--banks --2 --money green
	bank1 = AddBlipForCoord(246.205, 215.997, 106.287); --pac
	bank2 = AddBlipForCoord(-1212.97, -330.251, 37.787); --fleeca
	bank3 = AddBlipForCoord(149.762, -1040.02, 29.3741); --fleeca
	bank4 = AddBlipForCoord(-75.015, -818.215, 326.176); --maze
	bank5 = AddBlipForCoord(-112.424, 6465.32, 37.2196); --blaine
	bank6 = AddBlipForCoord(-1379.25, -504.262, 33.1574); --blaine
	bank7 = AddBlipForCoord(-2966.27, 482.97, 15.6927); --fleeca
	SetBlipSprite(bank1, 108);
	SetBlipSprite(bank2, 108);
	SetBlipSprite(bank3, 108);
	SetBlipSprite(bank4, 431); --tower
	SetBlipSprite(bank5, 108);
	SetBlipSprite(bank6, 431); --tower
	SetBlipSprite(bank7, 108);
	SetBlipColour(bank1, 2);
	SetBlipColour(bank2, 2);
	SetBlipColour(bank3, 2);
	SetBlipColour(bank4, 2);
	SetBlipColour(bank5, 2);
	SetBlipColour(bank6, 2);
	SetBlipColour(bank7, 2);
	SetBlipAsShortRange(bank1, 1);
	SetBlipAsShortRange(bank2, 1);
	SetBlipAsShortRange(bank3, 1);
	SetBlipAsShortRange(bank4, 1);
	SetBlipAsShortRange(bank5, 1);
	SetBlipAsShortRange(bank6, 1);
	SetBlipAsShortRange(bank7, 1);

	--cablecar --47 --orange
	cablecar1 = AddBlipForCoord(-742.192, 5594.84, 50.6404);
	cablecar2 = AddBlipForCoord(446.409, 5571.24, 795.165);
	SetBlipSprite(cablecar1, 36);
	SetBlipSprite(cablecar2, 36);
	SetBlipColour(cablecar1, 47);
	SetBlipColour(cablecar2, 47);
	SetBlipAsShortRange(cablecar1, 1);
	SetBlipAsShortRange(cablecar2, 1);

	--carwash --15 --greenishblue
	carwash1 = AddBlipForCoord(-699.612, -933.865, 24.1095);
	carwash2 = AddBlipForCoord(24.6443, -1397.63, 33.9966);
	SetBlipSprite(carwash1, 100);
	SetBlipSprite(carwash2, 100);
	SetBlipColour(carwash1, 15);
	SetBlipColour(carwash2, 15);
	SetBlipAsShortRange(carwash1, 1);
	SetBlipAsShortRange(carwash2, 1);

	--airplay icon --57 --sky blue
	airport1 = AddBlipForCoord(-1333.18, -3044.55, 13.9443); --flight school icon
	airport2 = AddBlipForCoord(1381.67, 3130.1, 40.8185); --sandy shores
	airport3 = AddBlipForCoord(2044.32, 4768.07, 40.7285);
	SetBlipSprite(airport1, 90);
	SetBlipSprite(airport2, 90);
	SetBlipSprite(airport3, 90);
	SetBlipColour(airport1, 57);
	SetBlipColour(airport2, 57);
	SetBlipColour(airport3, 57);
	SetBlipAsShortRange(airport1, 1);
	SetBlipAsShortRange(airport2, 1);
	SetBlipAsShortRange(airport3, 1);

	--stripclub --8 --pink
	stripclub = AddBlipForCoord(135.023, -1297.88, 35.0099);
	SetBlipSprite(stripclub, 121);
	SetBlipColour(stripclub, 8);
	SetBlipAsShortRange(stripclub, 1);

	--helipad --53 --white blue
	helipad = AddBlipForCoord(-736.423, -1456.24, 5.00053);
	SetBlipSprite(helipad, 64);
	SetBlipColour(helipad, 53);
	SetBlipAsShortRange(helipad, 1);

	--boats --53 --white blue
	boat1 = AddBlipForCoord(-843.455, -1367.09, 1.60517); --marina
	--	boat2 = AddBlipForCoord(-2080.47, -1019.38, 8.97115); --yachte
	--	boat3 = AddBlipForCoord(3080.01, -4711.38, 15.3039); --carrier
	SetBlipSprite(boat1, 410);
	--	SetBlipSprite(boat2, 410);
	--	SetBlipSprite(boat3, 410);
	SetBlipColour(boat1, 53);
	--	SetBlipColour(boat2, 53);
	--	SetBlipColour(boat3, 53);
	SetBlipAsShortRange(boat1, 1);
	--	SetBlipAsShortRange(boat2, 1);
	--	SetBlipAsShortRange(boat3, 1);

	--music note --82 --lght green
	rebel = AddBlipForCoord(736.153, 2583.14, 79.6342);
	SetBlipSprite(rebel, 136);
	SetBlipScale(rebel, 0.9);
	SetBlipColour(rebel, 82);
	SetBlipAsShortRange(rebel, 1);

	--theater --16 --cream
	theater1 = AddBlipForCoord(297.221, 196.986, 104.333);
	theater2 = AddBlipForCoord(-1422.41, -209.281, 5452.14);
	theater3 = AddBlipForCoord(395.852, -712.105, 85.6129);
	SetBlipSprite(theater1, 135);
	SetBlipSprite(theater2, 135);
	SetBlipSprite(theater3, 135);
	SetBlipColour(theater1, 16);
	SetBlipColour(theater2, 16);
	SetBlipColour(theater3, 16);
	SetBlipAsShortRange(theater1, 1);
	SetBlipAsShortRange(theater2, 1);
	SetBlipAsShortRange(theater3, 1);

	--Hospital --3 --blue
	hospital1 = AddBlipForCoord(355.202, -591.237, 74.1657);
	hospital2 = AddBlipForCoord(337.301, -1396.2, 32.5092);
	hospital3 = AddBlipForCoord(-473.578, -339.958, 91.0076);
	SetBlipSprite(hospital1, 61);
	SetBlipSprite(hospital2, 61);
	SetBlipSprite(hospital3, 61);
	SetBlipColour(hospital1, 3);
	SetBlipColour(hospital2, 3);
	SetBlipColour(hospital3, 3);
	SetBlipAsShortRange(hospital1, 1);
	SetBlipAsShortRange(hospital2, 1);
	SetBlipAsShortRange(hospital3, 1);

	--impound = AddBlipForCoord(-f, -f, f);
	--SetBlipSprite(impound, 225);
	--SetBlipScale(impound, 0.8);
	--SetBlipAsShortRange(impound, 1);

	--safehouse = AddBlipForCoord(-f, -f, f);
	--SetBlipSprite(safehouse, 40);
	--SetBlipAsShortRange(safehouse, 1);

	--garage = AddBlipForCoord(-f, -f, f);
	--SetBlipSprite(garage, 357);
	--SetBlipAsShortRange(garage, 1);

	--basejump = AddBlipForCoord(-f, -f, f);
	--SetBlipSprite(basejump, 94);
	--SetBlipAsShortRange(basejump, 1);

	--bar --27 --purple
	bar1 = AddBlipForCoord(-562.456, 281.841, 91.7978);
	bar2 = AddBlipForCoord(-1389.57, -587.167, 35.1147);
	SetBlipSprite(bar1, 93);
	SetBlipSprite(bar2, 93);
	SetBlipColour(bar1, 10);
	SetBlipColour(bar2, 10);
	SetBlipAsShortRange(bar1, 1);
	SetBlipAsShortRange(bar2, 1);

	--club --32 --mblue
	comedy = AddBlipForCoord(-436.48, 270.831, 89.8888);
	SetBlipSprite(comedy, 102);
	SetBlipColour(comedy, 32);
	SetBlipAsShortRange(comedy, 1);

	--pill --36 --light yellow
	drugs = AddBlipForCoord(1391.77, 3608.72, 38.9419);
	SetBlipSprite(drugs, 51);
	SetBlipScale(drugs, 0.8);
	SetBlipColour(drugs, 36);
	SetBlipAsShortRange(drugs, 1);

	--weed --2-- green
	marijuana1 = AddBlipForCoord(2208.78, 5578.23, 53.7351);
	marijuana2 = AddBlipForCoord(-1171.82, -1573.06, 4.66363);
	SetBlipSprite(marijuana1, 140);
	SetBlipSprite(marijuana2, 140);
	SetBlipColour(marijuana1, 2);
	SetBlipColour(marijuana2, 2);
	SetBlipAsShortRange(marijuana1, 1);
	SetBlipAsShortRange(marijuana2, 1);
	--	SET_BLIP_HIGH_DETAIL(marijuana2, 1);

	-- altruist --31 --light brown
	altruist = AddBlipForCoord(-1170.84, 4926.65, 224.295);
	SetBlipSprite(altruist, 269);
	SetBlipColour(altruist, 31);
	SetBlipAsShortRange(altruist, 1);

	--sub --46 --yellow
	sub = AddBlipForCoord(-1597.59, 5251.11, 1.50652);
	SetBlipSprite(sub, 308);
	SetBlipColour(sub, 46);
	SetBlipAsShortRange(sub, 1);

	--masks --75 --evil red
	masks = AddBlipForCoord(-1336.09, -1278.12, 11.5885);
	SetBlipSprite(masks, 362);
	SetBlipColour(masks, 75);
	SetBlipAsShortRange(masks, 1);

	--ferriswheel  --77 --nice blue
	fairground = AddBlipForCoord(-1664.16, -1126.2, 13.2325);
	SetBlipSprite(fairground, 266);
	SetBlipColour(fairground, 77);
	SetBlipAsShortRange(fairground, 1);

	--golf --36 --canary yellow
	golf = AddBlipForCoord(-1325.35, 60.5766, 53.5388);
	SetBlipSprite(golf, 109);
	SetBlipColour(golf, 36);
	SetBlipAsShortRange(golf, 1);

	--tennis --24 --tennis ball green
	tennis = AddBlipForCoord(-1618.94, 265.868, 59.5503);
	SetBlipSprite(tennis, 122);
	SetBlipColour(tennis, 24);
	SetBlipAsShortRange(tennis, 1);

	--darts --76 --dark red
	darts = AddBlipForCoord(1992.32, 3050.51, 54.5371);
	SetBlipSprite(darts, 103);
	SetBlipColour(darts, 76);
	SetBlipAsShortRange(darts, 1);

	--playboy --8 --pink
	playboy = AddBlipForCoord(-1494.08, 144.034, 55.6527);
	SetBlipSprite(playboy, 176);
	SetBlipScale(playboy, 0.8);
	SetBlipColour(playboy, 8);
	SetBlipAsShortRange(playboy, 1);

	--fib --44 --burnt orange
	fib = AddBlipForCoord(150.126, -754.591, 262.865);
	SetBlipSprite(fib, 106);
	SetBlipScale(fib, 0.8);
	SetBlipColour(fib, 44);
	SetBlipAsShortRange(fib, 1);
end




function destroyAllMapBlips()
	RemoveBlip(open1)
	open1 = nil;
	RemoveBlip(open2)
	open2 = nil;
	RemoveBlip(open3)
	open3 = nil;
	RemoveBlip(open4)
	open4 = nil;
	RemoveBlip(open5)
	open5 = nil;
	RemoveBlip(open6)
	open6 = nil;
	RemoveBlip(open7)
	open7 = nil;
	RemoveBlip(open8)
	open8 = nil;
	RemoveBlip(open9)
	open9 = nil;
	RemoveBlip(open10)
	open10 = nil;
	RemoveBlip(open11)
	open11 = nil;
	RemoveBlip(open12)
	open12 = nil;
	RemoveBlip(open13)
	open13 = nil;
	RemoveBlip(open14)
	open14 = nil;
	RemoveBlip(open15)
	open15 = nil;
	RemoveBlip(open16)
	open16 = nil;
	RemoveBlip(open17)
	open17 = nil;
	RemoveBlip(open18)
	open18 = nil;
	RemoveBlip(open19)
	open19 = nil;
	RemoveBlip(open20)
	open20 = nil;
	RemoveBlip(open21)
	open21 = nil;
	RemoveBlip(open22)
	open22 = nil;
	RemoveBlip(open23)
	open23 = nil;
	RemoveBlip(open24)
	open24 = nil;
	RemoveBlip(open25)
	open25 = nil;
	RemoveBlip(open26)
	open26 = nil;
	RemoveBlip(open27)
	open27 = nil;
	RemoveBlip(open28)
	open28 = nil;
	RemoveBlip(open29)
	open29 = nil;
	RemoveBlip(open30)
	open30 = nil;
	RemoveBlip(open31)
	open31 = nil;
	RemoveBlip(open32)
	open32 = nil;
	RemoveBlip(open33)
	open33 = nil;
	RemoveBlip(open34)
	open34 = nil;
	--RemoveBlip(open35)
	--open35 = nil;
	RemoveBlip(ponsonbys1)
	ponsonbys1 = nil;
	RemoveBlip(ponsonbys2)
	ponsonbys2 = nil;
	RemoveBlip(ponsonbys3)
	ponsonbys3 = nil;
	RemoveBlip(discount1)
	discount1 = nil;
	RemoveBlip(discount2)
	discount2 = nil;
	RemoveBlip(discount3)
	discount3 = nil;
	RemoveBlip(discount4)
	discount4 = nil;
	RemoveBlip(discount5)
	discount5 = nil;
	RemoveBlip(binco1)
	binco1 = nil;
	RemoveBlip(binco2)
	binco2 = nil;
	RemoveBlip(suburban1)
	suburban1 = nil;
	RemoveBlip(suburban2)
	suburban2 = nil;
	RemoveBlip(suburban3)
	suburban3 = nil;
	RemoveBlip(suburban4)
	suburban4 = nil;
	RemoveBlip(lsc1)
	lsc1 = nil;
	RemoveBlip(lsc2)
	lsc2 = nil;
	RemoveBlip(lsc3)
	lsc3 = nil;
	RemoveBlip(lsc4)
	lsc4 = nil;
	RemoveBlip(lsc5)
	lsc5 = nil;
	RemoveBlip(lsc6)
	lsc6 = nil;
	RemoveBlip(tattoo1)
	tattoo1 = nil;
	RemoveBlip(tattoo2)
	tattoo2 = nil;
	RemoveBlip(tattoo3)
	tattoo3 = nil;
	RemoveBlip(tattoo4)
	tattoo4 = nil;
	RemoveBlip(tattoo5)
	tattoo5 = nil;
	RemoveBlip(tattoo6)
	tattoo6 = nil;
	RemoveBlip(ammo1)
	ammo1 = nil;
	RemoveBlip(ammo2)
	ammo2 = nil;
	RemoveBlip(ammo3)
	ammo3 = nil;
	RemoveBlip(ammo4)
	ammo4 = nil;
	RemoveBlip(ammo5)
	ammo5 = nil;
	RemoveBlip(ammo6)
	ammo6 = nil;
	RemoveBlip(ammo7)
	ammo7 = nil;
	RemoveBlip(ammo8)
	ammo8 = nil;
	RemoveBlip(ammo9)
	ammo9 = nil;
	RemoveBlip(ammo10)
	ammo10 = nil;
	RemoveBlip(ammo11)
	ammo11 = nil;
	RemoveBlip(barber1)
	barber1 = nil;
	RemoveBlip(barber2)
	barber2 = nil;
	RemoveBlip(barber3)
	barber3 = nil;
	RemoveBlip(barber4)
	barber4 = nil;
	RemoveBlip(barber5)
	barber5 = nil;
	RemoveBlip(barber6)
	barber6 = nil;
	RemoveBlip(barber7)
	barber7 = nil;
	RemoveBlip(store1)
	store1 = nil;
	RemoveBlip(store2)
	store2 = nil;
	RemoveBlip(store3)
	store3 = nil;
	RemoveBlip(store4)
	store4 = nil;
	RemoveBlip(store5)
	store5 = nil;
	RemoveBlip(store6)
	store6 = nil;
	RemoveBlip(store7)
	store7 = nil;
	RemoveBlip(store8)
	store8 = nil;
	RemoveBlip(store9)
	store9 = nil;
	RemoveBlip(store10)
	store10 = nil;
	RemoveBlip(store11)
	store11 = nil;
	RemoveBlip(store12)
	store12 = nil;
	RemoveBlip(policestation1)
	policestation1 = nil;
	RemoveBlip(policestation2)
	policestation2 = nil;
	RemoveBlip(policestation4)
	policestation4 = nil;
	RemoveBlip(policestation5)
	policestation5 = nil;
	RemoveBlip(policestation6)
	policestation6 = nil;
	RemoveBlip(policestation7)
	policestation7 = nil;
	RemoveBlip(policestation8)
	policestation8 = nil;
	RemoveBlip(policestation9)
	policestation9 = nil;
	RemoveBlip(policestation10)
	policestation10 = nil;
	RemoveBlip(policestation11)
	policestation11 = nil;
	RemoveBlip(bank1)
	bank1 = nil;
	RemoveBlip(bank2)
	bank2 = nil;
	RemoveBlip(bank3)
	bank3 = nil;
	RemoveBlip(bank4)
	bank4 = nil;
	RemoveBlip(bank5)
	bank5 = nil;
	RemoveBlip(bank6)
	bank6 = nil;
	RemoveBlip(bank7)
	bank7 = nil;
	RemoveBlip(cablecar1)
	cablecar1 = nil;
	RemoveBlip(cablecar2)
	cablecar2 = nil;
	RemoveBlip(carwash1)
	carwash1 = nil;
	RemoveBlip(carwash2)
	carwash2 = nil;
	RemoveBlip(airport1)
	airport1 = nil;
	RemoveBlip(airport2)
	airport2 = nil;
	RemoveBlip(airport3)
	airport3 = nil;
	RemoveBlip(stripclub)
	stripclub = nil;
	RemoveBlip(helipad)
	helipad = nil;
	RemoveBlip(boat1)
	boat1 = nil;
	RemoveBlip(rebel)
	rebel = nil;
	RemoveBlip(theater1)
	theater1 = nil;
	RemoveBlip(theater2)
	theater2 = nil;
	RemoveBlip(theater3)
	theater3 = nil;
	RemoveBlip(hospital1)
	hospital1 = nil;
	RemoveBlip(hospital2)
	hospital2 = nil;
	RemoveBlip(hospital3)
	hospital3 = nil;
	RemoveBlip(bar1)
	bar1 = nil;
	RemoveBlip(bar2)
	bar2 = nil;
	RemoveBlip(comedy)
	comedy = nil;
	RemoveBlip(drugs)
	drugs = nil;
	RemoveBlip(marijuana1)
	marijuana1 = nil;
	RemoveBlip(marijuana2)
	marijuana2 = nil;
	RemoveBlip(altruist)
	altruist = nil;
	RemoveBlip(sub)
	sub = nil;
	RemoveBlip(masks)
	masks = nil;
	RemoveBlip(fairground)
	fairground = nil;
	RemoveBlip(golf)
	golf = nil;
	RemoveBlip(tennis)
	tennis = nil;
	RemoveBlip(darts)
	darts = nil;
	RemoveBlip(playboy)
	playboy = nil;
	RemoveBlip(fib)
	fib = nil;

end


function toggleMapBlips(toggle)
	if(toggle)then
		createAllMapBlips()
		drawNotification("Map Blips have been added.")
	else
		destroyAllMapBlips()
		drawNotification("Map Blips have been removed.")
	end

end