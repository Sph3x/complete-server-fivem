/** CONFIG **/
var resourcename = "mellotrainer";  // Resource Name
var maxVisibleItems = 10;           // Max amount of items in 1 menu (before autopaging kicks in)


// DO NOT TOUCH ANTYHING BELOW HERE!!! CONTACT THESTONEDTURTLE IF ANY ISSUES
// DO NOT TOUCH ANTYHING BELOW HERE!!! CONTACT THESTONEDTURTLE IF ANY ISSUES
// DO NOT TOUCH ANTYHING BELOW HERE!!! CONTACT THESTONEDTURTLE IF ANY ISSUES
// DO NOT TOUCH ANTYHING BELOW HERE!!! CONTACT THESTONEDTURTLE IF ANY ISSUES
// DO NOT TOUCH ANTYHING BELOW HERE!!! CONTACT THESTONEDTURTLE IF ANY ISSUES


/***
 *     __      __                 _           _       _            _____                  _                          _     _                 
 *     \ \    / /                (_)         | |     | |          |  __ \                | |                        | |   (_)                
 *      \ \  / /    __ _   _ __   _    __ _  | |__   | |   ___    | |  | |   ___    ___  | |   __ _   _ __    __ _  | |_   _    ___    _ __  
 *       \ \/ /    / _` | | '__| | |  / _` | | '_ \  | |  / _ \   | |  | |  / _ \  / __| | |  / _` | | '__|  / _` | | __| | |  / _ \  | '_ \ 
 *        \  /    | (_| | | |    | | | (_| | | |_) | | | |  __/   | |__| | |  __/ | (__  | | | (_| | | |    | (_| | | |_  | | | (_) | | | | |
 *         \/      \__,_| |_|    |_|  \__,_| |_.__/  |_|  \___|   |_____/   \___|  \___| |_|  \__,_| |_|     \__,_|  \__| |_|  \___/  |_| |_|
 *                                                                                                                                           
 *                                                                                                                                           
 */



// Trainer Memory for pages & options. Only works backwards.
var pageMemory = [];    // Holds memory of which page you were previously on
var optionMemory = [];  // Holds memory of which option you were previously on
var counter;            // Current Trainer Option
var maxamount;          // Max Amount of Options for Current Menu
var currentpage;        // Current Page Number
var content;            // Current Menu Content (Shown Menu Information)
var container;          // Trainer Container Div
var speedContainer;     // Speedometer Container Div
var speedText;          // Speedometer Text Div
var voiceContainer;     // Voice Menu Container Div
var voicePlayers;       // Container Div for Talking Players
var menus = {};         // Holds detached HTML elements of each menu (each div)
var menuLoaded = [];    // Dynamic Menu IDs are added/removed from here to prevent excess server requests
var dynamicIDs = {};    // Key:Value pair of action:menu created by JS
var dynamicMenus = {};  // Holds the original version of all dynamicMenus.



// Text/html variable templates
var trainerOption = "<p class='traineroption'></p>";    // Default traineroption p tag



// Variable to add to the `data-sub` attr to ensure you get the correct menu
var variablesToAdd = {"wheeltype":0,"wheelindex":0};




/***
 *      _____           _   _       _______                  _                       
 *     |_   _|         (_) | |     |__   __|                (_)                      
 *       | |    _ __    _  | |_       | |     _ __    __ _   _   _ __     ___   _ __ 
 *       | |   | '_ \  | | | __|      | |    | '__|  / _` | | | | '_ \   / _ \ | '__|
 *      _| |_  | | | | | | | |_       | |    | |    | (_| | | | | | | | |  __/ | |   
 *     |_____| |_| |_| |_|  \__|      |_|    |_|     \__,_| |_| |_| |_|  \___| |_|   
 *                                                                                   
 *                                                                                   
 */


// Called as soon as the page is ready
$(function() {
    // Update container variable for use throughout project.
    container = $("#trainercontainer");

    /** Containers for Speedometer **/
    speedContainer = $("#speedcontainer");
    speedText = $(".speedtext");


    /** Container for the voice menu **/
    voiceContainer = $("#voicecontainer")
    voicePlayers = $("#voiceActive")

    // Initialize the trainer.
    init();
    

    // Listen for messages from lua.
    window.addEventListener("message", function(event) {
        var item = event.data;
        
        /***
         *      _   _                _                _    _               
         *     | \ | |              (_)              | |  (_)              
         *     |  \| |  __ _ __   __ _   __ _   __ _ | |_  _   ___   _ __  
         *     | . ` | / _` |\ \ / /| | / _` | / _` || __|| | / _ \ | '_ \ 
         *     | |\  || (_| | \ V / | || (_| || (_| || |_ | || (_) || | | |
         *     |_| \_| \__,_|  \_/  |_| \__, | \__,_| \__||_| \___/ |_| |_|
         *                               __/ |                             
         *                              |___/                              
         */

        //showtrainer
        if (item.showtrainer) {
            resetTrainer();            
            container.show();
            playSound("YES");
        }

        // Hide Trainer
        if (item.resettrainer) {
            resetTrainer()
            container.hide();
            playSound("NO");
        }

        // Hide Trainer
        if (item.hidetrainer) {
            container.hide();
            playSound("NO");
        }
        
        // Select Options
        if (item.trainerenter) {
            handleSelectedOption(false);
        }

        // Previous Menu
        if (item.trainerback) {
            trainerBack();
        }
        
        // Up Option
        if (item.trainerup) {
            trainerUp();
        } 

        // Down Option
        if (item.trainerdown) {
            trainerDown();
        }
        
        // Previous Page
        if (item.trainerleft) {
            trainerPrevPage();
        } 

        // Next Page
        if (item.trainerright) {
            trainerNextPage();
        }

        // Flip the toggle back if there was an error executing.
        if (item.toggleerror){
            toggleError();
        }

        // If they passed the security check access the menu and skip the check
        if (item.vehicleaccess || item.adminaccess){
            handleSelectedOption(true);
        }

        // Update Speedometer Speed
        if (item.showspeed) {
            speedContainer.fadeIn();
            speedText.text(item.speed.toString().split(".")[0]);
        } 

        // Hide Speedometer
        if (item.hidespeed) {
           speedContainer.fadeOut();
        }

        if(item.hidevoice){
            voiceContainer.fadeOut()
            
        }

        if(item.showvoice){
            voiceContainer.fadeIn()
            var results = JSON.parse(item.talkingplayers)
            updateVoices(results);
        }

        if(item.statetoggles){
            var results = JSON.parse(item.statesdata)
            updateStateToggles(results,item.menuid)
        }


        /***
         *      __  __                             ____            _     _                       
         *     |  \/  |                           / __ \          | |   (_)                      
         *     | \  / |   ___   _ __    _   _    | |  | |  _ __   | |_   _    ___    _ __    ___ 
         *     | |\/| |  / _ \ | '_ \  | | | |   | |  | | | '_ \  | __| | |  / _ \  | '_ \  / __|
         *     | |  | | |  __/ | | | | | |_| |   | |__| | | |_) | | |_  | | | (_) | | | | | \__ \
         *     |_|  |_|  \___| |_| |_|  \__,_|    \____/  | .__/   \__| |_|  \___/  |_| |_| |___/
         *                                                | |                                    
         *                                                |_|                                    
         */

        // Create a menu with JSON Data from the server.  // Dynamic Menus
        if (item.createmenu){
            var newObject = JSON.parse(item.menudata);
            menuLoaded.push(item.menuName);
            createDynamicMenu(newObject,item.menuName);
        }

        // Create the Online Players Menu
        if(item.createonlineplayersmenu){
            var newObject = JSON.parse(item.menudata);
            menuLoaded.push(item.menuName);
            createDynamicMenu(newObject, item.menuName);

            // Remove from loaded menu array to always recreate menu
            menuLoaded.splice(menuLoaded.indexOf(item.menuName), 1);
        }

        // Used to update the wheel categories for vehicles.
        if (item.updateVariables){
            var newObject = JSON.parse(item.data);
            variablesToAdd['wheeltype'] = Number(newObject.wheeltype);
            variablesToAdd['wheelindex'] = Number(newObject.wheelindex);
        }

        // Resets the required dynamic menus so they refresh on next request.
        if (item.resetmenus){
            var items = item.resetmenus.split(" ");
            for(var i=0;i < items.length; i++){
                menuLoaded.splice(menuLoaded.indexOf(items[i]), 1);
            }
        }


        // Reshow Current Menu
        if(item.reshowmenu){

            // If Current menu is a Dynamic Menu then request updated information.
            var text = $(content.menu).attr("data-dynamicmenu");
            if(text){
                //sendData("debug","Reshowing Menu: "+text)
                menuLoaded.splice(menuLoaded.indexOf(text), 1);

                // Trigger NUI Callback for this menu
                sendData(text);
                return;
            }

            showMenu(menus[$(content.menu).attr("id")],false)
        }


        // Remove Selected Class from element.
        if(item.removeSelectedClass){
            $(".traineroption").eq(counter).removeClass("selected");
        }

    });
});



/***
 *       _____                           ______                          _     _                       
 *      / ____|                         |  ____|                        | |   (_)                      
 *     | |        ___    _ __    ___    | |__     _   _   _ __     ___  | |_   _    ___    _ __    ___ 
 *     | |       / _ \  | '__|  / _ \   |  __|   | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|
 *     | |____  | (_) | | |    |  __/   | |      | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \
 *      \_____|  \___/  |_|     \___|   |_|       \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/
 *                                                                                                     
 *                                                                                                     
 */


// Send data to lua for processing.
function sendData(name, data) {
    $.post("http://" + resourcename + "/" + name, JSON.stringify(data), function(datab) {
        if (datab != "ok"){
            console.log(datab);
        }            
    });
}


// Used to play a specific sound to the player.
function playSound(sound) {
    sendData("playsound", {name: sound});
}




// Create the Trainer.
function init() {
    // Create all Necessary Static Menus before splitting the HTML into "Menus"
    createStaticMenus();

    // Add the Menu and State Classes to all necessary elements.
    updateMenuClasses();
    updateStateClasses();

    // TODO: Apply user settings via state syncing


    // Find all elements that should be turned into menus.
    convertToMenus();


    // Update all state toggles to correct values.
    requestAllStates();
}

/***
 *      _______                  _                           _    _   _     _   _   _   _     _              
 *     |__   __|                (_)                         | |  | | | |   (_) | | (_) | |   (_)             
 *        | |     _ __    __ _   _   _ __     ___   _ __    | |  | | | |_   _  | |  _  | |_   _    ___   ___ 
 *        | |    | '__|  / _` | | | | '_ \   / _ \ | '__|   | |  | | | __| | | | | | | | __| | |  / _ \ / __|
 *        | |    | |    | (_| | | | | | | | |  __/ | |      | |__| | | |_  | | | | | | | |_  | | |  __/ \__ \
 *        |_|    |_|     \__,_| |_| |_| |_|  \___| |_|       \____/   \__| |_| |_| |_|  \__| |_|  \___| |___/
 *                                                                                                           
 *                                                                                                           
 */


// Adds the menuText class to any option that links to a menu.
function updateMenuClasses(){
    $(".traineroption").each(function(i, obj){
        if( $(this).attr('data-sub') ){
            if(!$(this).hasClass("menuText")){
                $(this).addClass("menuText");
            }
        }
    });
}


// Updates the class of toggle options based on the state of the toggle.
function updateStateClasses(){
    $(".traineroption").each(function(i, obj){
        if( $(this).attr('data-state') ){
            if ($(this).data("state") == "ON") {
                $(this).removeClass("stateOFF");
                if (!$(this).hasClass("stateON")){
                    $(this).addClass("stateON");
                }
            } else {
                $(this).removeClass("stateON");
                if (!$(this).hasClass("stateOFF")){
                    $(this).addClass("stateOFF");
                }
            }
        }
    });
}


// Toggle error, revert state of a toggle to previous value.
function toggleError(){
    var item = $(".traineroption.selected");

    if (item.attr("data-state") == "ON") {
        item.attr("data-state", "OFF");
        item.removeClass("stateON");
        item.addClass("stateOFF");
    } else if (item.attr("data-state") == "OFF") {
        item.attr("data-state", "ON");
        item.removeClass("stateOFF");
        item.addClass("stateON");
    }
}



// Toggle error, revert state of a toggle to previous value.
function toggleErrorIndex(){
    var item = $(".traineroption.selected");

    if (item.attr("data-state") == "ON") {
        item.attr("data-state", "OFF");
        item.removeClass("stateON");
        item.addClass("stateOFF");
    } else if (item.attr("data-state") == "OFF") {
        item.attr("data-state", "ON");
        item.removeClass("stateOFF");
        item.addClass("stateON");
    }
}


// Reset the trainer by showing the main menu.
function resetTrainer() {
    showMenu(menus["mainmenu"], true);

    // Reset trainer memory.
    pageMemory = [];
    optionMemory = [];
}


// Does page Exist
function pageExists(page) {
    return content.pages[page] != null;
}



/***
 *      _______                  _                           _   _                   _                   _     _                 
 *     |__   __|                (_)                         | \ | |                 (_)                 | |   (_)                
 *        | |     _ __    __ _   _   _ __     ___   _ __    |  \| |   __ _  __   __  _    __ _    __ _  | |_   _    ___    _ __  
 *        | |    | '__|  / _` | | | | '_ \   / _ \ | '__|   | . ` |  / _` | \ \ / / | |  / _` |  / _` | | __| | |  / _ \  | '_ \ 
 *        | |    | |    | (_| | | | | | | | |  __/ | |      | |\  | | (_| |  \ V /  | | | (_| | | (_| | | |_  | | | (_) | | | | |
 *        |_|    |_|     \__,_| |_| |_| |_|  \___| |_|      |_| \_|  \__,_|   \_/   |_|  \__, |  \__,_|  \__| |_|  \___/  |_| |_|
 *                                                                                        __/ |                                  
 *                                                                                       |___/                                   
 */



// Move Up
function trainerUp() {
    $(".traineroption").eq(counter).removeClass("selected");
    
    if (counter > 0) {
        counter -= 1;
    } else {
        counter = maxamount;
    }

    $(".traineroption").eq(counter).addClass("selected");

    checkHoverAction($(".traineroption").eq(counter));

    playSound("NAV_UP_DOWN");
}


// Move Down
function trainerDown() {
    $(".traineroption").eq(counter).removeClass("selected");
    
    if (counter < maxamount) {
        counter += 1;
    } else {
        counter = 0;
    }
    
    $(".traineroption").eq(counter).addClass("selected");

    checkHoverAction($(".traineroption").eq(counter));   
    
    playSound("NAV_UP_DOWN");
}


// Previous Page
function trainerPrevPage() {
    var newpage;
    if (pageExists(currentpage - 1)) {
        newpage = currentpage - 1;
    } else {
        newpage = content.maxpages;
    }
    
    showPage(newpage);
    resetSelected();
    playSound("NAV_UP_DOWN");
}


// Next Page
function trainerNextPage() {
    var newpage;
    if (pageExists(currentpage + 1)) {
        newpage = currentpage + 1;
    } else {
        newpage = 0;
    }
    
    showPage(newpage);
    resetSelected();
    playSound("NAV_UP_DOWN");
}


// Back Menu
function trainerBack() {
    // If at the "mainmenu" div then we will hide the trainer.
    if (content.menu == menus["mainmenu"].menu) {
        container.hide();
        sendData("trainerclose", {});
    } else {
        showBackMenu(menus[content.menu.attr("data-parent")]);
    }
    
    playSound("BACK");
}


// Checks for hover functionality, used when changing elements.
function checkHoverAction(element){
    if (element.data('hover')){
        var data = element.data("hover").split(" ");

        // If the parent has sharedinfo we need to add this to our hover.
        if(element.parent().attr("data-sharedinfo")){
            data = (element.data("hover") + " "+ element.parent().attr("data-sharedinfo"));
            data = data.split(" ");
            //sendData("debug",data.join(" "));
        }
        sendData(data[0], {action: data[1], newstate: true, data: data});
        //sendData("debug","Hover Action: "+data.join(" "));
    }
}


// Select Option
function handleSelectedOption(requireSkip) {
    var item = $(".traineroption").eq(counter);
    var dataArray = Object.keys(item.data());   // Get all the data options on the element

    // Change to sub menu
    if(dataArray.indexOf("sub") > -1){
        var targetID = item.data("sub");

        //sendData("debug","changing to: "+targetID)

        // Does this sub menu require anything?
        if(dataArray.indexOf("require") > -1 && requireSkip != true){
            var requireString = "require"+item.data("require");
            sendData(requireString, {});
            playSound("SELECT");
            return;
        }

        // Does Sub Menu require a variable?
        if(dataArray.indexOf("dynamicsub") > -1){
            targetID = targetID + variablesToAdd[item.data("dynamicsub")];
        }


        // Menu to Show
        var submenu = menus[targetID];

        // If Submenu is a Dynamic Menu then request information.
        if(submenu.menu.attr("data-dynamicmenu")){
            // Get NUI Callback for this menu
            var text = submenu.menu.attr("data-dynamicmenu");

            // If the Menu needs to be loaded.
            if(menuLoaded.indexOf(text) == -1){
                sendData(text);
                playSound("SELECT");
                return;
            }
        }

        // Share information with submenu?
        if(dataArray.indexOf("share") > -1){
            var shareinfo = item.data("share") || "";
            var shareID = item.data("shareid") || item.parent().attr("id");

            //sendData("debug","shareinfo: "+shareinfo+" shareID:" + shareID);

            submenu.menu.attr("data-sharedinfo",shareinfo);
            submenu.menu.attr("data-parent",shareID);

            //sendData("debug",submenu.menu.attr("data-parent"));

            // Update the main reference of this menu with updated submenu.
            menus[targetID] = submenu ;           
        }


        // Show new menu
        showMenu(submenu, false);


    }

    // Action to take
    if(dataArray.indexOf("action") > -1){
        var newstate = true;     // Default the state to True

        if (dataArray.indexOf("state") > -1) {
            // .attr() because .data() gives original values

            if (item.attr("data-state") == "ON") {
                newstate = false;
                item.attr("data-state", "OFF");
                item.removeClass("stateON");
                item.addClass("stateOFF");
            } else if (item.attr("data-state") == "OFF") {
                item.attr("data-state", "ON");
                item.removeClass("stateOFF");
                item.addClass("stateON");
            }
        }


        
        var data = item.data("action").split(" ");

        // If the parent has sharedinfo we need to add this to our action.
        if(item.parent().attr("data-sharedinfo")){
            data = (item.data("action") + " "+ item.parent().attr("data-sharedinfo"));
            data = data.split(" ");
            //sendData("debug",data.join(" "));
        }

        sendData(data[0], {action: data[1], newstate: newstate, data: data});
        //sendData("debug",data.join(" "));
    }
    if(!requireSkip){
        playSound("SELECT");
    }

    requestStateToggles(item.parent().attr("id"))
}




// Updated all state toggles
function requestStateToggles(menuID){
    // Menu should be the parent element. Loop over all children element looking for data-toggle
    // data-state is required for data-toggle
    var menu = menus[menuID]
    var values = {};
    var children = menu.pages;

    for(var page=0;page<children.length;page++){
        for (var i = 0; i < children[page].length; i++) {
            var value = children[page][i].attr("data-toggle")
            if(value){
                values[value] = true
                //sendData("debug","Adding "+value+" to the list to check.")
            }
        }
    }
    //sendData("debug","Requsting state toggles for: "+menuID)

    sendData("statetoggles", {menuid: menuID, data: values})
}


/// Update the requested state toggles
function updateStateToggles(results,menuID){
    //sendData("debug","update state toggles")

    var menuObj = menus[menuID]
    var menu = menuObj.menu;
    var children = menuObj.pages;

    var objectKeys = Object.keys(results);

    for(var page=0;page<children.length;page++){
        for(var i=0;i<children[page].length;i++){
            var value = children[page][i].attr("data-toggle")
            if(value){
                if(objectKeys.indexOf(value) > -1){
                    children[page][i].attr("data-state",results[value])
                    //sendData("debug","found toggle: "+value+" with the value of: "+results[value])

                    children[page][i].removeClass("stateON");
                    children[page][i].removeClass("stateOFF");

                    // Update their state class
                    if (results[value] == "ON") {
                        children[page][i].addClass("stateON");
                    } else if (results[value] == "OFF") {
                        children[page][i].addClass("stateOFF");
                    }

                }
            }
        }
    }

    var data = {}
     data.menu = menu
     data.pages = children
     data.maxpages = menuObj.maxpages

    menus[menuID] = data
}


// Used to show a specific page of the current menu.
function showPage(page) {
    // Remove all previous page options from the page
    if (currentpage != null) {
        content.menu.children().detach();
    }
    
    // Update to new page information
    currentpage = page;
    
    // Add page options to the menu
    for (var i = 0; i < content.pages[currentpage].length; ++i) {
        content.menu.append(content.pages[currentpage][i]);
    }
    
    // Update the page indicator
    if (content.maxpages > 0) {
        $("#pageindicator").text("Page " + (currentpage + 1) + " / " + (content.maxpages + 1));
    } else {
        $("#pageindicator").text("");
    }
}


// select specific option of the page. doesn't submit data
function selectOption(opt) {
    $(".traineroption").removeClass("selected");
    
    counter = opt;
    maxamount = $(".traineroption").length - 1;
    $(".traineroption").eq(opt).addClass('selected');
}


// Reset the selector to top of page.
function resetSelected() {
    $(".traineroption").removeClass("selected");
    
    counter = 0;
    maxamount = $(".traineroption").length - 1;

    $(".traineroption").eq(0).addClass('selected');

    checkHoverAction($(".traineroption.selected"))   ; 
}


// used to show a menu (adds back to container);
function showMenu(menu, memoryPrevention) {
    // Add the current page/option to memory.
    if(!memoryPrevention){
        pageMemory.push(currentpage);
        optionMemory.push(counter);
    }

    // Remove old menu div
    if (content != null) {
        content.menu.detach();
    }
    
    // Add new menu div
    content = menu;
    container.append(content.menu);

    showPage(0);
    resetSelected();
    requestStateToggles($(content.menu).attr( "id" )); 
}


// Used to show previous menu page, with memory
function showBackMenu(menu) {
    var newPage = pageMemory[pageMemory.length - 1] || 0;
    var newOption = optionMemory[optionMemory.length - 1] || 0;


    // Remove the options from memory
    pageMemory.pop();
    optionMemory.pop();

    // remove old menu
    if (content != null) {
        content.menu.detach();
    }
    
    // add new menu
    content = menu;
    container.append(content.menu);
    
    // Show page with memory
    showPage(newPage);
    selectOption(newOption);
}


/***
 *      __  __                             _____                         _     _                 
 *     |  \/  |                           / ____|                       | |   (_)                
 *     | \  / |   ___   _ __    _   _    | |       _ __    ___    __ _  | |_   _    ___    _ __  
 *     | |\/| |  / _ \ | '_ \  | | | |   | |      | '__|  / _ \  / _` | | __| | |  / _ \  | '_ \ 
 *     | |  | | |  __/ | | | | | |_| |   | |____  | |    |  __/ | (_| | | |_  | | | (_) | | | | |
 *     |_|  |_|  \___| |_| |_|  \__,_|    \_____| |_|     \___|  \__,_|  \__| |_|  \___/  |_| |_|
 *                                                                                               
 *                                                                                               
 */


// Find any divs and create a menu page out of them.
function refreshMenus(){
    updateMenuClasses();
    updateStateClasses();
    convertToMenus();
}


function requestAllStates(){
    var keys = Object.keys(menus);
    for (var i = 0; i < keys.length; i++) {
        var menuID = keys[i]
        requestStateToggles(menuID)
    }
}


// Convert any divs on the page to a detached menu
function convertToMenus(){
    $("div").each(function(i, obj) {
        // Skip Container elements.
        if ($(this).attr("data-container") == undefined){

            // Create the current menu page.
            var data = {};
            data.menu = $(this).detach();
            data.pages = [];

            // Move all child elements to the pages array.
            $(this).children().each(function(i, obj) {
                
                // TODO: Add better state syncing

                if ($(this).data("state") == "ON") {
                    var statedata = $(this).data("action").split(" ");
                    sendData(statedata[0], {action: statedata[1], newstate: true, data: {}});
                }
                
                var page = Math.floor(i / maxVisibleItems);
                if (data.pages[page] == null) {
                    data.pages[page] = [];
                }
                
                data.pages[page].push($(this).detach());
                data.maxpages = page;
            });
            
            // Add data to the menu.
            menus[$(this).attr("id")] = data;


            // If this menu is dynamic then save the original versions
            if($(this).attr("data-dynamicmenu")){
                if(!dynamicIDs[$(this).attr("data-dynamicmenu")]){
                    dynamicIDs[$(this).attr("data-dynamicmenu")] = $(this).attr("id");
                    dynamicMenus[$(this).attr("id")] = data
                }
            }
        }
    });
}



// Add Ammo Elements to the top of the menu
function appendAmmoEles(containerDiv){
    // Max Ammo
    var maxEle = $(trainerOption);
    maxEle.text("Max Ammo");
    maxEle.attr("data-action","weapon ammo max");
    maxEle.attr("data-hover","weapon holdweapon");
    containerDiv.prepend(maxEle);
     // Add Clip
    var clipEle = $(trainerOption);
    clipEle.text("Add Clip");
    clipEle.attr("data-action","weapon ammo add");
    clipEle.attr("data-hover","weapon holdweapon");
    containerDiv.prepend(clipEle);

    return containerDiv;
}


// Add Weapon Spawn Element to top of the menu
function appendWeaponSpawnEle(containerDiv,menuName){
    // Spawn Weapon
    var spawnEle = $(trainerOption);
    spawnEle.text(menuName);
    spawnEle.attr("data-action","weapon spawn");
    spawnEle.attr("data-hover","weapon holdweapon");
    spawnEle.attr("data-state","OFF")
    containerDiv.prepend(spawnEle);

    return containerDiv;
}


// Add the tintable menu element to the container
function addWeaponTintMenu(containerDiv,spawnName,idName){
    // Add to end of container.
    var newEle = $(trainerOption);
    newEle.text("Weapon Tints");
    newEle.attr("data-sub","weapontintsmenu");
    newEle.attr("data-share",spawnName);
    newEle.attr("data-shareid",idName);
    containerDiv.append(newEle);

    return containerDiv;
}



// Adds new attributes for the specified element. Recursive call to handle linking to sub-menu
function addNewTrainerOptions(newEle,currentObject,curIndex,idName,defaultAction){
    // defaultAction is used for static menus
    //sendData("debug",curIndex+" "+idName+" "+defaultAction+" : curIndex idName defaultAction")
    if(!defaultAction){
        defaultAction = "";
    }

    // Add all necessary attributes to the element.
    for(var objectKey in currentObject){
        var curValue = currentObject[objectKey];

        switch(objectKey){
            // Add all data attributes
            case "data":
                for(var dataKey in curValue){
                    var curDataValue = curValue[dataKey];

                    // Ensure unique IDs by using parent ID as starting point.
                    if(dataKey == "sub" || dataKey == "shareid"){
                        curDataValue = idName+curDataValue;
                        //sendData("debug","data-"+dataKey+" "+curDataValue)
                    }

                    if(dataKey == "action" || dataKey == "hover"){
                        if(defaultAction){
                            curDataValue = defaultAction+" "+curDataValue
                        } else {
                            curDataValue = curDataValue
                        }
                    }

                    newEle.attr("data-"+dataKey,curDataValue);
                }

                // Share weaponName with weapon sub menu option
                if(Object.keys(currentObject).indexOf("weapon") > -1){
                    newEle.attr("data-share",currentObject['weaponName'])
                }
                break;

            // Add submenu (accompanies by data-sub)
            case "submenu":
                var newID = idName+currentObject["data"]["sub"];

                //sendData("debug","creating submenu: "+newID)

                //Create Submenu Container Div
                var containerDiv = $("<div></div>");
                containerDiv.attr("id", newID);
                containerDiv.attr("data-parent",idName);


                // Loop over each subMenu and create the menu
                for(var subMenuI=0;subMenuI<curValue.length;subMenuI++){
                    var subObject = curValue[subMenuI];
                    var newSubEle = $(trainerOption);

                    newSubEle = addNewTrainerOptions(newSubEle,subObject,subMenuI,newID,defaultAction);
                    containerDiv.append(newSubEle);
                }


                // Add Weapon Spawn Option to trainer
                if(Object.keys(currentObject).indexOf("weapon") > -1){
                    var weaponName = currentObject["weaponName"];

                    // Add Ammo Options to trainer
                    if(Object.keys(currentObject).indexOf("ammo") > -1){
                        containerDiv = appendAmmoEles(containerDiv);
                    }

                    // Add trainer option to actually spawn weapon
                    containerDiv = appendWeaponSpawnEle(containerDiv,currentObject['menuName']);
                    

                    // Add Tintable Weapon Menu if weapon is tintable
                    if(tintable_weapons.indexOf(weaponName) > -1){
                        containerDiv = addWeaponTintMenu(containerDiv,weaponName,newID);
                    }
                }

                //sendData("debug","Appending containerDiv: "+containerDiv.attr("id"))
                container.append(containerDiv);
                break;

            // Option Name for the trainer
            case "menuName":
                newEle.text(curValue);
                break

            default:
                console.log("Nothinhg")
        }
    }
    return newEle
}


// Create static menus
function createStaticMenus(){
    $("div").each(function(i,obj){
        if( $(this).attr("data-staticmenu")){

            // Grab data from JSON.
            var requestKey = $(this).attr("data-staticmenu");
            var requestedObj = requestObjects[requestKey];
            var requestedAction = requestAction[requestKey];
            var objectLength = requestedObj.length;

            //sendData("debug","Creating Static Menu... "+requestKey)

            // Loop over requestedObj and add each new option
            for(var index=0; index < objectLength; index++){
                var curObj = requestedObj[index];

                var newEle = $(trainerOption);
                
                // Add any necessary options for the static JSON
                newEle = addNewTrainerOptions(newEle,curObj,index,$(this).attr("id"),requestedAction);

                // Add new option to container div
                $(this).append(newEle);               
            }
        }
    });
}



// Create a Dynamic Menu
function createDynamicMenu(menuArray,name){
    // Remove old menu div to prevent losing pages
    if (content != null) {
        content.menu.detach();
    }

    // Get necesarry information and recreate original menu
    // sendData("debug", "creating dynamic menu")
    var idName = dynamicIDs[name];
    var data = jQuery.extend(true, {}, dynamicMenus[idName]);
    var choiceMenu = data.menu;
    var pages = jQuery.extend(true, [], data.pages)

    // Remove any children element to ensure blank page.
    choiceMenu.children().detach();

    // Readd menu to page.
    for (var i = 0; i < pages.length; i++) {
        for (var index = 0; index < pages[i].length; index++) {
            choiceMenu.append(pages[i][index])
        }
    }


    // If nothing to add and no placeholder elements add element
    if(menuArray.length == 0 && pages.length == 0){
        var noEle = $(trainerOption).text("Nothing to show.");
        choiceMenu.append(noEle);
    }


    // Add each option to the menu.
    for (var curIndex = 0; curIndex < menuArray.length; curIndex++){
        var currentObject = menuArray[curIndex];

        // Create the option to select the Feature.
        var newEle = $(trainerOption);
        newEle.text(currentObject['menuName'])

        // Adds options for menu option including submenus (recursive calls)
        newEle = addNewTrainerOptions(newEle,currentObject,curIndex,idName);

        // Add new option to menu
        choiceMenu.prepend(newEle);
    }
    container.append(choiceMenu);



    // Add all new menus to the menus object.
    refreshMenus();

    // Show the requested menu.
    showMenu(menus[idName], false);
    //sendData("debug","Created Menu");

}

/***
 *      _______                  _                           ______                  _                               
 *     |__   __|                (_)                         |  ____|                | |                              
 *        | |     _ __    __ _   _   _ __     ___   _ __    | |__      ___    __ _  | |_   _   _   _ __    ___   ___ 
 *        | |    | '__|  / _` | | | | '_ \   / _ \ | '__|   |  __|    / _ \  / _` | | __| | | | | | '__|  / _ \ / __|
 *        | |    | |    | (_| | | | | | | | |  __/ | |      | |      |  __/ | (_| | | |_  | |_| | | |    |  __/ \__ \
 *        |_|    |_|     \__,_| |_| |_| |_|  \___| |_|      |_|       \___|  \__,_|  \__|  \__,_| |_|     \___| |___/
 *                                                                                                                   
 *                                                                                                                   
 */


// Update voice div with active talking players
function updateVoices(custArray){
    // sendData("debug","updatedVoices")

    // Remove all players to be readded.
    voicePlayers.children().remove()

    // Readd all player voices
    for(var i=0;i<custArray.length;i++){
        var newEle = $("<p class='voicename'></p>");
        newEle.text(custArray[i]);
        voicePlayers.append(newEle);
    }

    // sendData("debug","done")
}


/***
 *       _____   _______              _______   _____    _____          _    _____    ____    _   _   
 *      / ____| |__   __|     /\     |__   __| |_   _|  / ____|        | |  / ____|  / __ \  | \ | |  
 *     | (___      | |       /  \       | |      | |   | |             | | | (___   | |  | | |  \| |  
 *      \___ \     | |      / /\ \      | |      | |   | |         _   | |  \___ \  | |  | | | . ` |  
 *      ____) |    | |     / ____ \     | |     _| |_  | |____    | |__| |  ____) | | |__| | | |\  |  
 *     |_____/     |_|    /_/    \_\    |_|    |_____|  \_____|    \____/  |_____/   \____/  |_| \_|  
 *                                                                                                    
 *                                                                                                    
 */


// Used to determine which weapon menus should get the tintable menu added.
var tintable_weapons = ["WEAPON_STINGER", "WEAPON_MARKSMANPISTOL", "WEAPON_COMBATPDW", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_GUSENBERG", "WEAPON_ASSAULTRIFLE", "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_RPG", "WEAPON_MINIGUN", "WEAPON_FIREWORK", "WEAPON_RAILGUN", "WEAPON_HOMINGLAUNCHER", "WEAPON_MACHINEPISTOL", "WEAPON_DBSHOTGUN", "WEAPON_COMPACTRIFLE", "WEAPON_MINISMG", "WEAPON_AUTOSHOTGUN", "WEAPON_COMPACTLAUNCHER" ];


// Ped Spawning Lists.
var playerList = [{"menuName" : "Michael","data":{"action": "player_zero"}},{"menuName" : "Franklin","data":{"action": "player_one"}},{"menuName" : "Trevor","data":{"action": "player_two"}}, {"menuName": "MP Male","data":{"action": "mp_m_freemode_01"}}, {"menuName": "MP Female","data":{"action": "mp_f_freemode_01"}}];
var AnimalList = [{"menuName": "Boar","data":{"action": "a_c_boar"}},{"menuName": "Cat","data":{"action": "a_c_cat_01"}},{"menuName": "Chimp","data":{"action": "a_c_chimp"}},{"menuName": "Chop","data":{"action": "a_c_chop"}},{"menuName": "Cormorant","data":{"action": "a_c_cormorant"}},{"menuName": "Cow","data":{"action": "a_c_cow"}},{"menuName": "Coyote","data":{"action": "a_c_coyote"}},{"menuName": "Crow","data":{"action": "a_c_crow"}},{"menuName": "Deer","data":{"action": "a_c_deer"}},{"menuName": "Dolphin","data":{"action": "a_c_dolphin"}},{"menuName": "Fish","data":{"action": "a_c_fish"}},{"menuName": "Hawk","data":{"action": "a_c_chickenhawk"}},{"menuName": "Hen","data":{"action": "a_c_hen"}},{"menuName": "Humpback","data":{"action": "a_c_humpback"}},{"menuName": "Husky","data":{"action": "a_c_husky"}},{"menuName": "Mountain Lion","data":{"action": "a_c_mtlion"}},{"menuName": "Pig","data":{"action": "a_c_pig"}},{"menuName": "Pigeon","data":{"action": "a_c_pigeon"}},{"menuName": "Rat","data":{"action": "a_c_rat"}},{"menuName": "Golden Retriever","data":{"action": "a_c_retriever"}},{"menuName": "Rhesus","data":{"action": "a_c_rhesus"}},{"menuName": "Seagull","data":{"action": "a_c_seagull"}},{"menuName": "Sharkhammer","data":{"action": "a_c_sharkhammer"}},{"menuName": "Sharktiger","data":{"action": "a_c_sharktiger"}},{"menuName": "Shepherd","data":{"action": "a_c_shepherd"}},{"menuName": "Sting Ray", "data": {"action" : "a_c_stingray"}},{"menuName": "Whale","data":{"action": "a_c_killerwhale"}}];
var NPCList = [{"menuName": "Abigail","data":{"action": "ig_abigail"}},{"menuName": "Abigail Mathers","data":{"action": "csb_abigail"}},{"menuName": "Abner","data":{"action": "u_m_y_abner"}},{"menuName": "African American Male","data":{"action": "a_m_m_afriamer_01"}},{"menuName": "Airhostess","data":{"action": "s_f_y_airhostess_01"}},{"menuName": "Airworker","data":{"action": "s_m_y_airworker"}},{"menuName": "Aldinapoli","data":{"action": "u_m_m_aldinapoli"}},{"menuName": "Alien","data":{"action": "s_m_m_movalien_01"}},{"menuName": "Altruist Cult Old Male","data":{"action": "a_m_o_acult_01"}},{"menuName": "Altruist Cult Old Male 2","data":{"action": "a_m_o_acult_02"}},{"menuName": "Altruist Cult Young Male","data":{"action": "a_m_y_acult_01"}},{"menuName": "Altruist Cult Young Male 2","data":{"action": "a_m_y_acult_02"}},{"menuName": "Altruist cult Mid-Age Male","data":{"action": "a_m_m_acult_01"}},{"menuName": "Amandatownley","data":{"action": "ig_amandatownley"}},{"menuName": "Amandatownley-BROKEN","data":{"action": "cs_amandatownley"}},{"menuName": "Ammucity","data":{"action": "s_m_y_ammucity_01"}},{"menuName": "Ammucountry","data":{"action": "s_m_m_ammucountry"}},{"menuName": "Andreas","data":{"action": "ig_andreas"}},{"menuName": "Andreas-BROKEN","data":{"action": "cs_andreas"}},{"menuName": "Anita Mendoza","data":{"action": "csb_anita"}},{"menuName": "Anton Beaudelaire","data":{"action": "csb_anton"}},{"menuName": "Antonb","data":{"action": "u_m_y_antonb"}},{"menuName": "Armboss","data":{"action": "g_m_m_armboss_01"}},{"menuName": "Armgoon","data":{"action": "g_m_m_armgoon_01"}},{"menuName": "Armgoon","data":{"action": "g_m_y_armgoon_02"}},{"menuName": "Armlieut","data":{"action": "g_m_m_armlieut_01"}},{"menuName": "Armoured","data":{"action": "mp_s_m_armoured_01"}},{"menuName": "Armoured","data":{"action": "s_m_m_armoured_01"}},{"menuName": "Armoured","data":{"action": "s_m_m_armoured_02"}},{"menuName": "Armymech","data":{"action": "s_m_y_armymech_01"}},{"menuName": "Ashley","data":{"action": "ig_ashley"}},{"menuName": "Ashley-BROKEN","data":{"action": "cs_ashley"}},{"menuName": "Autopsy","data":{"action": "s_m_y_autopsy_01"}},{"menuName": "Autoshop","data":{"action": "s_m_m_autoshop_01"}},{"menuName": "Autoshop","data":{"action": "s_m_m_autoshop_02"}},{"menuName": "Azteca","data":{"action": "g_m_y_azteca_01"}},{"menuName": "Babyd","data":{"action": "u_m_y_babyd"}},{"menuName": "Ballaeast","data":{"action": "g_m_y_ballaeast_01"}},{"menuName": "Ballaorig","data":{"action": "g_m_y_ballaorig_01"}},{"menuName": "Ballas","data":{"action": "g_f_y_ballas_01"}},{"menuName": "Ballas OG","data":{"action": "csb_ballasog"}},{"menuName": "Ballasog","data":{"action": "ig_ballasog"}},{"menuName": "Ballasout","data":{"action": "g_m_y_ballasout_01"}},{"menuName": "Bankman","data":{"action": "ig_bankman"}},{"menuName": "Bankman","data":{"action": "u_m_m_bankman"}},{"menuName": "Bankman-BROKEN","data":{"action": "cs_bankman"}},{"menuName": "Barman","data":{"action": "s_m_y_barman_01"}},{"menuName": "Barry","data":{"action": "ig_barry"}},{"menuName": "Barry-BROKEN","data":{"action": "cs_barry"}},{"menuName": "Barry_P","data":{"action": "ig_barry_p"}},{"menuName": "Barry_P-BROKEN","data":{"action": "cs_barry_p"}},{"menuName": "Bartender","data":{"action": "s_f_y_bartender_01"}},{"menuName": "Baygor","data":{"action": "u_m_y_baygor"}},{"menuName": "Baywatch","data":{"action": "s_f_y_baywatch_01"}},{"menuName": "Baywatch","data":{"action": "s_m_y_baywatch_01"}},{"menuName": "Beach Female","data":{"action": "a_f_m_beach_01"}},{"menuName": "Beach Male","data":{"action": "a_m_m_beach_01"}},{"menuName": "Beach Male 2","data":{"action": "a_m_m_beach_02"}},{"menuName": "Beach Muscle Male","data":{"action": "a_m_y_musclbeac_01"}},{"menuName": "Beach Muscle Male 2","data":{"action": "a_m_y_musclbeac_02"}},{"menuName": "Beach Old Male","data":{"action": "a_m_o_beach_01"}},{"menuName": "Beach Tramp Female","data":{"action": "a_f_m_trampbeac_01"}},{"menuName": "Beach Tramp Male","data":{"action": "a_m_m_trampbeac_01"}},{"menuName": "Beach Young Female","data":{"action": "a_f_y_beach_01"}},{"menuName": "Beach Young Male","data":{"action": "a_m_y_beach_01"}},{"menuName": "Beach Young Male 2","data":{"action": "a_m_y_beach_02"}},{"menuName": "Beach Young Male 3","data":{"action": "a_m_y_beach_03"}},{"menuName": "Bestmen","data":{"action": "ig_bestmen"}},{"menuName": "Beverly","data":{"action": "ig_beverly"}},{"menuName": "Beverly Hills Female","data":{"action": "a_f_m_bevhills_01"}},{"menuName": "Beverly Hills Female 2","data":{"action": "a_f_m_bevhills_02"}},{"menuName": "Beverly Hills Male","data":{"action": "a_m_m_bevhills_01"}},{"menuName": "Beverly Hills Male 2","data":{"action": "a_m_m_bevhills_02"}},{"menuName": "Beverly Hills Young Female","data":{"action": "a_f_y_bevhills_01"}},{"menuName": "Beverly Hills Young Female 2","data":{"action": "a_f_y_bevhills_02"}},{"menuName": "Beverly Hills Young Female 3","data":{"action": "a_f_y_bevhills_03"}},{"menuName": "Beverly Hills Young Female 4","data":{"action": "a_f_y_bevhills_04"}},{"menuName": "Beverly Hills Young Male","data":{"action": "a_m_y_bevhills_01"}},{"menuName": "Beverly Hills Young Male 2","data":{"action": "a_m_y_bevhills_02"}},{"menuName": "Beverly-BROKEN","data":{"action": "cs_beverly"}},{"menuName": "Beverly_P","data":{"action": "ig_beverly_p"}},{"menuName": "Beverly_P-BROKEN","data":{"action": "cs_beverly_p"}},{"menuName": "Bikehire","data":{"action": "u_m_m_bikehire_01"}},{"menuName": "Bikerchic","data":{"action": "u_f_y_bikerchic"}},{"menuName": "Black Street Male","data":{"action": "a_m_y_stbla_01"}},{"menuName": "Black Street Male 2","data":{"action": "a_m_y_stbla_02"}},{"menuName": "Blackops","data":{"action": "s_m_y_blackops_01"}},{"menuName": "Blackops","data":{"action": "s_m_y_blackops_02"}},{"menuName": "Bodybuilder Female","data":{"action": "a_f_m_bodybuild_01"}},{"menuName": "Bouncer","data":{"action": "s_m_m_bouncer_01"}},{"menuName": "Brad","data":{"action": "ig_brad"}},{"menuName": "Brad-BROKEN","data":{"action": "cs_brad"}},{"menuName": "Bradcadaver-BROKEN","data":{"action": "cs_bradcadaver"}},{"menuName": "Breakdancer Male","data":{"action": "a_m_y_breakdance_01"}},{"menuName": "Bride","data":{"action": "ig_bride"}},{"menuName": "Bride-BROKEN","data":{"action": "csb_bride"}},{"menuName": "Burger Drug Worker","data":{"action": "csb_burgerdrug"}},{"menuName": "Burgerdrug","data":{"action": "u_m_y_burgerdrug_01"}},{"menuName": "Busboy","data":{"action": "s_m_y_busboy_01"}},{"menuName": "Business Casual","data":{"action": "a_m_y_busicas_01"}},{"menuName": "Business Female 2","data":{"action": "a_f_m_business_02"}},{"menuName": "Business Male","data":{"action": "a_m_m_business_01"}},{"menuName": "Business Young Female","data":{"action": "a_f_y_business_01"}},{"menuName": "Business Young Female 2","data":{"action": "a_f_y_business_02"}},{"menuName": "Business Young Female 3","data":{"action": "a_f_y_business_03"}},{"menuName": "Business Young Female 4","data":{"action": "a_f_y_business_04"}},{"menuName": "Business Young Male","data":{"action": "a_m_y_business_01"}},{"menuName": "Business Young Male 2","data":{"action": "a_m_y_business_02"}},{"menuName": "Business Young Male 3","data":{"action": "a_m_y_business_03"}},{"menuName": "Busker","data":{"action": "s_m_o_busker_01"}},{"menuName": "Car 3 Guy 1","data":{"action": "csb_car3guy1"}},{"menuName": "Car 3 Guy 2","data":{"action": "csb_car3guy2"}},{"menuName": "Car3Guy1","data":{"action": "ig_car3guy1"}},{"menuName": "Car3Guy2","data":{"action": "ig_car3guy2"}},{"menuName": "Carbuyer-BROKEN","data":{"action": "cs_carbuyer"}},{"menuName": "Casey","data":{"action": "ig_casey"}},{"menuName": "Casey-BROKEN","data":{"action": "cs_casey"}},{"menuName": "Chef","data":{"action": "ig_chef"}},{"menuName": "Chef","data":{"action": "s_m_y_chef_01"}},{"menuName": "Chemsec","data":{"action": "s_m_m_chemsec_01"}},{"menuName": "Chemwork","data":{"action": "g_m_m_chemwork_01"}},{"menuName": "Chemwork_P","data":{"action": "g_m_m_chemwork_01_p"}},{"menuName": "Chengsr","data":{"action": "ig_chengsr"}},{"menuName": "Chengsr-BROKEN","data":{"action": "cs_chengsr"}},{"menuName": "Chiboss","data":{"action": "g_m_m_chiboss_01"}},{"menuName": "Chiboss_P","data":{"action": "g_m_m_chiboss_01_p"}},{"menuName": "Chicold","data":{"action": "g_m_m_chicold_01"}},{"menuName": "Chicold_P","data":{"action": "g_m_m_chicold_01_p"}},{"menuName": "Chigoon","data":{"action": "g_m_m_chigoon_01"}},{"menuName": "Chigoon","data":{"action": "g_m_m_chigoon_02"}},{"menuName": "Chigoon_P","data":{"action": "g_m_m_chigoon_01_p"}},{"menuName": "Chinese Goon","data":{"action": "csb_chin_goon"}},{"menuName": "Chip","data":{"action": "u_m_y_chip"}},{"menuName": "Chrisformage","data":{"action": "ig_chrisformage"}},{"menuName": "Chrisformage-BROKEN","data":{"action": "cs_chrisformage"}},{"menuName": "Ciasec","data":{"action": "s_m_m_ciasec_01"}},{"menuName": "Claude","data":{"action": "mp_m_claude_01"}},{"menuName": "Clay","data":{"action": "ig_clay"}},{"menuName": "Clay-BROKEN","data":{"action": "cs_clay"}},{"menuName": "Claypain","data":{"action": "ig_claypain"}},{"menuName": "Cletus","data":{"action": "csb_cletus"}},{"menuName": "Cletus","data":{"action": "ig_cletus"}},{"menuName": "Clown","data":{"action": "s_m_y_clown_01"}},{"menuName": "Cntrybar","data":{"action": "s_m_m_cntrybar_01"}},{"menuName": "Comjane","data":{"action": "u_f_y_comjane"}},{"menuName": "Construct","data":{"action": "s_m_y_construct_01"}},{"menuName": "Construct","data":{"action": "s_m_y_construct_02"}},{"menuName": "Cooker","data":{"action": "csb_chef"}},{"menuName": "Cop","data":{"action": "csb_cop"}},{"menuName": "Cop","data":{"action": "s_f_y_cop_01"}},{"menuName": "Cop","data":{"action": "s_m_y_cop_01"}},{"menuName": "Corpse","data":{"action": "u_f_m_corpse_01"}},{"menuName": "Corpse","data":{"action": "u_f_y_corpse_01"}},{"menuName": "Corpse","data":{"action": "u_f_y_corpse_02"}},{"menuName": "Customer","data":{"action": "csb_customer"}},{"menuName": "Cyclist","data":{"action": "u_m_y_cyclist_01"}},{"menuName": "Cyclist Male","data":{"action": "a_m_y_cyclist_01"}},{"menuName": "Cyclist Sport","data":{"action": "a_m_y_roadcyc_01"}},{"menuName": "Dale","data":{"action": "ig_dale"}},{"menuName": "Dale-BROKEN","data":{"action": "cs_dale"}},{"menuName": "Davenorton","data":{"action": "ig_davenorton"}},{"menuName": "Davenorton-BROKEN","data":{"action": "cs_davenorton"}},{"menuName": "Deadhooker","data":{"action": "mp_f_deadhooker"}},{"menuName": "Dealer","data":{"action": "s_m_y_dealer_01"}},{"menuName": "Debra-BROKEN","data":{"action": "cs_debra"}},{"menuName": "Denise","data":{"action": "ig_denise"}},{"menuName": "Denise's Friend","data":{"action": "csb_denise_friend"}},{"menuName": "Denise-BROKEN","data":{"action": "cs_denise"}},{"menuName": "Devin","data":{"action": "ig_devin"}},{"menuName": "Devin-BROKEN","data":{"action": "cs_devin"}},{"menuName": "Devinsec","data":{"action": "s_m_y_devinsec_01"}},{"menuName": "Dockwork","data":{"action": "s_m_m_dockwork_01"}},{"menuName": "Dockwork","data":{"action": "s_m_y_dockwork_01"}},{"menuName": "Doctor","data":{"action": "s_m_m_doctor_01"}},{"menuName": "Dom","data":{"action": "ig_dom"}},{"menuName": "Dom-BROKEN","data":{"action": "cs_dom"}},{"menuName": "Doorman","data":{"action": "s_m_y_doorman_01"}},{"menuName": "Downtown Female","data":{"action": "a_f_m_downtown_01"}},{"menuName": "Downtown Male","data":{"action": "a_m_y_downtown_01"}},{"menuName": "Dreyfuss","data":{"action": "ig_dreyfuss"}},{"menuName": "Dreyfuss-BROKEN","data":{"action": "cs_dreyfuss"}},{"menuName": "Drfriedlander","data":{"action": "ig_drfriedlander"}},{"menuName": "Drfriedlander-BROKEN","data":{"action": "cs_drfriedlander"}},{"menuName": "Dwservice","data":{"action": "s_m_y_dwservice_01"}},{"menuName": "Dwservice","data":{"action": "s_m_y_dwservice_02"}},{"menuName": "East SA Male","data":{"action": "a_m_m_eastsa_01"}},{"menuName": "East SA Male","data":{"action": "a_m_m_eastsa_02"}},{"menuName": "East SA Young Female","data":{"action": "a_f_y_eastsa_01"}},{"menuName": "East SA Young Female 2","data":{"action": "a_f_y_eastsa_02"}},{"menuName": "East SA Young Female 3","data":{"action": "a_f_y_eastsa_03"}},{"menuName": "East SA Young Male","data":{"action": "a_m_y_eastsa_01"}},{"menuName": "East SA Young Male","data":{"action": "a_m_y_eastsa_02"}},{"menuName": "Eastsa SA Female","data":{"action": "a_f_m_eastsa_01"}},{"menuName": "Eastsa SA Female 2","data":{"action": "a_f_m_eastsa_02"}},{"menuName": "Epsilon Female","data":{"action": "a_f_y_epsilon_01"}},{"menuName": "Epsilon Male","data":{"action": "a_m_y_epsilon_01"}},{"menuName": "Epsilon Male 2","data":{"action": "a_m_y_epsilon_02"}},{"menuName": "Exarmy","data":{"action": "mp_m_exarmy_01"}},{"menuName": "Fabien","data":{"action": "ig_fabien"}},{"menuName": "Fabien-BROKEN","data":{"action": "cs_fabien"}},{"menuName": "Factory","data":{"action": "s_f_y_factory_01"}},{"menuName": "Factory","data":{"action": "s_m_y_factory_01"}},{"menuName": "Famca","data":{"action": "g_m_y_famca_01"}},{"menuName": "Famdd","data":{"action": "mp_m_famdd_01"}},{"menuName": "Famdnf","data":{"action": "g_m_y_famdnf_01"}},{"menuName": "Famfor","data":{"action": "g_m_y_famfor_01"}},{"menuName": "Families","data":{"action": "g_f_y_families_01"}},{"menuName": "Families Gang Member","data":{"action": "csb_ramp_gang"}},{"menuName": "Farmer","data":{"action": "a_m_m_farmer_01"}},{"menuName": "Fat Black Female","data":{"action": "a_f_m_fatbla_01"}},{"menuName": "Fat Cult Female","data":{"action": "a_f_m_fatcult_01"}},{"menuName": "Fat Latino Male","data":{"action": "a_m_m_fatlatin_01"}},{"menuName": "Fat white Female","data":{"action": "a_f_m_fatwhite_01"}},{"menuName": "Fbisuit","data":{"action": "ig_fbisuit_01"}},{"menuName": "Fbisuit-BROKEN","data":{"action": "cs_fbisuit_01"}},{"menuName": "Fembarber","data":{"action": "s_f_m_fembarber"}},{"menuName": "Fibarchitect","data":{"action": "u_m_m_fibarchitect"}},{"menuName": "Fibmugger","data":{"action": "u_m_y_fibmugger_01"}},{"menuName": "Fiboffice","data":{"action": "s_m_m_fiboffice_01"}},{"menuName": "Fiboffice","data":{"action": "s_m_m_fiboffice_02"}},{"menuName": "Fibsec","data":{"action": "mp_m_fibsec_01"}},{"menuName": "Filmdirector","data":{"action": "u_m_m_filmdirector"}},{"menuName": "Finguru","data":{"action": "u_m_o_finguru_01"}},{"menuName": "Fireman","data":{"action": "s_m_y_fireman_01"}},{"menuName": "Fitness Female","data":{"action": "a_f_y_fitness_01"}},{"menuName": "Fitness Female 2","data":{"action": "a_f_y_fitness_02"}},{"menuName": "Floyd","data":{"action": "ig_floyd"}},{"menuName": "Floyd-BROKEN","data":{"action": "cs_floyd"}},{"menuName": "Fos Rep","data":{"action": "csb_fos_rep"}},{"menuName": "Gaffer","data":{"action": "s_m_m_gaffer_01"}},{"menuName": "Gang","data":{"action": "ig_ramp_gang"}},{"menuName": "Garbage","data":{"action": "s_m_y_garbage"}},{"menuName": "Gardener","data":{"action": "s_m_m_gardener_01"}},{"menuName": "Gay Male","data":{"action": "a_m_y_gay_01"}},{"menuName": "Gay Male 2","data":{"action": "a_m_y_gay_02"}},{"menuName": "General Fat Male","data":{"action": "a_m_m_genfat_01"}},{"menuName": "General Fat Male 2","data":{"action": "a_m_m_genfat_02"}},{"menuName": "General Hot Young Female","data":{"action": "a_f_y_genhot_01"}},{"menuName": "General Street Old Female","data":{"action": "a_f_o_genstreet_01"}},{"menuName": "General Street Old Male","data":{"action": "a_m_o_genstreet_01"}},{"menuName": "General Street Young Male","data":{"action": "a_m_y_genstreet_01"}},{"menuName": "General Street Young Male 2","data":{"action": "a_m_y_genstreet_02"}},{"menuName": "Gentransport","data":{"action": "s_m_m_gentransport"}},{"menuName": "Gerald","data":{"action": "csb_g"}},{"menuName": "Glenstank","data":{"action": "u_m_m_glenstank_01"}},{"menuName": "Golfer Male","data":{"action": "a_m_m_golfer_01"}},{"menuName": "Golfer Young Female","data":{"action": "a_f_y_golfer_01"}},{"menuName": "Golfer Young Male","data":{"action": "a_m_y_golfer_01"}},{"menuName": "Griff","data":{"action": "u_m_m_griff_01"}},{"menuName": "Grip","data":{"action": "s_m_y_grip_01"}},{"menuName": "Groom","data":{"action": "ig_groom"}},{"menuName": "Groom-BROKEN","data":{"action": "csb_groom"}},{"menuName": "Grove Street Dealer","data":{"action": "csb_grove_str_dlr"}},{"menuName": "Guadalope-BROKEN","data":{"action": "cs_guadalope"}},{"menuName": "Guido","data":{"action": "u_m_y_guido_01"}},{"menuName": "Gunvend","data":{"action": "u_m_y_gunvend_01"}},{"menuName": "Gurk-BROKEN","data":{"action": "cs_gurk"}},{"menuName": "Hairdress","data":{"action": "s_m_m_hairdress_01"}},{"menuName": "Hao","data":{"action": "csb_hao"}},{"menuName": "Hao","data":{"action": "ig_hao"}},{"menuName": "Hasidic Jew Male","data":{"action": "a_m_m_hasjew_01"}},{"menuName": "Hasidic Jew Young Male","data":{"action": "a_m_y_hasjew_01"}},{"menuName": "Hc_Driver","data":{"action": "hc_driver"}},{"menuName": "Hc_Gunman","data":{"action": "hc_gunman"}},{"menuName": "Hc_Hacker","data":{"action": "hc_hacker"}},{"menuName": "Hic","data":{"action": "ig_ramp_hic"}},{"menuName": "Hick","data":{"action": "csb_ramp_hic"}},{"menuName": "Highsec","data":{"action": "s_m_m_highsec_01"}},{"menuName": "Highsec","data":{"action": "s_m_m_highsec_02"}},{"menuName": "Hiker Female","data":{"action": "a_f_y_hiker_01"}},{"menuName": "Hiker Male","data":{"action": "a_m_y_hiker_01"}},{"menuName": "Hillbilly Male","data":{"action": "a_m_m_hillbilly_01"}},{"menuName": "Hillbilly Male 2","data":{"action": "a_m_m_hillbilly_02"}},{"menuName": "Hippie","data":{"action": "u_m_y_hippie_01"}},{"menuName": "Hippie Female","data":{"action": "a_f_y_hippie_01"}},{"menuName": "Hippie Male","data":{"action": "a_m_y_hippy_01"}},{"menuName": "Hipster","data":{"action": "csb_ramp_hipster"}},{"menuName": "Hipster","data":{"action": "ig_ramp_hipster"}},{"menuName": "Hipster Female","data":{"action": "a_f_y_hipster_01"}},{"menuName": "Hipster Female 2","data":{"action": "a_f_y_hipster_02"}},{"menuName": "Hipster Female 3","data":{"action": "a_f_y_hipster_03"}},{"menuName": "Hipster Female 4","data":{"action": "a_f_y_hipster_04"}},{"menuName": "Hipster Male","data":{"action": "a_m_y_hipster_01"}},{"menuName": "Hipster Male 2","data":{"action": "a_m_y_hipster_02"}},{"menuName": "Hipster Male 3","data":{"action": "a_m_y_hipster_03"}},{"menuName": "Hooker","data":{"action": "s_f_y_hooker_01"}},{"menuName": "Hooker","data":{"action": "s_f_y_hooker_02"}},{"menuName": "Hooker","data":{"action": "s_f_y_hooker_03"}},{"menuName": "Hotposh","data":{"action": "u_f_y_hotposh_01"}},{"menuName": "Hugh Welsh","data":{"action": "csb_hugh"}},{"menuName": "Hunter","data":{"action": "ig_hunter"}},{"menuName": "Hunter-BROKEN","data":{"action": "cs_hunter"}},{"menuName": "Hwaycop","data":{"action": "s_m_y_hwaycop_01"}},{"menuName": "Imporage","data":{"action": "u_m_y_imporage"}},{"menuName": "Imran Shinowa","data":{"action": "csb_imran"}},{"menuName": "Indian Male","data":{"action": "a_m_m_indian_01"}},{"menuName": "Indian Old Female","data":{"action": "a_f_o_indian_01"}},{"menuName": "Indian Young Female","data":{"action": "a_f_y_indian_01"}},{"menuName": "Indian Young Male","data":{"action": "a_m_y_indian_01"}},{"menuName": "Janet","data":{"action": "ig_janet"}},{"menuName": "Janet-BROKEN","data":{"action": "cs_janet"}},{"menuName": "Janitor","data":{"action": "csb_janitor"}},{"menuName": "Janitor","data":{"action": "s_m_m_janitor"}},{"menuName": "Jay_Norris","data":{"action": "ig_jay_norris"}},{"menuName": "Jesus","data":{"action": "u_m_m_jesus_01"}},{"menuName": "Jetskier","data":{"action": "a_m_y_jetski_01"}},{"menuName": "Jewelass","data":{"action": "ig_jewelass"}},{"menuName": "Jewelass","data":{"action": "u_f_y_jewelass_01"}},{"menuName": "Jewelass-BROKEN","data":{"action": "cs_jewelass"}},{"menuName": "Jewelsec","data":{"action": "u_m_m_jewelsec_01"}},{"menuName": "Jewelthief","data":{"action": "u_m_m_jewelthief"}},{"menuName": "Jimmyboston","data":{"action": "ig_jimmyboston"}},{"menuName": "Jimmyboston-BROKEN","data":{"action": "cs_jimmyboston"}},{"menuName": "Jimmydisanto","data":{"action": "ig_jimmydisanto"}},{"menuName": "Jimmydisanto-BROKEN","data":{"action": "cs_jimmydisanto"}},{"menuName": "Joeminuteman","data":{"action": "ig_joeminuteman"}},{"menuName": "Joeminuteman-BROKEN","data":{"action": "cs_joeminuteman"}},{"menuName": "Jogger Female","data":{"action": "a_f_y_runner_01"}},{"menuName": "Jogger Male","data":{"action": "a_m_y_runner_01"}},{"menuName": "Jogger Male 2","data":{"action": "a_m_y_runner_02"}},{"menuName": "Johnnyklebitz","data":{"action": "ig_johnnyklebitz"}},{"menuName": "Johnnyklebitz-BROKEN","data":{"action": "cs_johnnyklebitz"}},{"menuName": "Josef","data":{"action": "ig_josef"}},{"menuName": "Josef-BROKEN","data":{"action": "cs_josef"}},{"menuName": "Josh","data":{"action": "ig_josh"}},{"menuName": "Josh-BROKEN","data":{"action": "cs_josh"}},{"menuName": "Juggalo Female","data":{"action": "a_f_y_juggalo_01"}},{"menuName": "Juggalo Male","data":{"action": "a_m_y_juggalo_01"}},{"menuName": "Justin","data":{"action": "u_m_y_justin"}},{"menuName": "Kerrymcintosh","data":{"action": "ig_kerrymcintosh"}},{"menuName": "Korboss","data":{"action": "g_m_m_korboss_01"}},{"menuName": "Korean","data":{"action": "g_m_y_korean_01"}},{"menuName": "Korean","data":{"action": "g_m_y_korean_02"}},{"menuName": "Korean Female","data":{"action": "a_f_m_ktown_01"}},{"menuName": "Korean Female 2","data":{"action": "a_f_m_ktown_02"}},{"menuName": "Korean Male","data":{"action": "a_m_m_ktown_01"}},{"menuName": "Korean Old Female","data":{"action": "a_f_o_ktown_01"}},{"menuName": "Korean Old Male","data":{"action": "a_m_o_ktown_01"}},{"menuName": "Korean Young Male 3","data":{"action": "a_m_y_ktown_01"}},{"menuName": "Korean Young Male 4","data":{"action": "a_m_y_ktown_02"}},{"menuName": "Korlieut","data":{"action": "g_m_y_korlieut_01"}},{"menuName": "Lamardavis","data":{"action": "ig_lamardavis"}},{"menuName": "Lamardavis-BROKEN","data":{"action": "cs_lamardavis"}},{"menuName": "Lathandy","data":{"action": "s_m_m_lathandy_01"}},{"menuName": "Latino Street Male 2","data":{"action": "a_m_m_stlat_02"}},{"menuName": "Latino Street Young Male","data":{"action": "a_m_y_stlat_01"}},{"menuName": "Latino Young Male","data":{"action": "a_m_y_latino_01"}},{"menuName": "Lazlow","data":{"action": "ig_lazlow"}},{"menuName": "Lazlow-BROKEN","data":{"action": "cs_lazlow"}},{"menuName": "Lestercrest","data":{"action": "ig_lestercrest"}},{"menuName": "Lestercrest-BROKEN","data":{"action": "cs_lestercrest"}},{"menuName": "Lifeinvad","data":{"action": "ig_lifeinvad_01"}},{"menuName": "Lifeinvad","data":{"action": "ig_lifeinvad_02"}},{"menuName": "Lifeinvad","data":{"action": "s_m_m_lifeinvad_01"}},{"menuName": "Lifeinvad-BROKEN","data":{"action": "cs_lifeinvad_01"}},{"menuName": "Linecook","data":{"action": "s_m_m_linecook"}},{"menuName": "Lost","data":{"action": "g_f_y_lost_01"}},{"menuName": "Lost","data":{"action": "g_m_y_lost_01"}},{"menuName": "Lost","data":{"action": "g_m_y_lost_02"}},{"menuName": "Lost","data":{"action": "g_m_y_lost_03"}},{"menuName": "Lsmetro","data":{"action": "s_m_m_lsmetro_01"}},{"menuName": "Magenta","data":{"action": "ig_magenta"}},{"menuName": "Magenta-BROKEN","data":{"action": "cs_magenta"}},{"menuName": "Maid","data":{"action": "s_f_m_maid_01"}},{"menuName": "Malibu Male","data":{"action": "a_m_m_malibu_01"}},{"menuName": "Mani","data":{"action": "u_m_y_mani"}},{"menuName": "Manuel","data":{"action": "ig_manuel"}},{"menuName": "Manuel-BROKEN","data":{"action": "cs_manuel"}},{"menuName": "Mariachi","data":{"action": "s_m_m_mariachi_01"}},{"menuName": "Marine","data":{"action": "csb_ramp_marine"}},{"menuName": "Marine","data":{"action": "s_m_m_marine_01"}},{"menuName": "Marine","data":{"action": "s_m_m_marine_02"}},{"menuName": "Marine","data":{"action": "s_m_y_marine_01"}},{"menuName": "Marine","data":{"action": "s_m_y_marine_02"}},{"menuName": "Marine","data":{"action": "s_m_y_marine_03"}},{"menuName": "Markfost","data":{"action": "u_m_m_markfost"}},{"menuName": "Marnie","data":{"action": "ig_marnie"}},{"menuName": "Marnie-BROKEN","data":{"action": "cs_marnie"}},{"menuName": "Marston","data":{"action": "mp_m_marston_01"}},{"menuName": "Martinmadrazo-BROKEN","data":{"action": "cs_martinmadrazo"}},{"menuName": "Maryan-BROKEN","data":{"action": "cs_maryann"}},{"menuName": "Maryann","data":{"action": "ig_maryann"}},{"menuName": "Maude","data":{"action": "csb_maude"}},{"menuName": "Maude","data":{"action": "ig_maude"}},{"menuName": "Merryweather Merc","data":{"action": "csb_mweather"}},{"menuName": "Meth Addict","data":{"action": "a_m_y_methhead_01"}},{"menuName": "Mex","data":{"action": "ig_ramp_mex"}},{"menuName": "Mexboss","data":{"action": "g_m_m_mexboss_01"}},{"menuName": "Mexboss","data":{"action": "g_m_m_mexboss_02"}},{"menuName": "Mexgang","data":{"action": "g_m_y_mexgang_01"}},{"menuName": "Mexgoon","data":{"action": "g_m_y_mexgoon_01"}},{"menuName": "Mexgoon","data":{"action": "g_m_y_mexgoon_02"}},{"menuName": "Mexgoon","data":{"action": "g_m_y_mexgoon_03"}},{"menuName": "Mexgoon_P","data":{"action": "g_m_y_mexgoon_03_p"}},{"menuName": "Mexican","data":{"action": "csb_ramp_mex"}},{"menuName": "Mexican Rural","data":{"action": "a_m_m_mexcntry_01"}},{"menuName": "Mexican Thug","data":{"action": "a_m_y_mexthug_01"}},{"menuName": "Mexican labourer","data":{"action": "a_m_m_mexlabor_01"}},{"menuName": "Michelle","data":{"action": "ig_michelle"}},{"menuName": "Michelle-BROKEN","data":{"action": "cs_michelle"}},{"menuName": "Migrant","data":{"action": "s_f_y_migrant_01"}},{"menuName": "Migrant","data":{"action": "s_m_m_migrant_01"}},{"menuName": "Militarybum","data":{"action": "u_m_y_militarybum"}},{"menuName": "Milton","data":{"action": "ig_milton"}},{"menuName": "Milton-BROKEN","data":{"action": "cs_milton"}},{"menuName": "Mime","data":{"action": "s_m_y_mime"}},{"menuName": "Miranda","data":{"action": "u_f_m_miranda"}},{"menuName": "Mistress","data":{"action": "u_f_y_mistress"}},{"menuName": "Misty","data":{"action": "mp_f_misty_01"}},{"menuName": "Molly","data":{"action": "ig_molly"}},{"menuName": "Molly-BROKEN","data":{"action": "cs_molly"}},{"menuName": "Motorcross Biker","data":{"action": "a_m_y_motox_01"}},{"menuName": "Motorcross Biker 2x","data":{"action": "a_m_y_motox_02"}},{"menuName": "Mountainbiker","data":{"action": "a_m_y_dhill_01"}},{"menuName": "Moviestar","data":{"action": "u_f_o_moviestar"}},{"menuName": "Movprem","data":{"action": "s_f_y_movprem_01"}},{"menuName": "Movprem","data":{"action": "s_m_m_movprem_01"}},{"menuName": "Movpremf-BROKEN","data":{"action": "cs_movpremf_01"}},{"menuName": "Movpremmale-BROKEN","data":{"action": "cs_movpremmale"}},{"menuName": "Movspace","data":{"action": "s_m_m_movspace_01"}},{"menuName": "Mp_Headtargets","data":{"action": "mp_headtargets"}},{"menuName": "Mrk","data":{"action": "ig_mrk"}},{"menuName": "Mrk-BROKEN","data":{"action": "cs_mrk"}},{"menuName": "Mrs_Thornhill","data":{"action": "ig_mrs_thornhill"}},{"menuName": "Mrs_Thornhill-BROKEN","data":{"action": "cs_mrs_thornhill"}},{"menuName": "Mrsphillips","data":{"action": "ig_mrsphillips"}},{"menuName": "Mrsphillips-BROKEN","data":{"action": "cs_mrsphillips"}},{"menuName": "Natalia","data":{"action": "ig_natalia"}},{"menuName": "Natalia-BROKEN","data":{"action": "cs_natalia"}},{"menuName": "Nervousron","data":{"action": "ig_nervousron"}},{"menuName": "Nervousron-BROKEN","data":{"action": "cs_nervousron"}},{"menuName": "Nigel","data":{"action": "ig_nigel"}},{"menuName": "Nigel-BROKEN","data":{"action": "cs_nigel"}},{"menuName": "Niko","data":{"action": "mp_m_niko_01"}},{"menuName": "OG Boss","data":{"action": "a_m_m_og_boss_01"}},{"menuName": "Old_Man1A","data":{"action": "ig_old_man1a"}},{"menuName": "Old_Man1A-BROKEN","data":{"action": "cs_old_man1a"}},{"menuName": "Old_Man2","data":{"action": "ig_old_man2"}},{"menuName": "Old_Man2-BROKEN","data":{"action": "cs_old_man2"}},{"menuName": "Omega","data":{"action": "ig_omega"}},{"menuName": "Omega-BROKEN","data":{"action": "cs_omega"}},{"menuName": "Oneil","data":{"action": "ig_oneil"}},{"menuName": "Orleans","data":{"action": "ig_orleans"}},{"menuName": "Orleans-BROKEN","data":{"action": "cs_orleans"}},{"menuName": "Ortega","data":{"action": "csb_ortega"}},{"menuName": "Ortega","data":{"action": "ig_ortega"}},{"menuName": "Oscar","data":{"action": "csb_oscar"}},{"menuName": "Paparazzi","data":{"action": "u_m_y_paparazzi"}},{"menuName": "Paparazzi Male","data":{"action": "a_m_m_paparazzi_01"}},{"menuName": "Paper","data":{"action": "ig_paper"}},{"menuName": "Paper-BROKEN","data":{"action": "cs_paper"}},{"menuName": "Paper_P-BROKEN","data":{"action": "cs_paper_p"}},{"menuName": "Paramedic","data":{"action": "s_m_m_paramedic_01"}},{"menuName": "Party","data":{"action": "u_m_y_party_01"}},{"menuName": "Partytarget","data":{"action": "u_m_m_partytarget"}},{"menuName": "Patricia","data":{"action": "ig_patricia"}},{"menuName": "Patricia-BROKEN","data":{"action": "cs_patricia"}},{"menuName": "Pestcont","data":{"action": "s_m_y_pestcont_01"}},{"menuName": "Pilot","data":{"action": "s_m_m_pilot_01"}},{"menuName": "Pilot","data":{"action": "s_m_m_pilot_02"}},{"menuName": "Pilot","data":{"action": "s_m_y_pilot_01"}},{"menuName": "Pogo","data":{"action": "u_m_y_pogo_01"}},{"menuName": "Pologoon","data":{"action": "g_m_y_pologoon_01"}},{"menuName": "Pologoon","data":{"action": "g_m_y_pologoon_02"}},{"menuName": "Pologoon_P","data":{"action": "g_m_y_pologoon_01_p"}},{"menuName": "Pologoon_P","data":{"action": "g_m_y_pologoon_02_p"}},{"menuName": "Polynesian","data":{"action": "a_m_m_polynesian_01"}},{"menuName": "Polynesian Young","data":{"action": "a_m_y_polynesian_01"}},{"menuName": "Poppymich","data":{"action": "u_f_y_poppymich"}},{"menuName": "Porn Dude","data":{"action": "csb_porndudes"}},{"menuName": "Porndudes_P-BROKEN","data":{"action": "csb_porndudes_p"}},{"menuName": "Postal","data":{"action": "s_m_m_postal_01"}},{"menuName": "Postal","data":{"action": "s_m_m_postal_02"}},{"menuName": "Priest","data":{"action": "ig_priest"}},{"menuName": "Priest-BROKEN","data":{"action": "cs_priest"}},{"menuName": "Princess","data":{"action": "u_f_y_princess"}},{"menuName": "Prisguard","data":{"action": "s_m_m_prisguard_01"}},{"menuName": "Prismuscl","data":{"action": "s_m_y_prismuscl_01"}},{"menuName": "Prisoner","data":{"action": "s_m_y_prisoner_01"}},{"menuName": "Prisoner","data":{"action": "u_m_y_prisoner_01"}},{"menuName": "Prolhost","data":{"action": "u_f_o_prolhost_01"}},{"menuName": "Prologue Driver","data":{"action": "u_m_y_proldriver_01"}},{"menuName": "Prologue Driver","data":{"action": "csb_prologuedriver"}},{"menuName": "Prologue Host Female","data":{"action": "a_f_m_prolhost_01"}},{"menuName": "Prologue Host Male","data":{"action": "a_m_m_prolhost_01"}},{"menuName": "Prologue Security","data":{"action": "csb_prolsec"}},{"menuName": "Prolsec","data":{"action": "ig_prolsec_02"}},{"menuName": "Prolsec","data":{"action": "u_m_m_prolsec_01"}},{"menuName": "Prolsec-BROKEN","data":{"action": "cs_prolsec_02"}},{"menuName": "Promourn","data":{"action": "u_f_m_promourn_01"}},{"menuName": "Promourn","data":{"action": "u_m_m_promourn_01"}},{"menuName": "Pros","data":{"action": "mp_g_m_pros_01"}},{"menuName": "Ranger","data":{"action": "s_f_y_ranger_01"}},{"menuName": "Ranger","data":{"action": "s_m_y_ranger_01"}},{"menuName": "Reporter","data":{"action": "csb_reporter"}},{"menuName": "Republican Space Ranger","data":{"action": "u_m_y_rsranger_01"}},{"menuName": "Rivalpap","data":{"action": "u_m_m_rivalpap"}},{"menuName": "Robber","data":{"action": "s_m_y_robber_01"}},{"menuName": "Rocco Pelosi","data":{"action": "csb_roccopelosi"}},{"menuName": "Roccopelosi","data":{"action": "ig_roccopelosi"}},{"menuName": "Rural Meth Addict Female","data":{"action": "a_f_y_rurmeth_01"}},{"menuName": "Rural meth Addict Male","data":{"action": "a_m_m_rurmeth_01"}},{"menuName": "Russiandrunk","data":{"action": "ig_russiandrunk"}},{"menuName": "Russiandrunk-BROKEN","data":{"action": "cs_russiandrunk"}},{"menuName": "Salton Female","data":{"action": "a_f_m_salton_01"}},{"menuName": "Salton Male","data":{"action": "a_m_m_salton_01"}},{"menuName": "Salton Male 2","data":{"action": "a_m_m_salton_02"}},{"menuName": "Salton Male 3","data":{"action": "a_m_m_salton_03"}},{"menuName": "Salton Male 4","data":{"action": "a_m_m_salton_04"}},{"menuName": "Salton Old Female","data":{"action": "a_f_o_salton_01"}},{"menuName": "Salton Old Male","data":{"action": "a_m_o_salton_01"}},{"menuName": "Salton Young Male","data":{"action": "a_m_y_salton_01"}},{"menuName": "Salvaboss","data":{"action": "g_m_y_salvaboss_01"}},{"menuName": "Salvagoon","data":{"action": "g_m_y_salvagoon_01"}},{"menuName": "Salvagoon","data":{"action": "g_m_y_salvagoon_02"}},{"menuName": "Salvagoon","data":{"action": "g_m_y_salvagoon_03"}},{"menuName": "Salvagoon_P","data":{"action": "g_m_y_salvagoon_03_p"}},{"menuName": "Scientist","data":{"action": "s_m_m_scientist_01"}},{"menuName": "Screen_Writer","data":{"action": "ig_screen_writer"}},{"menuName": "Screenwriter","data":{"action": "csb_screen_writer"}},{"menuName": "Scrubs","data":{"action": "s_f_y_scrubs_01"}},{"menuName": "Security","data":{"action": "s_m_m_security_01"}},{"menuName": "Sheriff","data":{"action": "s_f_y_sheriff_01"}},{"menuName": "Sheriff","data":{"action": "s_m_y_sheriff_01"}},{"menuName": "Shop_High","data":{"action": "s_f_m_shop_high"}},{"menuName": "Shop_Low","data":{"action": "s_f_y_shop_low"}},{"menuName": "Shop_Mask","data":{"action": "s_m_y_shop_mask"}},{"menuName": "Shop_Mid","data":{"action": "s_f_y_shop_mid"}},{"menuName": "Shopkeep","data":{"action": "mp_m_shopkeep_01"}},{"menuName": "Siemonyetarian","data":{"action": "ig_siemonyetarian"}},{"menuName": "Siemonyetarian-BROKEN","data":{"action": "cs_siemonyetarian"}},{"menuName": "Skater Female","data":{"action": "a_f_y_skater_01"}},{"menuName": "Skater Male","data":{"action": "a_m_m_skater_01"}},{"menuName": "Skater Young Male","data":{"action": "a_m_y_skater_01"}},{"menuName": "Skater Young Male 2","data":{"action": "a_m_y_skater_02"}},{"menuName": "Skid Row Female","data":{"action": "a_f_m_skidrow_01"}},{"menuName": "Skid Row Male","data":{"action": "a_m_m_skidrow_01"}},{"menuName": "Snowcop","data":{"action": "s_m_m_snowcop_01"}},{"menuName": "Solomon","data":{"action": "ig_solomon"}},{"menuName": "Solomon-BROKEN","data":{"action": "cs_solomon"}},{"menuName": "South Central Female","data":{"action": "a_f_m_soucent_01"}},{"menuName": "South Central Female 2","data":{"action": "a_f_m_soucent_02"}},{"menuName": "South Central Female Dressy","data":{"action": "a_f_y_scdressy_01"}},{"menuName": "South Central Latino Male","data":{"action": "a_m_m_socenlat_01"}},{"menuName": "South Central MC Female","data":{"action": "a_f_m_soucentmc_01"}},{"menuName": "South Central Male","data":{"action": "a_m_m_soucent_01"}},{"menuName": "South Central Male 2","data":{"action": "a_m_m_soucent_02"}},{"menuName": "South Central Male 3","data":{"action": "a_m_m_soucent_03"}},{"menuName": "South Central Male 4","data":{"action": "a_m_m_soucent_04"}},{"menuName": "South Central Old Female","data":{"action": "a_f_o_soucent_01"}},{"menuName": "South Central Old Female 2","data":{"action": "a_f_o_soucent_02"}},{"menuName": "South Central Old Male","data":{"action": "a_m_o_soucent_01"}},{"menuName": "South Central Old Male 2","data":{"action": "a_m_o_soucent_02"}},{"menuName": "South Central Old Male 3","data":{"action": "a_m_o_soucent_03"}},{"menuName": "South Central Young Female","data":{"action": "a_f_y_soucent_01"}},{"menuName": "South Central Young Female 2","data":{"action": "a_f_y_soucent_02"}},{"menuName": "South Central Young Female 3","data":{"action": "a_f_y_soucent_03"}},{"menuName": "South Central Young Male","data":{"action": "a_m_y_soucent_01"}},{"menuName": "South Central Young Male 2","data":{"action": "a_m_y_soucent_02"}},{"menuName": "South Central Young Male 3","data":{"action": "a_m_y_soucent_03"}},{"menuName": "South Central Young Male 4","data":{"action": "a_m_y_soucent_04"}},{"menuName": "Sports Biker","data":{"action": "u_m_y_sbike"}},{"menuName": "Spyactor","data":{"action": "u_m_m_spyactor"}},{"menuName": "Spyactress","data":{"action": "u_f_y_spyactress"}},{"menuName": "Stag Party Groom","data":{"action": "u_m_y_staggrm_01"}},{"menuName": "Stevehains","data":{"action": "ig_stevehains"}},{"menuName": "Stevehains-BROKEN","data":{"action": "cs_stevehains"}},{"menuName": "Stretch","data":{"action": "ig_stretch"}},{"menuName": "Stretch-BROKEN","data":{"action": "cs_stretch"}},{"menuName": "Stripper","data":{"action": "csb_stripper_01"}},{"menuName": "Stripper","data":{"action": "s_f_y_stripper_01"}},{"menuName": "Stripper","data":{"action": "s_f_y_stripper_02"}},{"menuName": "Stripper 2","data":{"action": "csb_stripper_02"}},{"menuName": "Stripperlite","data":{"action": "mp_f_stripperlite"}},{"menuName": "Stripperlite","data":{"action": "s_f_y_stripperlite"}},{"menuName": "Strperf","data":{"action": "s_m_m_strperf_01"}},{"menuName": "Strpreach","data":{"action": "s_m_m_strpreach_01"}},{"menuName": "Strpunk","data":{"action": "g_m_y_strpunk_01"}},{"menuName": "Strpunk","data":{"action": "g_m_y_strpunk_02"}},{"menuName": "Strvend","data":{"action": "s_m_m_strvend_01"}},{"menuName": "Strvend","data":{"action": "s_m_y_strvend_01"}},{"menuName": "Sunbather Male","data":{"action": "a_m_y_sunbathe_01"}},{"menuName": "Surfer","data":{"action": "a_m_y_surfer_01"}},{"menuName": "Swat","data":{"action": "s_m_y_swat_01"}},{"menuName": "Sweatshop","data":{"action": "s_f_m_sweatshop_01"}},{"menuName": "Sweatshop","data":{"action": "s_f_y_sweatshop_01"}},{"menuName": "Talina","data":{"action": "ig_talina"}},{"menuName": "Tanisha","data":{"action": "ig_tanisha"}},{"menuName": "Tanisha-BROKEN","data":{"action": "cs_tanisha"}},{"menuName": "Taocheng","data":{"action": "ig_taocheng"}},{"menuName": "Taocheng-BROKEN","data":{"action": "cs_taocheng"}},{"menuName": "Taostranslator","data":{"action": "ig_taostranslator"}},{"menuName": "Taostranslator-BROKEN","data":{"action": "cs_taostranslator"}},{"menuName": "Taostranslator_P","data":{"action": "ig_taostranslator_p"}},{"menuName": "Taphillbilly","data":{"action": "u_m_o_taphillbilly"}},{"menuName": "Tattoo Artist","data":{"action": "u_m_y_tattoo_01"}},{"menuName": "Tennis Player Female","data":{"action": "a_f_y_tennis_01"}},{"menuName": "Tennis Player Male","data":{"action": "a_m_m_tennis_01"}},{"menuName": "Tenniscoach","data":{"action": "ig_tenniscoach"}},{"menuName": "Tenniscoach-BROKEN","data":{"action": "cs_tenniscoach"}},{"menuName": "Terry","data":{"action": "ig_terry"}},{"menuName": "Terry-BROKEN","data":{"action": "cs_terry"}},{"menuName": "Tom-BROKEN","data":{"action": "cs_tom"}},{"menuName": "Tomepsilon","data":{"action": "ig_tomepsilon"}},{"menuName": "Tomepsilon-BROKEN","data":{"action": "cs_tomepsilon"}},{"menuName": "Tonya","data":{"action": "csb_tonya"}},{"menuName": "Tonya","data":{"action": "ig_tonya"}},{"menuName": "Topless","data":{"action": "a_f_y_topless_01"}},{"menuName": "Tourist Female","data":{"action": "a_f_m_tourist_01"}},{"menuName": "Tourist Male","data":{"action": "a_m_m_tourist_01"}},{"menuName": "Tourist Young Female","data":{"action": "a_f_y_tourist_01"}},{"menuName": "Tourist Young Female 2","data":{"action": "a_f_y_tourist_02"}},{"menuName": "Tracydisanto","data":{"action": "ig_tracydisanto"}},{"menuName": "Tracydisanto-BROKEN","data":{"action": "cs_tracydisanto"}},{"menuName": "Traffic Warden","data":{"action": "csb_trafficwarden"}},{"menuName": "Trafficwarden","data":{"action": "ig_trafficwarden"}},{"menuName": "Tramp","data":{"action": "u_m_o_tramp_01"}},{"menuName": "Tramp Female","data":{"action": "a_f_m_tramp_01"}},{"menuName": "Tramp Male","data":{"action": "a_m_m_tramp_01"}},{"menuName": "Tramp Old Male","data":{"action": "a_m_o_tramp_01"}},{"menuName": "Tranvestite Male","data":{"action": "a_m_m_tranvest_01"}},{"menuName": "Tranvestite Male 2","data":{"action": "a_m_m_tranvest_02"}},{"menuName": "Trucker","data":{"action": "s_m_m_trucker_01"}},{"menuName": "Tylerdix","data":{"action": "ig_tylerdix"}},{"menuName": "Ups","data":{"action": "s_m_m_ups_01"}},{"menuName": "Ups","data":{"action": "s_m_m_ups_02"}},{"menuName": "Uscg","data":{"action": "s_m_y_uscg_01"}},{"menuName": "Vagos","data":{"action": "g_f_y_vagos_01"}},{"menuName": "Valet","data":{"action": "s_m_y_valet_01"}},{"menuName": "Vespucci Beach Male","data":{"action": "a_m_y_beachvesp_01"}},{"menuName": "Vespucci Beach Male","data":{"action": "a_m_y_beachvesp_02"}},{"menuName": "Vinewood Douche","data":{"action": "a_m_y_vindouche_01"}},{"menuName": "Vinewood Female","data":{"action": "a_f_y_vinewood_01"}},{"menuName": "Vinewood Female 2","data":{"action": "a_f_y_vinewood_02"}},{"menuName": "Vinewood Female 3","data":{"action": "a_f_y_vinewood_03"}},{"menuName": "Vinewood Female 4","data":{"action": "a_f_y_vinewood_04"}},{"menuName": "Vinewood Male","data":{"action": "a_m_y_vinewood_01"}},{"menuName": "Vinewood Male 2","data":{"action": "a_m_y_vinewood_02"}},{"menuName": "Vinewood Male 3","data":{"action": "a_m_y_vinewood_03"}},{"menuName": "Vinewood Male 4","data":{"action": "a_m_y_vinewood_04"}},{"menuName": "Wade","data":{"action": "ig_wade"}},{"menuName": "Wade-BROKEN","data":{"action": "cs_wade"}},{"menuName": "Waiter","data":{"action": "s_m_y_waiter_01"}},{"menuName": "White Street Male","data":{"action": "a_m_y_stwhi_01"}},{"menuName": "White Street Male","data":{"action": "a_m_y_stwhi_02"}},{"menuName": "Willyfist","data":{"action": "u_m_m_willyfist"}},{"menuName": "Winclean","data":{"action": "s_m_y_winclean_01"}},{"menuName": "Xmech","data":{"action": "s_m_y_xmech_01"}},{"menuName": "Xmech","data":{"action": "s_m_y_xmech_02"}},{"menuName": "Yoga Female","data":{"action": "a_f_y_yoga_01"}},{"menuName": "Yoga Male","data":{"action": "a_m_y_yoga_01"}},{"menuName": "Zimbor","data":{"action": "ig_zimbor"}},{"menuName": "Zimbor-BROKEN","data":{"action": "cs_zimbor"}},{"menuName": "Zombie","data":{"action": "u_m_y_zombie_01"}}];


// Vehicle Spawning Database
var vehicle_supercars = [{ "menuName" : "Annis RE-7B","data":{"action": "LE7B" }},{ "menuName" : "Bravado Banshee 900R","data":{"action": "BANSHEE2" }},{ "menuName" : "Coil Voltic","data":{"action": "VOLTIC" }},{ "menuName" : "Emperor ETR1","data":{"action": "SHEAVA" }},{ "menuName" : "Grotti Cheetah","data":{"action": "CHEETAH" }},{ "menuName" : "Grotti X80 Proto","data":{"action": "PROTOTIPO" }},{ "menuName" : "Grotti Turismo R","data":{"action": "TURISMOR" }},{ "menuName" : "Karin Sultan RS","data":{"action": "SULTANRS" }},{ "menuName" : "Overflod Entity XF","data":{"action": "ENTITYXF" }},{ "menuName" : "Pegassi Infernus","data":{"action": "INFERNUS" }},{ "menuName" : "Pegassi Osiris","data":{"action": "OSIRIS" }},{ "menuName" : "Pegassi Reaper","data":{"action": "REAPER" }},{ "menuName" : "Pegassi Vacca","data":{"action": "VACCA" }},{ "menuName" : "Pegassi Zentorno","data":{"action": "ZENTORNO" }},{ "menuName" : "Pfister 811","data":{"action": "PFISTER811" }},{ "menuName" : "Progen T20","data":{"action": "T20" }},{ "menuName" : "Progen Tyrus","data":{"action": "TYRUS" }},{ "menuName" : "Truffade Adder","data":{"action": "ADDER" }},{ "menuName" : "Vapid Bullet","data":{"action": "BULLET" }},{ "menuName" : "Vapid FMJ","data":{"action": "FMJ" }}];
var vehicle_sports = [{ "menuName" : "Albany Alpha","data":{"action": "ALPHA" }},{ "menuName" : "Annis Elegy RH8","data":{"action": "ELEGY2" }},{ "menuName" : "Benefactor Feltzer","data":{"action": "FELTZER2" }},{ "menuName" : "Benefactor Schwarzer","data":{"action": "SCHWARZER" }},{ "menuName" : "Benefactor Surano","data":{"action": "SURANO" }},{ "menuName" : "BF Raptor","data":{"action": "RAPTOR" }},{ "menuName" : "Bravado Banshee","data":{"action": "BANSHEE" }},{ "menuName" : "Bravado Buffalo","data":{"action": "BUFFALO" }},{ "menuName" : "Bravado Buffalo S","data":{"action": "BUFFALO2" }},{ "menuName" : "Bravado Buffalo S (Race)","data":{"action": "BUFFALO3" }},{ "menuName" : "Bravado Verlierer","data":{"action": "VERLIERER2" }},{ "menuName" : "Declasse Drift Tampa","data":{"action": "TAMPA2" }},{ "menuName" : "Dewbauchee Massacro","data":{"action": "MASSACRO" }},{ "menuName" : "Dewbauchee Massacro (Race)","data":{"action": "MASSACRO2" }},{ "menuName" : "Dewbauchee Rapid GT","data":{"action": "RAPIDGT" }},{ "menuName" : "Dewbauchee Rapid GT Cabrio","data":{"action": "RAPIDGT2" }},{ "menuName" : "Dewbauchee Seven-70","data":{"action": "SEVEN70" }},{ "menuName" : "Dinka Blista Compact","data":{"action": "BLISTA2" }},{ "menuName" : "Dinka Blista Compact (Race)","data":{"action": "BLISTA3" }},{ "menuName" : "Dinka Jester","data":{"action": "JESTER" }},{ "menuName" : "Dinka Jester (Race)","data":{"action": "JESTER2" }},{ "menuName" : "Grotti Bestia GTS","data":{"action": "BESTIAGTS" }},{ "menuName" : "Grotti Carbonizzare","data":{"action": "CARBONIZZARE" }},{ "menuName" : "Hijak Khamelion","data":{"action": "KHAMELION" }},{ "menuName" : "Invetero Coquette","data":{"action": "COQUETTE" }},{ "menuName" : "Karin Futo","data":{"action": "FUTO" }},{ "menuName" : "Karin Kuruma","data":{"action": "KURUMA" }},{ "menuName" : "Karin Kuruma (Armoured)","data":{"action": "KURUMA2" }},{ "menuName" : "Karin Sultan","data":{"action": "SULTAN" }},{ "menuName" : "Lampadati Furore GT","data":{"action": "FUROREGT" }},{ "menuName" : "Lampadati Tropos Rallye","data":{"action": "TROPOS" }},{ "menuName" : "Maibatsu Penumbra","data":{"action": "PENUMBRA" }},{ "menuName" : "Obey 9F","data":{"action": "NINEF" }},{ "menuName" : "Obey 9F Cabrio","data":{"action": "NINEF2" }},{ "menuName" : "Obey Omnis","data":{"action": "OMNIS" }},{ "menuName" : "Ocelot Lynx","data":{"action": "LYNX" }},{ "menuName" : "Phister Comet","data":{"action": "COMET2" }},{ "menuName" : "Schyster Fusilade","data":{"action": "FUSILADE" }}];
var vehicle_sportsclassics = [{ "menuName" : "Albany Manana","data":{"action": "MANANA" }},{ "menuName" : "Albany Roosevelt 1","data":{"action": "BTYPE" }},{ "menuName" : "Albany Roosevelt 2","data":{"action": "BTYPE3" }},{ "menuName" : "Benefactor Stirling GT","data":{"action": "FELTZER3" }},{ "menuName" : "Declasse Tornado","data":{"action": "TORNADO" }},{ "menuName" : "Declasse Tornado (Rusty)","data":{"action": "TORNADO2" }},{ "menuName" : "Declasse Tornado Cabrio","data":{"action": "TORNADO3" }},{ "menuName" : "Declasse Tornado Cabrio (Rusty)","data":{"action": "TORNADO4" }},{ "menuName" : "Declasse Tornado Rat Rod","data":{"action": "TORNADO6" }},{ "menuName" : "Dewbauchee JB 700","data":{"action": "JB700" }},{ "menuName" : "Grotti Stinger","data":{"action": "STINGER" }},{ "menuName" : "Grotti Stinger GT","data":{"action": "STINGERGT" }},{ "menuName" : "Invetero Coquette Classic","data":{"action": "COQUETTE2" }},{ "menuName" : "Lampadati Casco","data":{"action": "CASCO" }},{ "menuName" : "Lampadati Pigalle","data":{"action": "PIGALLE" }},{ "menuName" : "Pegassi Monroe","data":{"action": "MONROE" }},{ "menuName" : "Truffade Z-Type","data":{"action": "ZTYPE" }},{ "menuName" : "Vapid Peyote","data":{"action": "PEYOTE" }}];
var vehicle_muscle = [{ "menuName" : "Albany Buccaneer","data":{"action": "BUCCANEER" }},{ "menuName" : "Albany Franken Strange","data":{"action": "BTYPE2" }},{ "menuName" : "Albany Lurcher","data":{"action": "LURCHER" }},{ "menuName" : "Albany Virgo","data":{"action": "VIRGO" }},{ "menuName" : "Bravado Gauntlet","data":{"action": "GAUNTLET" }},{ "menuName" : "Bravado Gauntlet (Race)","data":{"action": "GAUNTLET2" }},{ "menuName" : "Cheval Picador","data":{"action": "PICADOR" }},{ "menuName" : "Declasse Mamba","data":{"action": "MAMBA" }},{ "menuName" : "Declasse Tampa","data":{"action": "TAMPA" }},{ "menuName" : "Declasse Sabre Turbo","data":{"action": "SABREGT" }},{ "menuName" : "Declasse Stallion","data":{"action": "STALION" }},{ "menuName" : "Declasse Staillion (Race)","data":{"action": "STALION2" }},{ "menuName" : "Declasse Vigero","data":{"action": "VIGERO" }},{ "menuName" : "Declasse Voodoo","data":{"action": "VOODOO2" }},{ "menuName" : "Dundreary Virgo Classic","data":{"action": "VIRGO" }},{ "menuName" : "Imponte Duke O' Death","data":{"action": "DUKES2" }},{ "menuName" : "Imponte Dukes","data":{"action": "DUKES" }},{ "menuName" : "Imponte Nightshade","data":{"action": "NIGHTSHADE" }},{ "menuName" : "Imponte Pheonix","data":{"action": "PHOENIX" }},{ "menuName" : "Imponte Ruiner","data":{"action": "RUINER" }},{ "menuName" : "Invetero Coquette BlackFin","data":{"action": "COQUETTE3" }},{ "menuName" : "Vapid Blade","data":{"action": "BLADE" }},{ "menuName" : "Vapid Chino","data":{"action": "CHINO" }},{ "menuName" : "Vapid Dominator","data":{"action": "DOMINATOR" }},{ "menuName" : "Vapid Dominator (Race)","data":{"action": "DOMINATOR2" }},{ "menuName" : "Vapid Hotknife","data":{"action": "HOTKNIFE" }},{ "menuName" : "Vapid Slamvan","data":{"action": "SLAMVAN" }},{ "menuName" : "Vapid Slamvan (Lost MC)","data":{"action": "SLAMVAN2" }},{ "menuName" : "Willard Faction","data":{"action": "FACTION" }}];
var vehicle_lowriders = [{ "menuName" : "Albany Buccaneer","data":{"action": "BUCCANEER" }},{ "menuName" : "Albany Primo","data":{"action": "PRIMO" }},{ "menuName" : "Declasse Moonbeam","data":{"action": "MOONBEAM" }},{ "menuName" : "Declasse Sabre Turbo","data":{"action": "SABREGT" }},{ "menuName" : "Declasse Tornado","data":{"action": "TORNADO" }},{ "menuName" : "Declasse Voodoo","data":{"action": "VOODOO2" }},{ "menuName" : "Dundreary Virgo Classic","data":{"action": "VIRGO3" }},{ "menuName" : "Vapid Chino","data":{"action": "CHINO2" }},{ "menuName" : "Vapid Minivan","data":{"action": "MINIVAN" }},{ "menuName" : "Vapid Slamvan","data":{"action": "SLAMVAN" }},{ "menuName" : "Willard Faction","data":{"action": "FACTION2" }},{ "menuName" : "Willard Faction Donk","data":{"action": "FACTION3" }}];
var vehicle_coupes = [{ "menuName" : "Dewbauchee Exemplar","data":{"action": "EXEMPLAR" }},{ "menuName" : "Enus Cognoscenti Cabrio","data":{"action": "COGCABRIO" }},{ "menuName" : "Enus Windsor","data":{"action": "WINDSOR" }},{ "menuName" : "Enus Windsor Drop","data":{"action": "WINDSOR2" }},{ "menuName" : "Lampadati Felon","data":{"action": "FELON" }},{ "menuName" : "Lampadati Felon GT","data":{"action": "FELON2" }},{ "menuName" : "Ocelot F620","data":{"action": "F620" }},{ "menuName" : "Ocelot Jackal","data":{"action": "JACKAL" }},{ "menuName" : "Ubermacht Sentinel","data":{"action": "SENTINEL" }},{ "menuName" : "Ubermacht Sentinel XS","data":{"action": "SENTINEL2" }},{ "menuName" : "Ubermacht Zion","data":{"action": "ORACLE" }},{ "menuName" : "Ubermacht Zion Cabrio","data":{"action": "ORACLE2" }}];
var vehicle_sedans = [{ "menuName" : "Albany Emperor","data":{"action": "EMPEROR" }},{ "menuName" : "Albany Emperor (Rusty)","data":{"action": "EMPEROR2" }},{ "menuName" : "Albany Emperor (Snow)","data":{"action": "EMPEROR3" }},{ "menuName" : "Albany Primo","data":{"action": "PRIMO" }},{ "menuName" : "Albany Washington","data":{"action": "WASHINGTON" }},{ "menuName" : "Benefactor Glendale","data":{"action": "GLENDALE" }},{ "menuName" : "Benefactor Schafter","data":{"action": "SCHAFTER2" }},{ "menuName" : "Chariot Romero Hearse","data":{"action": "ROMERO" }},{ "menuName" : "Cheval Fugitive","data":{"action": "FUGITIVE" }},{ "menuName" : "Cheval Surge","data":{"action": "SURGE" }},{ "menuName" : "Declasse Asea","data":{"action": "ASEA" }},{ "menuName" : "Declasse Asea (snow)","data":{"action": "ASEA2" }},{ "menuName" : "Declasse Premier","data":{"action": "PREMIER" }},{ "menuName" : "Dundreary Regina","data":{"action": "REGINA" }},{ "menuName" : "Dundreary Stretch","data":{"action": "STRETCH" }},{ "menuName" : "Enus Super Diamond","data":{"action": "SUPERD" }},{ "menuName" : "Karin Asterope","data":{"action": "ASTEROPE" }},{ "menuName" : "Karin Intruder","data":{"action": "INTRUDER" }},{ "menuName" : "Obey Tailgater","data":{"action": "TAILGATER" }},{ "menuName" : "Ubermacht Oracle","data":{"action": "ORACLE" }},{ "menuName" : "Ubermacht Oracle Mk2","data":{"action": "ORACLE2" }},{ "menuName" : "Vapid Stanier","data":{"action": "STANIER" }},{ "menuName" : "Vapid Stanier (Taxi)","data":{"action": "TAXI" }},{ "menuName" : "Vulcan Ingot","data":{"action": "INGOT" }},{ "menuName" : "Vulcar Warrener","data":{"action": "WARRENER" }},{ "menuName" : "Zirconium Stratum","data":{"action": "STRATUM" }}];
var vehicle_compacts = [{ "menuName" : "Benefactor Panto","data":{"action": "PANTO" }},{ "menuName" : "Bollokan Prairie","data":{"action": "PRAIRIE" }},{ "menuName" : "Declasse Rhapsody","data":{"action": "RHAPSODY" }},{ "menuName" : "Dinka Blista","data":{"action": "BLISTA" }},{ "menuName" : "Grotti Brioso R/A","data":{"action": "BRIOSO" }},{ "menuName" : "Karin Dilettante","data":{"action": "DILETTANTE" }},{ "menuName" : "Karin Dilettante (FlyUS)","data":{"action": "DILETTANTE2" }},{ "menuName" : "Weeny Issi","data":{"action": "ISSI2" }}];
var vehicle_suvs = [{ "menuName" : "Albany Cavalcade","data":{"action": "CAVALCADE" }},{ "menuName" : "Albany Cavalcade Mk2","data":{"action": "CAVALCADE2" }},{ "menuName" : "Benefactor Dubsta","data":{"action": "DUBSTA" }},{ "menuName" : "Benefactor Dubsta (Flat Black)","data":{"action": "DUBSTA2" }},{ "menuName" : "Benefactor Serrano","data":{"action": "SERRANO" }},{ "menuName" : "Bravado Gresley","data":{"action": "GRESLEY" }},{ "menuName" : "Canis Mesa","data":{"action": "MESA" }},{ "menuName" : "Canis Mesa (Snow)","data":{"action": "MESA2" }},{ "menuName" : "Canis Seminole","data":{"action": "SEMINOLE" }},{ "menuName" : "Declasse Granger","data":{"action": "GRANGER" }},{ "menuName" : "Dundreary Landstalker","data":{"action": "LANDSTALKER" }},{ "menuName" : "Emperor Habanero","data":{"action": "HABANERO" }},{ "menuName" : "Enus Huntley S","data":{"action": "HUNTLEY" }},{ "menuName" : "Fathom FQ 2","data":{"action": "FQ2" }},{ "menuName" : "Gallivanter Baller (Large)","data":{"action": "BALLER" }},{ "menuName" : "Gallivanter Baller (Small)","data":{"action": "BALLER2" }},{ "menuName" : "Karin BeeJay XL","data":{"action": "BJXL" }},{ "menuName" : "Mammoth Patriot","data":{"action": "PATRIOT" }},{ "menuName" : "Obey Rocoto","data":{"action": "ROCOTO" }},{ "menuName" : "Vapid Contender","data":{"action": "CONTENDER" }},{ "menuName" : "Vapid Radius","data":{"action": "RADI" }}];
var vehicle_offroad = [{ "menuName" : "Benefactor Dubsta 6x6","data":{"action": "DUBSTA3" }},{ "menuName" : "BF Bifta","data":{"action": "BIFTA" }},{ "menuName" : "BF Injection","data":{"action": "BFINJECTION" }},{ "menuName" : "Bravado Dune","data":{"action": "DUNE" }},{ "menuName" : "Bravado Duneloader","data":{"action": "DLOADER" }},{ "menuName" : "Bravado Space Docker","data":{"action": "DUNE2" }},{ "menuName" : "Canis Bodhi","data":{"action": "BODHI2" }},{ "menuName" : "Canis Kalahari","data":{"action": "KALAHARI" }},{ "menuName" : "Canis Mesa (Off-Road)","data":{"action": "MESA3" }},{ "menuName" : "Cheval Marshall","data":{"action": "MARSHALL" }},{ "menuName" : "Coil Brawler","data":{"action": "BRAWLER" }},{ "menuName" : "Declasse Rancher XL","data":{"action": "RANCHERXL" }},{ "menuName" : "Declasse Rancher XL (Snow)","data":{"action": "RANCHERXL2" }},{ "menuName" : "Insurgent","data":{"action": "INSURGENT" }},{ "menuName" : "Insurgent (Gun Mount)","data":{"action": "INSURGENT2" }},{ "menuName" : "Karin Rebel","data":{"action": "REBEL" }},{ "menuName" : "Karin Rebel (Rusty)","data":{"action": "REBEL2" }},{ "menuName" : "Karin Technical","data":{"action": "TECHNICAL" }},{ "menuName" : "Nagasaki Blazer","data":{"action": "BLAZER" }},{ "menuName" : "Nagasaki Blazer (Hot Rod)","data":{"action": "BLAZER3" }},{ "menuName" : "Nagasaki Blazer (Lifeguard)","data":{"action": "BLAZER2" }},{ "menuName" : "Nagasaki Blazer (Street)","data":{"action": "BLAZER4" }},{ "menuName" : "Vapid Desert Raid","data":{"action": "TROPHYTRUCK2" }},{ "menuName" : "Vapid Guardian","data":{"action": "GUARDIAN" }},{ "menuName" : "Vapid Liberator","data":{"action": "MONSTER" }},{ "menuName" : "Vapid Sandking","data":{"action": "SANDKING2" }},{ "menuName" : "Vapid Sandking XL","data":{"action": "SANDKING" }},{ "menuName" : "Vapid Trophy Truck","data":{"action": "TROPHYTRUCK" }}];
var vehicle_vip = [{ "menuName" : "Benefactor Schafter V12","data":{"action": "SCHAFTER3" }},{ "menuName" : "Benefactor Schafter V12 (Armored)","data":{"action": "SCHAFTER5" }},{ "menuName" : "Benefactor Schafter LWB","data":{"action": "SCHAFTER4" }},{ "menuName" : "Benefactor Schafter LWB (Armored)","data":{"action": "SCHAFTER6" }},{ "menuName" : "Benefactor Turreted Limo","data":{"action": "LIMO2" }},{ "menuName" : "Benefactor XLS","data":{"action": "XLS" }},{ "menuName" : "Benefactor XLS (Armored)","data":{"action": "XLS2" }},{ "menuName" : "Enus Cognoscenti","data":{"action": "COGNOSCENTI" }},{ "menuName" : "Enus Cognoscenti (Armored)","data":{"action": "COGNOSCENTI2" }},{ "menuName" : "Enus Cognoscenti 55","data":{"action": "COG552" }},{ "menuName" : "Enus Cognoscenti 55 (Armored)","data":{"action": "COG552" }},{ "menuName" : "Gallivanter Baller LE","data":{"action": "BALLER3" }},{ "menuName" : "Gallivanter Baller LE (Armored)","data":{"action": "BALLER5" }},{ "menuName" : "Gallivanter Baller LE LWB","data":{"action": "BALLER4" }},{ "menuName" : "Gallivanter Baller LE LWB (Armored)","data":{"action": "BALLER6" }}];
var vehicle_pickups = [{ "menuName" : "Bravado Bison","data":{"action": "BISON" }},{ "menuName" : "Bravado Bison (Backrack)","data":{"action": "BISON2" }},{ "menuName" : "Bravado Bison (Construction)","data":{"action": "BISON3" }},{ "menuName" : "Bravado Ratloader","data":{"action": "RATLOADER2" }},{ "menuName" : "Bravado Ratloader (Rusty)","data":{"action": "RATLOADER" }},{ "menuName" : "Vapid Bobcat","data":{"action": "BOBCATXL" }},{ "menuName" : "Vapid Sadler","data":{"action": "SADLER" }},{ "menuName" : "Vapid Sadler (Snow)","data":{"action": "SADLER2" }}];
var vehicle_vans = [{ "menuName" : "BF Surfer","data":{"action": "SURFER" }},{ "menuName" : "BF Surfer (Rusty)","data":{"action": "SURFER2" }},{ "menuName" : "Bravado Paradise","data":{"action": "PARADISE" }},{ "menuName" : "Bravado Rumpo Custom","data":{"action": "RUMPO3" }},{ "menuName" : "Bravado Rumpo (Deludamol)","data":{"action": "RUMPO2" }},{ "menuName" : "Bravado Rumpo (Weazel News)","data":{"action": "RUMPO" }},{ "menuName" : "Bravado Youga","data":{"action": "YOUGA" }},{ "menuName" : "Bravado Youga Classic","data":{"action": "YOUGA2" }},{ "menuName" : "Brute Camper","data":{"action": "CAMPER" }},{ "menuName" : "Brute Pony (Business)","data":{"action": "PONY" }},{ "menuName" : "Brute Pony (Cannibus Shop)","data":{"action": "PONY2" }},{ "menuName" : "Brute Taco Van","data":{"action": "TACO" }},{ "menuName" : "Declasse Burrito","data":{"action": "BURRITO3" }},{ "menuName" : "Declasse Burrito (Bug Stars)","data":{"action": "BURRITO2" }},{ "menuName" : "Declasse Burrito (Construction)","data":{"action": "BURRITO4" }},{ "menuName" : "Declasse Burrito (Gang)","data":{"action": "GBURRITO2" }},{ "menuName" : "Declasse Burrito (Graphics)","data":{"action": "BURRITO" }},{ "menuName" : "Declasse Burrito (Snow)","data":{"action": "BURRITO5" }},{ "menuName" : "Declasse Burrito (The Lost)","data":{"action": "GBURRITO" }},{ "menuName" : "Declasse Moonbeam","data":{"action": "MOONBEAM" }},{ "menuName" : "Vapid Minivan","data":{"action": "MINIVAN" }},{ "menuName" : "Vapid Speedo","data":{"action": "SPEEDO" }},{ "menuName" : "Vapid Speedo (Clown)","data":{"action": "SPEEDO2" }},{ "menuName" : "Zirconium Journey","data":{"action": "JOURNEY" }}];
var vehicle_trucks = [{ "menuName" : "Brute Boxville (Go Postal)","data":{"action": "BOXVILLE2" }},{ "menuName" : "Brute Boxville (Humane Labs)","data":{"action": "BOXVILLE3" }},{ "menuName" : "Brute Boxville (Post OP)","data":{"action": "BOXVILLE4" }},{ "menuName" : "Brute Boxville (Water & Power)","data":{"action": "BOXVILLE" }},{ "menuName" : "Brute Stockade","data":{"action": "STOCKADE" }},{ "menuName" : "Brute Stockade (Snow)","data":{"action": "STOCKADE3" }},{ "menuName" : "Brute Tipper (2 Axle)","data":{"action": "TIPTRUCK" }},{ "menuName" : "Brute Tipper (3 Axle)","data":{"action": "TIPTRUCK2" }},{ "menuName" : "Cutter","data":{"action": "CUTTER" }},{ "menuName" : "Dock Handler","data":{"action": "HANDLER" }},{ "menuName" : "Dock Tug","data":{"action": "DOCKTUG" }},{ "menuName" : "Dump Truck","data":{"action": "DUMP" }},{ "menuName" : "HVY Biff","data":{"action": "BIFF" }},{ "menuName" : "Jobuilt Hauler","data":{"action": "HAULER" }},{ "menuName" : "Jobuilt Phantom","data":{"action": "PHANTOM" }},{ "menuName" : "Jobuilt Rubble","data":{"action": "RUBBLE" }},{ "menuName" : "Maibatsu Mule (Graphics 1)","data":{"action": "MULE" }},{ "menuName" : "Maibatsu Mule (Graphics 2)","data":{"action": "MULE2" }},{ "menuName" : "Maibatsu Mule (Plain)","data":{"action": "MULE3" }},{ "menuName" : "Mixer","data":{"action": "MIXER" }},{ "menuName" : "Mixer (Support Wheel)","data":{"action": "MIXER2" }},{ "menuName" : "MTL Flatbed Truck","data":{"action": "FLATBED" }},{ "menuName" : "MTL Packer","data":{"action": "PACKER" }},{ "menuName" : "MTL Pounder","data":{"action": "POUNDER" }},{ "menuName" : "Vapid Benson","data":{"action": "BENSON" }},{ "menuName" : "Vapid Scrap Truck","data":{"action": "SCRAP" }},{ "menuName" : "Vapid Tow Truck","data":{"action": "TOWTRUCK" }},{ "menuName" : "Vapid Tow Truck (Old)","data":{"action": "TOWTRUCK2" }}];
var vehicle_service = [{ "menuName" : "Airtug","data":{"action": "AIRTUG" }},{ "menuName" : "Brute Airport Bus","data":{"action": "AIRBUS" }},{ "menuName" : "Brute Bus (City Bus)","data":{"action": "BUS" }},{ "menuName" : "Brute Rental Shuttle Bus","data":{"action": "RENTALBUS" }},{ "menuName" : "Brute Tourbus","data":{"action": "TOURBUS" }},{ "menuName" : "Cable Car (Mt. Chilliad)","data":{"action": "CABLECAR" }},{ "menuName" : "Dashound Coach Bus","data":{"action": "COACH" }},{ "menuName" : "Dozer","data":{"action": "BULLDOZER" }},{ "menuName" : "Forklift","data":{"action": "FORKLIFT" }},{ "menuName" : "HVY Brickade","data":{"action": "BRICKADE" }},{ "menuName" : "Jobuilt Trashmaster","data":{"action": "TRASH" }},{ "menuName" : "Jobuilt Trashmaster (Rusty)","data":{"action": "TRASH2" }},{ "menuName" : "MTL Dune","data":{"action": "DUNE" }},{ "menuName" : "Nagasaki Caddy","data":{"action": "CADDY" }},{ "menuName" : "Nagasaki Caddy (Golf)","data":{"action": "CADDY2" }},{ "menuName" : "Ripley (Airpot Tug)","data":{"action": "RIPLEY" }},{ "menuName" : "Stanley Fieldmaster Tractor","data":{"action": "TRACTOR2" }},{ "menuName" : "Stanley Fieldmaster Tractor (Snow)","data":{"action": "TRACTOR3" }},{ "menuName" : "Stanley Lawn Mower","data":{"action": "MOWER" }},{ "menuName" : "Stanley Tractor (Rusty)","data":{"action": "tractor" }},{ "menuName" : "Vapid Pickup Utility","data":{"action": "UTILLITRUCK" }},{ "menuName" : "Vapid Plumbing Utility","data":{"action": "UTILLITRUCK2" }},{ "menuName" : "Vapid Telephone Utlity","data":{"action": "UTILLITRUCK3" }}];
var vehicle_trailers = [{ "menuName" : "Army Flatbed Trailer","data":{"action": "ARMYTRAILER" }},{ "menuName" : "Army Flatbed Trailer (with Drill)","data":{"action": "ARMYTRAILER2" }},{ "menuName" : "Army Fuel Tanker","data":{"action": "ARMYTANKER" }},{ "menuName" : "Boat trailer (small)","data":{"action": "BOATTRAILER" }},{ "menuName" : "Boat Trailer (With Boat)","data":{"action": "TR3" }},{ "menuName" : "Car Tranport Trailer","data":{"action": "TR4" }},{ "menuName" : "Car Tranport Trailer (Empty)","data":{"action": "TR2" }},{ "menuName" : "Commercial Trailer (Graphics 1)","data":{"action": "TRAILERS2" }},{ "menuName" : "Commercial Trailer (Graphics 2)","data":{"action": "TRAILERS3" }},{ "menuName" : "Container Trailer","data":{"action": "DOCKTRAILER" }},{ "menuName" : "Fame or Shame Trailer","data":{"action": "TVTRAILER" }},{ "menuName" : "Flatbed Trailer","data":{"action": "TRFLAT" }},{ "menuName" : "Flatbed Trailer","data":{"action": "FREIGHTTRAILER" }},{ "menuName" : "Grain Trailer","data":{"action": "GRAINTRAILER" }},{ "menuName" : "Hay Bale Trailer","data":{"action": "BALETRAILER" }},{ "menuName" : "Logging Trailer","data":{"action": "TRAILERLOGS" }},{ "menuName" : "Meth Lab Trailer","data":{"action": "PROPTRAILER" }},{ "menuName" : "Petrol Tanker Trailer (Plain)","data":{"action": "TANKER2" }},{ "menuName" : "Petrol Tanker Trailer (Ron)","data":{"action": "TANKER" }},{ "menuName" : "Plain Trailer","data":{"action": "TRAILERS" }},{ "menuName" : "Rake Trailer","data":{"action": "RAKETRAILER" }},{ "menuName" : "Small Trailer","data":{"action": "TRAILERSMALL" }}];
var vehicle_trains = [{ "menuName" : "Container Car 1","data":{"action": "FREIGHTCONT1" }},{ "menuName" : "Container Car 2","data":{"action": "FREIGHTCONT2" }},{ "menuName" : "Flatbed Car","data":{"action": "FREIGHTCAR" }},{ "menuName" : "Freight Train Cab","data":{"action": "FREIGHT" }},{ "menuName" : "Grain Car","data":{"action": "FREIGHTGRAIN" }},{ "menuName" : "Metro Train (Half)","data":{"action": "METROTRAIN" }},{ "menuName" : "Oil Tanker Car","data":{"action": "TANKERCAR" }}];
var vehicle_emergency = [{ "menuName" : "Albany Police Roadcruiser (Snow)","data":{"action": "POLICEOLD2" }},{ "menuName" : "Ambulance","data":{"action": "AMBULANCE" }},{ "menuName" : "Army Barracks Truck","data":{"action": "BARRACKS" }},{ "menuName" : "Army Truck Cab","data":{"action": "BARRACKS2" }},{ "menuName" : "Bravado Buffalo (FIB)","data":{"action": "FBI" }},{ "menuName" : "Brute Police Riot Van","data":{"action": "RIOT" }},{ "menuName" : "Canis Crusader (Army Mesa)","data":{"action": "CRUSADER" }},{ "menuName" : "Declasse Granger (FIB)","data":{"action": "FBI2" }},{ "menuName" : "Declasse Lifeguard","data":{"action": "LGUARD" }},{ "menuName" : "Declasse Park Ranger","data":{"action": "PRANGER" }},{ "menuName" : "Declasse Police Rancher (Snow)","data":{"action": "POLICEOLD1" }},{ "menuName" : "Declasse Police Transporter","data":{"action": "POLICET" }},{ "menuName" : "Declasse Sheriff SUV","data":{"action": "SHERIFF2" }},{ "menuName" : "Firetruck","data":{"action": "FIRETRUK" }},{ "menuName" : "Prison Bus","data":{"action": "PBUS" }},{ "menuName" : "Rhino Tank","data":{"action": "RHINO" }},{ "menuName" : "Vapid Police Buffalo","data":{"action": "POLICE2" }},{ "menuName" : "Vapid Police Cruiser","data":{"action": "POLICE" }},{ "menuName" : "Vapid Police Interceptor","data":{"action": "POLICE3" }},{ "menuName" : "Vapid Sheriff Cruiser","data":{"action": "SHERIFF" }},{ "menuName" : "Vapid Unmarked Police Cruiser","data":{"action": "POLICE4" }},{ "menuName" : "Western Police Bike","data":{"action": "POLICEB" }}];
var vehicle_motorcycles = [{ "menuName" : "Dinka Akuma","data":{"action": "AKUMA" }},{ "menuName" : "Dinka Double-T","data":{"action": "DOUBLE" }},{ "menuName" : "Dinka Enduro","data":{"action": "ENDURO" }},{ "menuName" : "Dinka Thrust","data":{"action": "THRUST" }},{ "menuName" : "Dinka Vindicator","data":{"action": "VINDICATOR" }},{ "menuName" : "LLC Avarus","data":{"action": "AVARUS" }},{ "menuName" : "LLC Hexer","data":{"action": "HEXER" }},{ "menuName" : "LLC Innovation","data":{"action": "INNOVATION" }},{ "menuName" : "LLC Sanctus","data":{"action": "SANCTUS" }},{ "menuName" : "Maibatsu Carbon RS","data":{"action": "CARBONRS" }},{ "menuName" : "Maibatsu Chimera","data":{"action": "CHIMERA" }},{ "menuName" : "Maibatsu Manchez","data":{"action": "MANCHEZ" }},{ "menuName" : "Maibatsu Sanchez","data":{"action": "SANCHEZ" }},{ "menuName" : "Maibatsu Sanchez (Graphics)","data":{"action": "SANCHEZ2" }},{ "menuName" : "Maibatsu Shotaro","data":{"action": "SHOTARO" }},{ "menuName" : "Pegassi Bati","data":{"action": "BATI" }},{ "menuName" : "Pegassi Bati(Race)","data":{"action": "BATI2" }},{ "menuName" : "Pegassi Esskey","data":{"action": "ESSKEY" }},{ "menuName" : "Pegassi Faggio","data":{"action": "FAGGIO" }},{ "menuName" : "Pegassi Faggio Mod","data":{"action": "FAGGIO3" }},{ "menuName" : "Pegassi Faggio Sport","data":{"action": "FAGGIO2" }},{ "menuName" : "Pegassi Ruffian","data":{"action": "RUFFIAN" }},{ "menuName" : "Pegassi Vortex","data":{"action": "VORTEX" }},{ "menuName" : "Principe Lectro","data":{"action": "LECTRO" }},{ "menuName" : "Principe Nemesis","data":{"action": "NEMESIS" }},{ "menuName" : "Shitzu Defiler","data":{"action": "DEFILER" }},{ "menuName" : "Shitzu Hakuchou","data":{"action": "HAKUCHOU" }},{ "menuName" : "Shitzu Hakuchou Drag","data":{"action": "HAKUCHOU2" }},{ "menuName" : "Shitzu PCJ 600","data":{"action": "PCJ" }},{ "menuName" : "Shitzu Vader","data":{"action": "VADER" }},{ "menuName" : "Western Bagger","data":{"action": "BAGGER" }},{ "menuName" : "Western Cliffhanger","data":{"action": "CLIFFHANGER" }},{ "menuName" : "Western Daemon","data":{"action": "DAEMON2" }},{ "menuName" : "Western Daemon Custom","data":{"action": "DAEMON" }},{ "menuName" : "Western Gargoyle","data":{"action": "GARGOYLE" }},{ "menuName" : "Western Nightblade","data":{"action": "NIGHTBLADE" }},{ "menuName" : "Western Rat Bike","data":{"action": "RATBIKE" }},{ "menuName" : "Western Sovereign","data":{"action": "SOVEREIGN" }},{ "menuName" : "Western Wolfsbane","data":{"action": "WOLFSBANE" }},{ "menuName" : "Western Zombie Bobber","data":{"action": "ZOMBIEA" }},{ "menuName" : "Western Zombie Chopper","data":{"action": "ZOMBIEB" }}];
var vehicle_planes = [{ "menuName" : "Buckingham Cargo Plane (An-225)","data":{"action": "CARGOPLANE" }},{ "menuName" : "Buckingham Jet (B747)","data":{"action": "JET" }},{ "menuName" : "Buckingham Luxor","data":{"action": "LUXOR" }},{ "menuName" : "Buckingham Luxor Deluxe","data":{"action": "LUXOR2" }},{ "menuName" : "Buckingham Miljet","data":{"action": "MILJET" }},{ "menuName" : "Buckingham Nimbus","data":{"action": "NIMBUS" }},{ "menuName" : "Buckingham Shamal","data":{"action": "SHAMAL" }},{ "menuName" : "Buckingham Vestra","data":{"action": "VESTRA" }},{ "menuName" : "Jobuilt Mammatus","data":{"action": "MAMMATUS" }},{ "menuName" : "Jobuilt P-996 Lazer","data":{"action": "LAZER" }},{ "menuName" : "Jobuilt Velum (4 Seater)","data":{"action": "VELUM" }},{ "menuName" : "Jobuilt Velum (5 Seater)","data":{"action": "VELUM2" }},{ "menuName" : "Mammoth Dodo","data":{"action": "DODO" }},{ "menuName" : "Mammoth Hydra","data":{"action": "HYDRA" }},{ "menuName" : "Mammoth Titan","data":{"action": "TITAN" }},{ "menuName" : "Western Besra","data":{"action": "BESRA" }},{ "menuName" : "Western Cuban 800","data":{"action": "CUBAN800" }},{ "menuName" : "Western Duster","data":{"action": "DUSTER" }},{ "menuName" : "Western Mallard Stunt Plane","data":{"action": "STUNT" }}];
var vehicle_helicopters = [{ "menuName" : "Blimp (Atomic)","data":{"action": "BLIMP" }},{ "menuName" : "Blimp (Xero Gas)","data":{"action": "BLIMP2" }},{ "menuName" : "Buckingham Savage","data":{"action": "SAVAGE" }},{ "menuName" : "Buckingham SuperVolito","data":{"action": "SUPERVOLITO" }},{ "menuName" : "Buckingham SuperVolito Carbon","data":{"action": "SUPERVOLITO2" }},{ "menuName" : "Buckingham Swift","data":{"action": "SWIFT" }},{ "menuName" : "Buckingham Swift Deluxe","data":{"action": "SWIFT2" }},{ "menuName" : "Buckingham Valkyrie","data":{"action": "VALKYRIE" }},{ "menuName" : "Buckingham Volatus","data":{"action": "VOLATUS" }},{ "menuName" : "HVT Skylift","data":{"action": "SKYLIFT" }},{ "menuName" : "Maibatsu Frogger","data":{"action": "FROGGER" }},{ "menuName" : "Maibatsu Frogger (TPE/FIB)","data":{"action": "FROGGER2" }},{ "menuName" : "Nagasaki Buzzard (Unarmed)","data":{"action": "BUZZARD" }},{ "menuName" : "Nagasaki Buzzard (Attack Chopper)","data":{"action": "BUZZARD2" }},{ "menuName" : "Western Annihilator","data":{"action": "ANNIHILATOR" }},{ "menuName" : "Western Cargobob (Desert Camo)","data":{"action": "CARGOBOB" }},{ "menuName" : "Western Cargobob (Jetsam)","data":{"action": "CARGOBOB2" }},{ "menuName" : "Western Cargobob (TPE)","data":{"action": "CARGOBOB3" }},{ "menuName" : "Western Mavrick","data":{"action": "MAVERICK" }},{ "menuName" : "Western Mavrick (Police)","data":{"action": "POLMAV" }}];
var vehicle_boats = [{ "menuName" : "Buckingham Tug","data":{"action": "TUG" }},{ "menuName" : "Dinka Marquis","data":{"action": "MARQUIS" }},{ "menuName" : "Lampadati Toro","data":{"action": "TORO" }},{ "menuName" : "Nagasaki Dinghy (2 Seater)","data":{"action": "DINGHY2" }},{ "menuName" : "Nagasaki Dinghy (4 Seater Black)","data":{"action": "DINGHY3" }},{ "menuName" : "Nagasaki Dinghy (4 Seater Red)","data":{"action": "DINGHY" }},{ "menuName" : "Pegassi Speeder","data":{"action": "SPEEDER" }},{ "menuName" : "Shitzu Jetmax","data":{"action": "SUNTRAP" }},{ "menuName" : "Shitzu Predator (Police)","data":{"action": "PREDATOR" }},{ "menuName" : "Shitzu Squalo","data":{"action": "SQUALO" }},{ "menuName" : "Shitzu Suntrap","data":{"action": "SUNTRAP" }},{ "menuName" : "Shitzu Tropic","data":{"action": "TROPIC" }},{ "menuName" : "Speedophile Seashark","data":{"action": "SEASHARK" }},{ "menuName" : "Speedophile Seashark (Lifeguard)","data":{"action": "SEASHARK2" }},{ "menuName" : "Submersible","data":{"action": "SUBMERSIBLE" }},{ "menuName" : "Submersible (Kraken)","data":{"action": "SUBMERSIBLE2" }}];
var vehicle_bicycles = [{ "menuName" : "BMX","data":{"action": "BMX" }},{ "menuName" : "Cruiser","data":{"action": "CRUISER" }},{ "menuName" : "Endurex Race","data":{"action": "TRIBIKE2" }},{ "menuName" : "Fixter","data":{"action": "FIXTER" }},{ "menuName" : "Scorcher","data":{"action": "SCORCHER" }},{ "menuName" : "Tri-Cycles Race","data":{"action": "TRIBIKE3" }},{ "menuName" : "Whippet Race","data":{"action": "TRIBIKE" }}];


// Weapon Spawning Database
var weaponDB = {"Melee":[{"menuName":"Knife","weaponName":"WEAPON_KNIFE","data":{"sub":0},"weapon":true,"submenu":[]},{"menuName":"Brass Knuckles","weaponName":"WEAPON_KNUCKLE","data":{"sub":1},"weapon":true,"submenu":[{"menuName":"Default","data":{"action":"COMPONENT_KNUCKLE_VARMOD_BASE"}},{"menuName":"Pimp","data":{"action":"COMPONENT_KNUCKLE_VARMOD_PIMP"}},{"menuName":"Ballas","data":{"action":"COMPONENT_KNUCKLE_VARMOD_BALLAS"}},{"menuName":"Dollars","data":{"action":"COMPONENT_KNUCKLE_VARMOD_DOLLAR"}},{"menuName":"Diamond","data":{"action":"COMPONENT_KNUCKLE_VARMOD_DIAMOND"}},{"menuName":"Hate","data":{"action":"COMPONENT_KNUCKLE_VARMOD_HATE"}},{"menuName":"Love","data":{"action":"COMPONENT_KNUCKLE_VARMOD_LOVE"}},{"menuName":"Player","data":{"action":"COMPONENT_KNUCKLE_VARMOD_PLAYER"}},{"menuName":"King","data":{"action":"COMPONENT_KNUCKLE_VARMOD_KING"}},{"menuName":"Vagos","data":{"action":"COMPONENT_KNUCKLE_VARMOD_VAGOS"}}]},{"menuName":"Nightstick","weaponName":"WEAPON_NIGHTSTICK","data":{"sub":2},"weapon":true,"submenu":[]},{"menuName":"Hammer","weaponName":"WEAPON_HAMMER","data":{"sub":3},"weapon":true,"submenu":[]},{"menuName":"Baseball Bat","weaponName":"WEAPON_BAT","data":{"sub":4},"weapon":true,"submenu":[]},{"menuName":"Golf Club","weaponName":"WEAPON_GOLFCLUB","data":{"sub":5},"weapon":true,"submenu":[]},{"menuName":"Crowbar","weaponName":"WEAPON_CROWBAR","data":{"sub":6},"weapon":true,"submenu":[]},{"menuName":"Bottle","weaponName":"WEAPON_BOTTLE","data":{"sub":7},"weapon":true,"submenu":[]},{"menuName":"Antique Dagger","weaponName":"WEAPON_DAGGER","data":{"sub":8},"weapon":true,"submenu":[]},{"menuName":"Hatchet","weaponName":"WEAPON_HATCHET","data":{"sub":9},"weapon":true,"submenu":[]},{"menuName":"Machete","weaponName":"WEAPON_MACHETE","data":{"sub":10},"weapon":true,"submenu":[]},{"menuName":"Flashlight","weaponName":"WEAPON_FLASHLIGHT","data":{"sub":11},"weapon":true,"submenu":[]},{"menuName":"Switchblade","weaponName":"WEAPON_SWITCHBLADE","data":{"sub":12},"weapon":true,"submenu":[{"menuName":"Variation 1","data":{"action":"COMPONENT_SWITCHBLADE_VARMOD_VAR1"}},{"menuName":"Variation 2","data":{"action":"COMPONENT_SWITCHBLADE_VARMOD_VAR2"}}]}],"Handguns":[{"menuName":"Pistol","weaponName":"WEAPON_PISTOL","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_PISTOL_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_PISTOL_VARMOD_LUXE"}}]},{"menuName":"Combat Pistol","weaponName":"WEAPON_COMBATPISTOL","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_COMBATPISTOL_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER"}}]},{"menuName":"AP Pistol","weaponName":"WEAPON_APPISTOL","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_APPISTOL_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Gilded Gun Metal Finish","data":{"action":"COMPONENT_APPISTOL_VARMOD_LUXE"}}]},{"menuName":"Pistol .50","weaponName":"WEAPON_PISTOL50","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_PISTOL50_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Platinum Pearl Deluxe Finish","data":{"action":"COMPONENT_PISTOL50_VARMOD_LUXE"}}]},{"menuName":"SNS Pistol","weaponName":"WEAPON_SNSPISTOL","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_SNSPISTOL_CLIP_02"}},{"menuName":"Etched Wood Grip Finish","data":{"action":"COMPONENT_SNSPISTOL_VARMOD_LOWRIDER"}}]},{"menuName":"Heavy Pistol","weaponName":"WEAPON_HEAVYPISTOL","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_HEAVYPISTOL_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_SUPP"}},{"menuName":"Etched Wood Grip Finish","data":{"action":"COMPONENT_HEAVYPISTOL_VARMOD_LUXE"}}]},{"menuName":"Vintage Pistol","weaponName":"WEAPON_VINTAGEPISTOL","data":{"sub":6},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_VINTAGEPISTOL_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP"}}]},{"menuName":"Stungun","weaponName":"WEAPON_STUNGUN","data":{"sub":7},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Flaregun","weaponName":"WEAPON_FLAREGUN","data":{"sub":8},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Marksman Pistol","weaponName":"WEAPON_MARKSMANPISTOL","data":{"sub":9},"ammo":true,"weapon":true,"submenu":[{"menuName":"Variation 1","data":{"action":"COMPONENT_REVOLVER_VARMOD_BOSS"}},{"menuName":"Variation 2","data":{"action":"COMPONENT_REVOLVER_VARMOD_GOON"}}]},{"menuName":"Heavy Revolver","weaponName":"WEAPON_REVOLVER","data":{"sub":10},"ammo":true,"weapon":true,"submenu":[]}],"Submachine":[{"menuName":"Micro SMG","weaponName":"WEAPON_MICROSMG","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_MICROSMG_CLIP_02"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MACRO"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_PI_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_MICROSMG_VARMOD_LUXE"}}]},{"menuName":"SMG","weaponName":"WEAPON_SMG","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_SMG_CLIP_02"}},{"menuName":"Drum Magazine","data":{"action":"COMPONENT_SMG_CLIP_03"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MACRO_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_SMG_VARMOD_LUXE"}}]},{"menuName":"Assault SMG","weaponName":"WEAPON_ASSAULTSMG","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_ASSAULTSMG_CLIP_02"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MACRO"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"}}]},{"menuName":"MG","weaponName":"WEAPON_MG","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_MG_CLIP_02"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL_02"}}]},{"menuName":"Combat MG","weaponName":"WEAPON_COMBATMG","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_COMBATMG_CLIP_02"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MEDIUM"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Combat PDW","weaponName":"WEAPON_COMBATPDW","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_COMBATPDW_CLIP_02"}},{"menuName":"Drum Magazine","data":{"action":"COMPONENT_COMBATPDW_CLIP_03"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Gusenberg Sweeper","weaponName":"WEAPON_GUSENBERG","data":{"sub":6},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_GUSENBERG_CLIP_02"}}]},{"menuName":"Machine Pistol","weaponName":"WEAPON_MACHINEPISTOL","data":{"sub":7},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_MACHINEPISTOL_CLIP_02"}},{"menuName":"Drum Magazine","data":{"action":"COMPONENT_MACHINEPISTOL_CLIP_03"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_PI_SUPP"}}]}],"Assault":[{"menuName":"Assault Rifle","weaponName":"WEAPON_ASSAULTRIFLE","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_ASSAULTRIFLE_CLIP_02"}},{"menuName":"Drum Magazine","data":{"action":"COMPONENT_ASSAULTRIFLE_CLIP_03"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MACRO"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"}}]},{"menuName":"Carbine Rifle","weaponName":"WEAPON_CARBINERIFLE","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_CARBINERIFLE_CLIP_02"}},{"menuName":"Box Magazine","data":{"action":"COMPONENT_CARBINERIFLE_CLIP_03"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MEDIUM"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Rail Cover","data":{"action":"COMPONENT_AT_RAILCOVER_01"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_CARBINERIFLE_VARMOD_LUXE"}}]},{"menuName":"Advanced Rifle","weaponName":"WEAPON_ADVANCEDRIFLE","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_ADVANCEDRIFLE_CLIP_02"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Gilded Gun Metal Finish","data":{"action":"COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"}}]},{"menuName":"Special Carbine","weaponName":"WEAPON_SPECIALCARBINE","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_SPECIALCARBINE_CLIP_02"}},{"menuName":"Beta C-Magazine","data":{"action":"COMPONENT_SPECIALCARBINE_CLIP_03"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_MEDIUM"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Bullpup Rifle","weaponName":"WEAPON_BULLPUPRIFLE","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Compact Rifle","weaponName":"WEAPON_COMPACTRIFLE","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_COMPACTRIFLE_CLIP_02"}},{"menuName":"Drum Magazine","data":{"action":"COMPONENT_COMPACTRIFLE_CLIP_03"}}]}],"Shotguns":[{"menuName":"Pump Shotgun","weaponName":"WEAPON_PUMPSHOTGUN","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_SR_SUPP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER"}}]},{"menuName":"Sawnoff Shotgun","weaponName":"WEAPON_SAWNOFFSHOTGUN","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Gilded Gun Metal Finish","data":{"action":"COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE"}}]},{"menuName":"Bullpup Shotgun","weaponName":"WEAPON_BULLPUPSHOTGUN","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_BULLPUPRIFLE_CLIP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}},{"menuName":"Gilded Gun Metal Finish","data":{"action":"COMPONENT_BULLPUPRIFLE_VARMOD_LOW"}}]},{"menuName":"Assault Shotgun","weaponName":"WEAPON_ASSAULTSHOTGUN","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_ASSAULTSHOTGUN_CLIP_02"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}}]},{"menuName":"Musket","weaponName":"WEAPON_MUSKET","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Heavy Shotgun","weaponName":"WEAPON_HEAVYSHOTGUN","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_HEAVYSHOTGUN_CLIP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Double Barrel Shotgun","weaponName":"WEAPON_DBSHOTGUN","data":{"sub":6},"ammo":true,"weapon":true,"submenu":[]}],"Snipers":[{"menuName":"Sniper Rifle","weaponName":"WEAPON_SNIPERRIFLE","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Advanced Scope","data":{"action":"COMPONENT_AT_SCOPE_MAX"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP_02"}},{"menuName":"Etched Wood Grip Finish","data":{"action":"COMPONENT_SNIPERRIFLE_VARMOD_LUXE"}}]},{"menuName":"Heavy Sniper","weaponName":"WEAPON_HEAVYSNIPER","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Normal Scope","data":{"action":"COMPONENT_AT_SCOPE_LARGE"}}]},{"menuName":"Marksman Rifle","weaponName":"WEAPON_MARKSMANRIFLE","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[{"menuName":"Extended Magazine","data":{"action":"COMPONENT_MARKSMANRIFLE_CLIP_02"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Suppressor","data":{"action":"COMPONENT_AT_AR_SUPP"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}},{"menuName":"Yusuf Amir Luxury Finish","data":{"action":"COMPONENT_MARKSMANRIFLE_VARMOD_LUXE"}}]}],"Heavy":[{"menuName":"Grenade Launcher","weaponName":"WEAPON_GRENADELAUNCHER","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"Grenade Launcher (Smoke)","weaponName":"WEAPON_GRENADELAUNCHER_SMOKE","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[{"menuName":"Scope","data":{"action":"COMPONENT_AT_SCOPE_SMALL"}},{"menuName":"Flashlight","data":{"action":"COMPONENT_AT_AR_FLSH"}},{"menuName":"Grip","data":{"action":"COMPONENT_AT_AR_AFGRIP"}}]},{"menuName":"RPG","weaponName":"WEAPON_RPG","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Stinger","weaponName":"WEAPON_STINGER","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Minigun","weaponName":"WEAPON_MINIGUN","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Firework Launcher","weaponName":"WEAPON_FIREWORK","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Railgun","weaponName":"WEAPON_RAILGUN","data":{"sub":6},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Homing Launcher","weaponName":"WEAPON_HOMINGLAUNCHER","data":{"sub":7},"ammo":true,"weapon":true,"submenu":[]}],"Thrown":[{"menuName":"Grenade","weaponName":"WEAPON_GRENADE","data":{"sub":0},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Sticky Bomb","weaponName":"WEAPON_STICKYBOMB","data":{"sub":1},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Proximity Mine","weaponName":"WEAPON_PROXMINE","data":{"sub":2},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Tear Gas","weaponName":"WEAPON_BZGAS","data":{"sub":3},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Smoke Grenade","weaponName":"WEAPON_SMOKEGRENADE","data":{"sub":4},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Molotov","weaponName":"WEAPON_MOLOTOV","data":{"sub":5},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Fire Extinguisher","weaponName":"WEAPON_FIREEXTINGUISHER","data":{"sub":6},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Jerry Can","weaponName":"WEAPON_PETROLCAN","data":{"sub":7},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Snowball","weaponName":"WEAPON_SNOWBALL","data":{"sub":8},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Flare","weaponName":"WEAPON_FLARE","data":{"sub":9},"ammo":true,"weapon":true,"submenu":[]},{"menuName":"Baseball","weaponName":"WEAPON_BALL","data":{"sub":10},"ammo":true,"weapon":true,"submenu":[]}]}


// Vehicle Paint Options.
var vehicleColors = {
    "primarymetallic":[{"menuName":"Black","data":{"action":0}},{"menuName":"Carbon Black","data":{"action":147}},{"menuName":"Hraphite","data":{"action":1}},{"menuName":"Anhracite Black","data":{"action":11}},{"menuName":"Black Steel","data":{"action":2}},{"menuName":"Dark Steel","data":{"action":3}},{"menuName":"Silver","data":{"action":4}},{"menuName":"Bluish Silver","data":{"action":5}},{"menuName":"Rolled Steel","data":{"action":6}},{"menuName":"Shadow Silver","data":{"action":7}},{"menuName":"Stone Silver","data":{"action":8}},{"menuName":"Midnight Silver","data":{"action":9}},{"menuName":"Cast Iron Silver","data":{"action":10}},{"menuName":"Red","data":{"action":27}},{"menuName":"Torino Red","data":{"action":28}},{"menuName":"Formula Red","data":{"action":29}},{"menuName":"Lava Red","data":{"action":150}},{"menuName":"Blaze Red","data":{"action":30}},{"menuName":"Grace Red","data":{"action":31}},{"menuName":"Garnet Red","data":{"action":32}},{"menuName":"Sunset Red","data":{"action":33}},{"menuName":"Cabernet Red","data":{"action":34}},{"menuName":"Wine Red","data":{"action":143}},{"menuName":"Candy Red","data":{"action":35}},{"menuName":"Hot Pink","data":{"action":135}},{"menuName":"Pfsiter Pink","data":{"action":137}},{"menuName":"Salmon Pink","data":{"action":136}},{"menuName":"Sunrise Orange","data":{"action":36}},{"menuName":"Orange","data":{"action":38}},{"menuName":"Bright Orange","data":{"action":138}},{"menuName":"Gold","data":{"action":99}},{"menuName":"Bronze","data":{"action":90}},{"menuName":"Yellow","data":{"action":88}},{"menuName":"Race Yellow","data":{"action":89}},{"menuName":"Dew Yellow","data":{"action":91}},{"menuName":"Dark Green","data":{"action":49}},{"menuName":"Racing Green","data":{"action":50}},{"menuName":"Sea Green","data":{"action":51}},{"menuName":"Olive Green","data":{"action":52}},{"menuName":"Bright Green","data":{"action":53}},{"menuName":"Gasoline Green","data":{"action":54}},{"menuName":"Lime Green","data":{"action":92}},{"menuName":"Midnight Blue","data":{"action":141}},{"menuName":"Galaxy Blue","data":{"action":61}},{"menuName":"Dark Blue","data":{"action":62}},{"menuName":"Saxon Blue","data":{"action":63}},{"menuName":"Blue","data":{"action":64}},{"menuName":"Mariner Blue","data":{"action":65}},{"menuName":"Harbor Blue","data":{"action":66}},{"menuName":"Diamond Blue","data":{"action":67}},{"menuName":"Surf Blue","data":{"action":68}},{"menuName":"Nautical Blue","data":{"action":69}},{"menuName":"Racing Blue","data":{"action":73}},{"menuName":"Ultra Blue","data":{"action":70}},{"menuName":"Light Blue","data":{"action":74}},{"menuName":"Chocolate Brown","data":{"action":96}},{"menuName":"Bison Brown","data":{"action":101}},{"menuName":"Creeen Brown","data":{"action":95}},{"menuName":"Feltzer Brown","data":{"action":94}},{"menuName":"Maple Brown","data":{"action":97}},{"menuName":"Beechwood Brown","data":{"action":103}},{"menuName":"Sienna Brown","data":{"action":104}},{"menuName":"Saddle Brown","data":{"action":98}},{"menuName":"Moss Brown","data":{"action":100}},{"menuName":"Woodbeech Brown","data":{"action":102}},{"menuName":"Straw Brown","data":{"action":99}},{"menuName":"Sandy Brown","data":{"action":105}},{"menuName":"Bleached Brown","data":{"action":106}},{"menuName":"Schafter Purple","data":{"action":71}},{"menuName":"Spinnaker Purple","data":{"action":72}},{"menuName":"Midnight Purple","data":{"action":142}},{"menuName":"Bright Purple","data":{"action":145}},{"menuName":"Cream","data":{"action":107}},{"menuName":"Ice White","data":{"action":111}},{"menuName":"Frost White","data":{"action":112}}],
    "secondarymetallic":[{"menuName":"Black","data":{"action":0}},{"menuName":"Carbon Black","data":{"action":147}},{"menuName":"Hraphite","data":{"action":1}},{"menuName":"Anhracite Black","data":{"action":11}},{"menuName":"Black Steel","data":{"action":2}},{"menuName":"Dark Steel","data":{"action":3}},{"menuName":"Silver","data":{"action":4}},{"menuName":"Bluish Silver","data":{"action":5}},{"menuName":"Rolled Steel","data":{"action":6}},{"menuName":"Shadow Silver","data":{"action":7}},{"menuName":"Stone Silver","data":{"action":8}},{"menuName":"Midnight Silver","data":{"action":9}},{"menuName":"Cast Iron Silver","data":{"action":10}},{"menuName":"Red","data":{"action":27}},{"menuName":"Torino Red","data":{"action":28}},{"menuName":"Formula Red","data":{"action":29}},{"menuName":"Lava Red","data":{"action":150}},{"menuName":"Blaze Red","data":{"action":30}},{"menuName":"Grace Red","data":{"action":31}},{"menuName":"Garnet Red","data":{"action":32}},{"menuName":"Sunset Red","data":{"action":33}},{"menuName":"Cabernet Red","data":{"action":34}},{"menuName":"Wine Red","data":{"action":143}},{"menuName":"Candy Red","data":{"action":35}},{"menuName":"Hot Pink","data":{"action":135}},{"menuName":"Pfsiter Pink","data":{"action":137}},{"menuName":"Salmon Pink","data":{"action":136}},{"menuName":"Sunrise Orange","data":{"action":36}},{"menuName":"Orange","data":{"action":38}},{"menuName":"Bright Orange","data":{"action":138}},{"menuName":"Gold","data":{"action":99}},{"menuName":"Bronze","data":{"action":90}},{"menuName":"Yellow","data":{"action":88}},{"menuName":"Race Yellow","data":{"action":89}},{"menuName":"Dew Yellow","data":{"action":91}},{"menuName":"Dark Green","data":{"action":49}},{"menuName":"Racing Green","data":{"action":50}},{"menuName":"Sea Green","data":{"action":51}},{"menuName":"Olive Green","data":{"action":52}},{"menuName":"Bright Green","data":{"action":53}},{"menuName":"Gasoline Green","data":{"action":54}},{"menuName":"Lime Green","data":{"action":92}},{"menuName":"Midnight Blue","data":{"action":141}},{"menuName":"Galaxy Blue","data":{"action":61}},{"menuName":"Dark Blue","data":{"action":62}},{"menuName":"Saxon Blue","data":{"action":63}},{"menuName":"Blue","data":{"action":64}},{"menuName":"Mariner Blue","data":{"action":65}},{"menuName":"Harbor Blue","data":{"action":66}},{"menuName":"Diamond Blue","data":{"action":67}},{"menuName":"Surf Blue","data":{"action":68}},{"menuName":"Nautical Blue","data":{"action":69}},{"menuName":"Racing Blue","data":{"action":73}},{"menuName":"Ultra Blue","data":{"action":70}},{"menuName":"Light Blue","data":{"action":74}},{"menuName":"Chocolate Brown","data":{"action":96}},{"menuName":"Bison Brown","data":{"action":101}},{"menuName":"Creeen Brown","data":{"action":95}},{"menuName":"Feltzer Brown","data":{"action":94}},{"menuName":"Maple Brown","data":{"action":97}},{"menuName":"Beechwood Brown","data":{"action":103}},{"menuName":"Sienna Brown","data":{"action":104}},{"menuName":"Saddle Brown","data":{"action":98}},{"menuName":"Moss Brown","data":{"action":100}},{"menuName":"Woodbeech Brown","data":{"action":102}},{"menuName":"Straw Brown","data":{"action":99}},{"menuName":"Sandy Brown","data":{"action":105}},{"menuName":"Bleached Brown","data":{"action":106}},{"menuName":"Schafter Purple","data":{"action":71}},{"menuName":"Spinnaker Purple","data":{"action":72}},{"menuName":"Midnight Purple","data":{"action":142}},{"menuName":"Bright Purple","data":{"action":145}},{"menuName":"Cream","data":{"action":107}},{"menuName":"Ice White","data":{"action":111}},{"menuName":"Frost White","data":{"action":112}}],
    "primarymatte":[{"menuName":"Black","data":{"action":12}},{"menuName":"Gray","data":{"action":13}},{"menuName":"Light Gray","data":{"action":14}},{"menuName":"Ice White","data":{"action":131}},{"menuName":"Blue","data":{"action":83}},{"menuName":"Dark Blue","data":{"action":82}},{"menuName":"Midnight Blue","data":{"action":84}},{"menuName":"Midnight Purple","data":{"action":149}},{"menuName":"Schafter Purple","data":{"action":148}},{"menuName":"Red","data":{"action":39}},{"menuName":"Dark Red","data":{"action":40}},{"menuName":"Orange","data":{"action":41}},{"menuName":"Yellow","data":{"action":42}},{"menuName":"Lime Green","data":{"action":55}},{"menuName":"Green","data":{"action":128}},{"menuName":"Frost Green","data":{"action":151}},{"menuName":"Foliage Green","data":{"action":155}},{"menuName":"Olive Darb","data":{"action":152}},{"menuName":"Dark Earth","data":{"action":153}},{"menuName":"Desert Tan","data":{"action":154}}],
    "secondarymatte":[{"menuName":"Black","data":{"action":12}},{"menuName":"Gray","data":{"action":13}},{"menuName":"Light Gray","data":{"action":14}},{"menuName":"Ice White","data":{"action":131}},{"menuName":"Blue","data":{"action":83}},{"menuName":"Dark Blue","data":{"action":82}},{"menuName":"Midnight Blue","data":{"action":84}},{"menuName":"Midnight Purple","data":{"action":149}},{"menuName":"Schafter Purple","data":{"action":148}},{"menuName":"Red","data":{"action":39}},{"menuName":"Dark Red","data":{"action":40}},{"menuName":"Orange","data":{"action":41}},{"menuName":"Yellow","data":{"action":42}},{"menuName":"Lime Green","data":{"action":55}},{"menuName":"Green","data":{"action":128}},{"menuName":"Frost Green","data":{"action":151}},{"menuName":"Foliage Green","data":{"action":155}},{"menuName":"Olive Darb","data":{"action":152}},{"menuName":"Dark Earth","data":{"action":153}},{"menuName":"Desert Tan","data":{"action":154}}],
    "primarymetal":[{"menuName":"Brushed Steel","data":{"action":117}},{"menuName":"Brushed Black Steel","data":{"action":118}},{"menuName":"Brushed Aluminum","data":{"action":119}},{"menuName":"Pure Gold","data":{"action":158}},{"menuName":"Brushed Gold","data":{"action":159}}],
    "secondarymetal":[{"menuName":"Brushed Steel","data":{"action":117}},{"menuName":"Brushed Black Steel","data":{"action":118}},{"menuName":"Brushed Aluminum","data":{"action":119}},{"menuName":"Pure Gold","data":{"action":158}},{"menuName":"Brushed Gold","data":{"action":159}}],
    "primaryclassic":[{"menuName":"Black","data":{"action":0}},{"menuName":"Carbon Black","data":{"action":147}},{"menuName":"Hraphite","data":{"action":1}},{"menuName":"Anhracite Black","data":{"action":11}},{"menuName":"Black Steel","data":{"action":2}},{"menuName":"Dark Steel","data":{"action":3}},{"menuName":"Silver","data":{"action":4}},{"menuName":"Bluish Silver","data":{"action":5}},{"menuName":"Rolled Steel","data":{"action":6}},{"menuName":"Shadow Silver","data":{"action":7}},{"menuName":"Stone Silver","data":{"action":8}},{"menuName":"Midnight Silver","data":{"action":9}},{"menuName":"Cast Iron Silver","data":{"action":10}},{"menuName":"Red","data":{"action":27}},{"menuName":"Torino Red","data":{"action":28}},{"menuName":"Formula Red","data":{"action":29}},{"menuName":"Lava Red","data":{"action":150}},{"menuName":"Blaze Red","data":{"action":30}},{"menuName":"Grace Red","data":{"action":31}},{"menuName":"Garnet Red","data":{"action":32}},{"menuName":"Sunset Red","data":{"action":33}},{"menuName":"Cabernet Red","data":{"action":34}},{"menuName":"Wine Red","data":{"action":143}},{"menuName":"Candy Red","data":{"action":35}},{"menuName":"Hot Pink","data":{"action":135}},{"menuName":"Pfsiter Pink","data":{"action":137}},{"menuName":"Salmon Pink","data":{"action":136}},{"menuName":"Sunrise Orange","data":{"action":36}},{"menuName":"Orange","data":{"action":38}},{"menuName":"Bright Orange","data":{"action":138}},{"menuName":"Gold","data":{"action":99}},{"menuName":"Bronze","data":{"action":90}},{"menuName":"Yellow","data":{"action":88}},{"menuName":"Race Yellow","data":{"action":89}},{"menuName":"Dew Yellow","data":{"action":91}},{"menuName":"Dark Green","data":{"action":49}},{"menuName":"Racing Green","data":{"action":50}},{"menuName":"Sea Green","data":{"action":51}},{"menuName":"Olive Green","data":{"action":52}},{"menuName":"Bright Green","data":{"action":53}},{"menuName":"Gasoline Green","data":{"action":54}},{"menuName":"Lime Green","data":{"action":92}},{"menuName":"Midnight Blue","data":{"action":141}},{"menuName":"Galaxy Blue","data":{"action":61}},{"menuName":"Dark Blue","data":{"action":62}},{"menuName":"Saxon Blue","data":{"action":63}},{"menuName":"Blue","data":{"action":64}},{"menuName":"Mariner Blue","data":{"action":65}},{"menuName":"Harbor Blue","data":{"action":66}},{"menuName":"Diamond Blue","data":{"action":67}},{"menuName":"Surf Blue","data":{"action":68}},{"menuName":"Nautical Blue","data":{"action":69}},{"menuName":"Racing Blue","data":{"action":73}},{"menuName":"Ultra Blue","data":{"action":70}},{"menuName":"Light Blue","data":{"action":74}},{"menuName":"Chocolate Brown","data":{"action":96}},{"menuName":"Bison Brown","data":{"action":101}},{"menuName":"Creeen Brown","data":{"action":95}},{"menuName":"Feltzer Brown","data":{"action":94}},{"menuName":"Maple Brown","data":{"action":97}},{"menuName":"Beechwood Brown","data":{"action":103}},{"menuName":"Sienna Brown","data":{"action":104}},{"menuName":"Saddle Brown","data":{"action":98}},{"menuName":"Moss Brown","data":{"action":100}},{"menuName":"Woodbeech Brown","data":{"action":102}},{"menuName":"Straw Brown","data":{"action":99}},{"menuName":"Sandy Brown","data":{"action":105}},{"menuName":"Bleached Brown","data":{"action":106}},{"menuName":"Schafter Purple","data":{"action":71}},{"menuName":"Spinnaker Purple","data":{"action":72}},{"menuName":"Midnight Purple","data":{"action":142}},{"menuName":"Bright Purple","data":{"action":145}},{"menuName":"Cream","data":{"action":107}},{"menuName":"Ice White","data":{"action":111}},{"menuName":"Frost White","data":{"action":112}}],
    "secondaryclassic":[{"menuName":"Black","data":{"action":0}},{"menuName":"Carbon Black","data":{"action":147}},{"menuName":"Hraphite","data":{"action":1}},{"menuName":"Anhracite Black","data":{"action":11}},{"menuName":"Black Steel","data":{"action":2}},{"menuName":"Dark Steel","data":{"action":3}},{"menuName":"Silver","data":{"action":4}},{"menuName":"Bluish Silver","data":{"action":5}},{"menuName":"Rolled Steel","data":{"action":6}},{"menuName":"Shadow Silver","data":{"action":7}},{"menuName":"Stone Silver","data":{"action":8}},{"menuName":"Midnight Silver","data":{"action":9}},{"menuName":"Cast Iron Silver","data":{"action":10}},{"menuName":"Red","data":{"action":27}},{"menuName":"Torino Red","data":{"action":28}},{"menuName":"Formula Red","data":{"action":29}},{"menuName":"Lava Red","data":{"action":150}},{"menuName":"Blaze Red","data":{"action":30}},{"menuName":"Grace Red","data":{"action":31}},{"menuName":"Garnet Red","data":{"action":32}},{"menuName":"Sunset Red","data":{"action":33}},{"menuName":"Cabernet Red","data":{"action":34}},{"menuName":"Wine Red","data":{"action":143}},{"menuName":"Candy Red","data":{"action":35}},{"menuName":"Hot Pink","data":{"action":135}},{"menuName":"Pfsiter Pink","data":{"action":137}},{"menuName":"Salmon Pink","data":{"action":136}},{"menuName":"Sunrise Orange","data":{"action":36}},{"menuName":"Orange","data":{"action":38}},{"menuName":"Bright Orange","data":{"action":138}},{"menuName":"Gold","data":{"action":99}},{"menuName":"Bronze","data":{"action":90}},{"menuName":"Yellow","data":{"action":88}},{"menuName":"Race Yellow","data":{"action":89}},{"menuName":"Dew Yellow","data":{"action":91}},{"menuName":"Dark Green","data":{"action":49}},{"menuName":"Racing Green","data":{"action":50}},{"menuName":"Sea Green","data":{"action":51}},{"menuName":"Olive Green","data":{"action":52}},{"menuName":"Bright Green","data":{"action":53}},{"menuName":"Gasoline Green","data":{"action":54}},{"menuName":"Lime Green","data":{"action":92}},{"menuName":"Midnight Blue","data":{"action":141}},{"menuName":"Galaxy Blue","data":{"action":61}},{"menuName":"Dark Blue","data":{"action":62}},{"menuName":"Saxon Blue","data":{"action":63}},{"menuName":"Blue","data":{"action":64}},{"menuName":"Mariner Blue","data":{"action":65}},{"menuName":"Harbor Blue","data":{"action":66}},{"menuName":"Diamond Blue","data":{"action":67}},{"menuName":"Surf Blue","data":{"action":68}},{"menuName":"Nautical Blue","data":{"action":69}},{"menuName":"Racing Blue","data":{"action":73}},{"menuName":"Ultra Blue","data":{"action":70}},{"menuName":"Light Blue","data":{"action":74}},{"menuName":"Chocolate Brown","data":{"action":96}},{"menuName":"Bison Brown","data":{"action":101}},{"menuName":"Creeen Brown","data":{"action":95}},{"menuName":"Feltzer Brown","data":{"action":94}},{"menuName":"Maple Brown","data":{"action":97}},{"menuName":"Beechwood Brown","data":{"action":103}},{"menuName":"Sienna Brown","data":{"action":104}},{"menuName":"Saddle Brown","data":{"action":98}},{"menuName":"Moss Brown","data":{"action":100}},{"menuName":"Woodbeech Brown","data":{"action":102}},{"menuName":"Straw Brown","data":{"action":99}},{"menuName":"Sandy Brown","data":{"action":105}},{"menuName":"Bleached Brown","data":{"action":106}},{"menuName":"Schafter Purple","data":{"action":71}},{"menuName":"Spinnaker Purple","data":{"action":72}},{"menuName":"Midnight Purple","data":{"action":142}},{"menuName":"Bright Purple","data":{"action":145}},{"menuName":"Cream","data":{"action":107}},{"menuName":"Ice White","data":{"action":111}},{"menuName":"Frost White","data":{"action":112}}],
    "primarychrome":[{"menuName":"Chrome","data":{"action":120}}],
    "secondarychrome":[{"menuName":"Chrome","data":{"action":120}}],
    "wheelcolors" : [{"menuName":"Black","data":{"action":0}},{"menuName":"Carbon Black","data":{"action":147}},{"menuName":"Hraphite","data":{"action":1}},{"menuName":"Anhracite Black","data":{"action":11}},{"menuName":"Black Steel","data":{"action":2}},{"menuName":"Dark Steel","data":{"action":3}},{"menuName":"Silver","data":{"action":4}},{"menuName":"Bluish Silver","data":{"action":5}},{"menuName":"Rolled Steel","data":{"action":6}},{"menuName":"Shadow Silver","data":{"action":7}},{"menuName":"Stone Silver","data":{"action":8}},{"menuName":"Midnight Silver","data":{"action":9}},{"menuName":"Cast Iron Silver","data":{"action":10}},{"menuName":"Red","data":{"action":27}},{"menuName":"Torino Red","data":{"action":28}},{"menuName":"Formula Red","data":{"action":29}},{"menuName":"Lava Red","data":{"action":150}},{"menuName":"Blaze Red","data":{"action":30}},{"menuName":"Grace Red","data":{"action":31}},{"menuName":"Garnet Red","data":{"action":32}},{"menuName":"Sunset Red","data":{"action":33}},{"menuName":"Cabernet Red","data":{"action":34}},{"menuName":"Wine Red","data":{"action":143}},{"menuName":"Candy Red","data":{"action":35}},{"menuName":"Hot Pink","data":{"action":135}},{"menuName":"Pfsiter Pink","data":{"action":137}},{"menuName":"Salmon Pink","data":{"action":136}},{"menuName":"Sunrise Orange","data":{"action":36}},{"menuName":"Orange","data":{"action":38}},{"menuName":"Bright Orange","data":{"action":138}},{"menuName":"Gold","data":{"action":99}},{"menuName":"Bronze","data":{"action":90}},{"menuName":"Yellow","data":{"action":88}},{"menuName":"Race Yellow","data":{"action":89}},{"menuName":"Dew Yellow","data":{"action":91}},{"menuName":"Dark Green","data":{"action":49}},{"menuName":"Racing Green","data":{"action":50}},{"menuName":"Sea Green","data":{"action":51}},{"menuName":"Olive Green","data":{"action":52}},{"menuName":"Bright Green","data":{"action":53}},{"menuName":"Gasoline Green","data":{"action":54}},{"menuName":"Lime Green","data":{"action":92}},{"menuName":"Midnight Blue","data":{"action":141}},{"menuName":"Galaxy Blue","data":{"action":61}},{"menuName":"Dark Blue","data":{"action":62}},{"menuName":"Saxon Blue","data":{"action":63}},{"menuName":"Blue","data":{"action":64}},{"menuName":"Mariner Blue","data":{"action":65}},{"menuName":"Harbor Blue","data":{"action":66}},{"menuName":"Diamond Blue","data":{"action":67}},{"menuName":"Surf Blue","data":{"action":68}},{"menuName":"Nautical Blue","data":{"action":69}},{"menuName":"Racing Blue","data":{"action":73}},{"menuName":"Ultra Blue","data":{"action":70}},{"menuName":"Light Blue","data":{"action":74}},{"menuName":"Chocolate Brown","data":{"action":96}},{"menuName":"Bison Brown","data":{"action":101}},{"menuName":"Creeen Brown","data":{"action":95}},{"menuName":"Feltzer Brown","data":{"action":94}},{"menuName":"Maple Brown","data":{"action":97}},{"menuName":"Beechwood Brown","data":{"action":103}},{"menuName":"Sienna Brown","data":{"action":104}},{"menuName":"Saddle Brown","data":{"action":98}},{"menuName":"Moss Brown","data":{"action":100}},{"menuName":"Woodbeech Brown","data":{"action":102}},{"menuName":"Straw Brown","data":{"action":99}},{"menuName":"Sandy Brown","data":{"action":105}},{"menuName":"Bleached Brown","data":{"action":106}},{"menuName":"Schafter Purple","data":{"action":71}},{"menuName":"Spinnaker Purple","data":{"action":72}},{"menuName":"Midnight Purple","data":{"action":142}},{"menuName":"Bright Purple","data":{"action":145}},{"menuName":"Cream","data":{"action":107}},{"menuName":"Ice White","data":{"action":111}},{"menuName":"Frost White","data":{"action":112}}]
};


// Vehicle RGB colors
var rgbcolors = {
    "smoke": [{"menuName":"Default","data":{"action": "18 17 16"}},{"menuName":"Black","data":{"action": "8 8 8"}},{"menuName":"Graphite","data":{"action": "15 15 15"}},{"menuName":"Anthracite Black","data":{"action": "18 17 16"}},{"menuName":"Black Steel","data":{"action": "28 30 33"}},{"menuName":"Dark Silver","data":{"action": "41 44 46"}},{"menuName":"Silver","data":{"action": "90 94 102"}},{"menuName":"Blue Silver","data":{"action": "119 124 135"}},{"menuName":"Rolled Steel","data":{"action": "81 84 89"}},{"menuName":"Shadow Silver","data":{"action": "50 59 71"}},{"menuName":"Stone Silver","data":{"action": "51 51 51"}},{"menuName":"Midnight Silver","data":{"action": "31 34 38"}},{"menuName":"Cast Iron Silver","data":{"action": "35 41 46"}},{"menuName":"Red","data":{"action": "105 0 0"}},{"menuName":"Torino Red","data":{"action": "138 11 0"}},{"menuName":"Formula Red","data":{"action": "107 0 0"}},{"menuName":"Lava Red","data":{"action": "107 11 0"}},{"menuName":"Blaze Red","data":{"action": "97 16 9"}},{"menuName":"Grace Red","data":{"action": "74 10 10"}},{"menuName":"Garnet Red","data":{"action": "71 14 14"}},{"menuName":"Sunset Red","data":{"action": "56 12 0"}},{"menuName":"Cabernet Red","data":{"action": "38 3 11"}},{"menuName":"Wine Red","data":{"action": "8 0 0"}},{"menuName":"Candy Red","data":{"action": "99 0 18"}},{"menuName":"Hot Pink","data":{"action": "176 18 89"}},{"menuName":"Pink","data":{"action": "143 47 85"}},{"menuName":"Salmon Pink","data":{"action": "246 151 153"}},{"menuName":"Sunrise Orange","data":{"action": "128 40 0"}},{"menuName":"Bright Orange","data":{"action": "194 102 16"}},{"menuName":"Gold","data":{"action": "94 83 67"}},{"menuName":"Bronze","data":{"action": "74 52 27"}},{"menuName":"Yellow","data":{"action": "245 137 15"}},{"menuName":"Flur Yellow","data":{"action": "162 168 39"}},{"menuName":"Dark Green","data":{"action": "0 18 7"}},{"menuName":"Sea Green","data":{"action": "0 33 30"}},{"menuName":"Olive Green","data":{"action": "31 38 30"}},{"menuName":"Bright Green","data":{"action": "0 56 5"}},{"menuName":"Petrol Green","data":{"action": "11 65 69"}},{"menuName":"Lime Green","data":{"action": "86 143 0"}},{"menuName":"Midnight Blue","data":{"action": "0 1 8"}},{"menuName":"Galaxy Blue","data":{"action": "0 13 20"}},{"menuName":"Dark Blue","data":{"action": "0 16 41"}},{"menuName":"Saxon Blue","data":{"action": "28 47 79"}},{"menuName":"Blue","data":{"action": "0 27 87"}},{"menuName":"Mariner Blue","data":{"action": "59 78 120"}},{"menuName":"Harbor Blue","data":{"action": "39 45 59"}},{"menuName":"Diamond Blue","data":{"action": "149 178 219"}},{"menuName":"Surf Blue","data":{"action": "62 98 122"}},{"menuName":"Nautical Blue","data":{"action": "28 49 64"}},{"menuName":"Racing Blue","data":{"action": "14 49 109"}},{"menuName":"Light Blue","data":{"action": "57 90 131"}},{"menuName":"Bison Brown","data":{"action": "34 25 24"}},{"menuName":"Creek Brown","data":{"action": "38 33 23"}},{"menuName":"Umber Brown","data":{"action": "41 27 6"}},{"menuName":"Maple Brown","data":{"action": "51 33 17"}},{"menuName":"Beechwood Brown","data":{"action": "36 19 9"}},{"menuName":"Sienna Brown","data":{"action": "59 23 0"}},{"menuName":"Saddle Brown","data":{"action": "61 48 35"}},{"menuName":"Moss Brown","data":{"action": "55 56 43"}},{"menuName":"Woodbeech Brown","data":{"action": "87 80 54"}},{"menuName":"Straw Brown","data":{"action": "94 83 67"}},{"menuName":"Sandy Brown","data":{"action": "110 98 70"}},{"menuName":"Bleeched Brown","data":{"action": "153 141 115"}},{"menuName":"Purple","data":{"action": "26 24 46"}},{"menuName":"Spin Purple","data":{"action": "22 22 41"}},{"menuName":"Might Purple","data":{"action": "5 0 8"}},{"menuName":"Bright Purple","data":{"action": "50 6 66"}},{"menuName":"Cream","data":{"action": "207 192 165"}},{"menuName":"Frost White","data":{"action": "179 185 201"}}],
    "neon" : [{"menuName":"White","data":{"action": "222 222 255"}},{"menuName":"Cream","data":{"action": "207 192 165"}},{"menuName":"Red","data":{"action": "255 1 1"}},{"menuName":"Lava Red","data":{"action": "105 0 0"}},{"menuName":"Grace Red","data":{"action": "74 10 10"}},{"menuName":"Garnet Red","data":{"action": "71 14 14"}},{"menuName":"Wine Red","data":{"action": "8 0 0"}},{"menuName":"Pony Pink","data":{"action": "255 50 100"}},{"menuName":"Fluorescent Pink","data":{"action": "255 5 190"}},{"menuName":"Light Pink","data":{"action": "38 3 11"}},{"menuName":"Hot Pink","data":{"action": "99 0 18"}},{"menuName":"Pink","data":{"action": "176 18 89"}},{"menuName":"Salmon Pink","data":{"action": "143 47 85"}},{"menuName":"Orange","data":{"action": "138 11 0"}},{"menuName":"Light Orange","data":{"action": "107 11 0"}},{"menuName":"Gold","data":{"action": "255 62 0"}},{"menuName":"Light Gold","data":{"action": "194 102 16"}},{"menuName":"Golden Shower","data":{"action": "255 150 5"}},{"menuName":"Bronze","data":{"action": "74 52 27"}},{"menuName":"Yellow","data":{"action": "245 137 15"}},{"menuName":"Flur Yellow","data":{"action": "162 168 39"}},{"menuName":"Flurorescent Yellow","data":{"action": "255 255 0"}},{"menuName":"Mint Green","data":{"action": "0 255 140"}},{"menuName":"Fluorescent Green","data":{"action": "94 255 1"}},{"menuName":"Dark Green","data":{"action": "0 18 7"}},{"menuName":"Sea Green","data":{"action": "0 33 30"}},{"menuName":"Bright Green","data":{"action": "0 56 5"}},{"menuName":"Petrol Green","data":{"action": "11 65 69"}},{"menuName":"Electric Blue","data":{"action": "3 83 255"}},{"menuName":"Midnight Blue","data":{"action": "0 1 8"}},{"menuName":"Galaxy Blue","data":{"action": "0 13 20"}},{"menuName":"Dark Blue","data":{"action": "0 16 41"}},{"menuName":"Blue","data":{"action": "0 27 87"}},{"menuName":"Racing Blue","data":{"action": "14 49 109"}},{"menuName":"Purple","data":{"action": "35 1 255"}},{"menuName":"Spin Purple","data":{"action": "26 24 46"}},{"menuName":"Might Purple","data":{"action": "5 0 8"}},{"menuName":"Bright Purple","data":{"action": "50 6 66"}},{"menuName":"Blacklight","data":{"action": "15 3 255"}}]
};


// Vehicle Modification Objects.
var vehicle_mods = {
    "vehiclehorns" : [{"menuName":"Stock Horn","data": {"action":"14 -1"}},{"menuName":"Truck Horn","data": {"action":"14 0"}},{"menuName":"Police Horn","data": {"action":"14 1"}},{"menuName":"Clown Horn","data": {"action":"14 2"}},{"menuName":"Musical Horn 1","data": {"action":"14 3"}},{"menuName":"Musical Horn 2","data": {"action":"14 4"}},{"menuName":"Musical Horn 3","data": {"action":"14 5"}},{"menuName":"Musical Horn 4","data": {"action":"14 6"}},{"menuName":"Musical Horn 5","data": {"action":"14 7"}},{"menuName":"Sadtrombone Horn","data": {"action":"14 8"}},{"menuName":"Calssical Horn 1","data": {"action":"14 9"}},{"menuName":"Calssical Horn 2","data": {"action":"14 10"}},{"menuName":"Calssical Horn 3","data": {"action":"14 11"}},{"menuName":"Calssical Horn 4","data": {"action":"14 12"}},{"menuName":"Calssical Horn 5","data": {"action":"14 13"}},{"menuName":"Calssical Horn 6","data": {"action":"14 14"}},{"menuName":"Calssical Horn 7","data": {"action":"14 15"}},{"menuName":"Scaledo Horn","data": {"action":"14 16"}},{"menuName":"Scalere Horn","data": {"action":"14 17"}},{"menuName":"Scalemi Horn","data": {"action":"14 18"}},{"menuName":"Scalefa Horn","data": {"action":"14 19"}},{"menuName":"Scalesol Horn","data": {"action":"14 20"}},{"menuName":"Scalela Horn","data": {"action":"14 21"}},{"menuName":"Scaleti Horn","data": {"action":"14 22"}},{"menuName":"Scaledo Horn High","data": {"action":"14 23"}},{"menuName":"Jazz Horn 1","data": {"action":"14 25"}},{"menuName":"Jazz Horn 2","data": {"action":"14 26"}},{"menuName":"Jazz Horn 3","data": {"action":"14 27"}},{"menuName":"Jazzloop Horn","data": {"action":"14 28"}},{"menuName":"Starspangban Horn 1","data": {"action":"14 29"}},{"menuName":"Starspangban Horn 2","data": {"action":"14 30"}},{"menuName":"Starspangban Horn 3","data": {"action":"14 31"}},{"menuName":"Starspangban Horn 4","data": {"action":"14 32"}},{"menuName":"Classicalloop Horn 1","data": {"action":"14 33"}},{"menuName":"Classical Horn 8","data": {"action":"14 34"}},{"menuName":"Classicalloop Horn 2","data": {"action":"14 35"}}],
    "wheel_sport": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Inferno", "data": {"action":"23 0"}},{"menuName" : "Deepfive", "data": {"action":"23 1"}},{"menuName" : "Lozspeed", "data": {"action":"23 2"}},{"menuName" : "Diamondcut", "data": {"action":"23 3"}},{"menuName" : "Chrono", "data": {"action":"23 4"}},{"menuName" : "Feroccirr", "data": {"action":"23 5"}},{"menuName" : "Fiftynine", "data": {"action":"23 6"}},{"menuName" : "Mercie", "data": {"action":"23 7"}},{"menuName" : "Syntheticz", "data": {"action":"23 8"}},{"menuName" : "Organictyped", "data": {"action":"23 9"}},{"menuName" : "Endov1", "data": {"action":"23 10"}},{"menuName" : "Duper7", "data": {"action":"23 11"}},{"menuName" : "Uzer", "data": {"action":"23 12"}},{"menuName" : "Groundride", "data": {"action":"23 13"}},{"menuName" : "Spacer", "data": {"action":"23 14"}},{"menuName" : "Venum", "data": {"action":"23 15"}},{"menuName" : "Cosmo", "data": {"action":"23 16"}},{"menuName" : "Dashvip", "data": {"action":"23 17"}},{"menuName" : "Icekid", "data": {"action":"23 18"}},{"menuName" : "Ruffeld", "data": {"action":"23 19"}},{"menuName" : "Wangenmaster", "data": {"action":"23 20"}},{"menuName" : "Superfive", "data": {"action":"23 21"}},{"menuName" : "Endov2", "data": {"action":"23 22"}},{"menuName" : "Slitsix", "data": {"action":"23 23"}}],
    "wheel_suv": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Vip", "data": {"action":"23 0"}},{"menuName" : "Benefactor", "data": {"action":"23 1"}},{"menuName" : "Cosmo", "data": {"action":"23 2"}},{"menuName" : "Bippu", "data": {"action":"23 3"}},{"menuName" : "Royalsix", "data": {"action":"23 4"}},{"menuName" : "Fagorme", "data": {"action":"23 5"}},{"menuName" : "Deluxe", "data": {"action":"23 6"}},{"menuName" : "Icedout", "data": {"action":"23 7"}},{"menuName" : "Cognscenti", "data": {"action":"23 8"}},{"menuName" : "Lozspeedten", "data": {"action":"23 9"}},{"menuName" : "Supernova", "data": {"action":"23 10"}},{"menuName" : "Obeyrs", "data": {"action":"23 11"}},{"menuName" : "Lozspeedballer", "data": {"action":"23 12"}},{"menuName" : "Extra vaganzo", "data": {"action":"23 13"}},{"menuName" : "Splitsix", "data": {"action":"23 14"}},{"menuName" : "Empowered", "data": {"action":"23 15"}},{"menuName" : "Sunrise", "data": {"action":"23 16"}},{"menuName" : "Dashvip", "data": {"action":"23 17"}},{"menuName" : "Cutter", "data": {"action":"23 18"}}],
    "wheel_offroad": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Raider", "data": {"action":"23 0"}},{"menuName" : "Mudslinger", "data": {"action":"23 1"}},{"menuName" : "Nevis", "data": {"action":"23 2"}},{"menuName" : "Cairngorm", "data": {"action":"23 3"}},{"menuName" : "Amazon", "data": {"action":"23 4"}},{"menuName" : "Challenger", "data": {"action":"23 5"}},{"menuName" : "Dunebasher", "data": {"action":"23 6"}},{"menuName" : "Fivestar", "data": {"action":"23 7"}},{"menuName" : "Rockcrawler", "data": {"action":"23 8"}},{"menuName" : "Milspecsteelie", "data": {"action":"23 9"}}],
    "wheel_tuner": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Cosmo", "data": {"action":"23 0"}},{"menuName" : "Supermesh", "data": {"action":"23 1"}},{"menuName" : "Outsider", "data": {"action":"23 2"}},{"menuName" : "Rollas", "data": {"action":"23 3"}},{"menuName" : "Driffmeister", "data": {"action":"23 4"}},{"menuName" : "Slicer", "data": {"action":"23 5"}},{"menuName" : "Elquatro", "data": {"action":"23 6"}},{"menuName" : "Dubbed", "data": {"action":"23 7"}},{"menuName" : "Fivestar", "data": {"action":"23 8"}},{"menuName" : "Slideways", "data": {"action":"23 9"}},{"menuName" : "Apex", "data": {"action":"23 10"}},{"menuName" : "Stancedeg", "data": {"action":"23 11"}},{"menuName" : "Countersteer", "data": {"action":"23 12"}},{"menuName" : "Endov1", "data": {"action":"23 13"}},{"menuName" : "Endov2dish", "data": {"action":"23 14"}},{"menuName" : "Guppez", "data": {"action":"23 15"}},{"menuName" : "Chokadori", "data": {"action":"23 16"}},{"menuName" : "Chicane", "data": {"action":"23 17"}},{"menuName" : "Saisoku", "data": {"action":"23 18"}},{"menuName" : "Dishedeight", "data": {"action":"23 19"}},{"menuName" : "Fujiwara", "data": {"action":"23 20"}},{"menuName" : "Zokusha", "data": {"action":"23 21"}},{"menuName" : "Battlevill", "data": {"action":"23 22"}},{"menuName" : "Rallymaster", "data": {"action":"23 23"}}],
    "wheel_highend": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Shadow", "data": {"action":"23 0"}},{"menuName" : "Hyper", "data": {"action":"23 1"}},{"menuName" : "Blade", "data": {"action":"23 2"}},{"menuName" : "Diamond", "data": {"action":"23 3"}},{"menuName" : "Supagee", "data": {"action":"23 4"}},{"menuName" : "Chromaticz", "data": {"action":"23 5"}},{"menuName" : "Merciechlip", "data": {"action":"23 6"}},{"menuName" : "Obeyrs", "data": {"action":"23 7"}},{"menuName" : "Gtchrome", "data": {"action":"23 8"}},{"menuName" : "Cheetahr", "data": {"action":"23 9"}},{"menuName" : "Solar", "data": {"action":"23 10"}},{"menuName" : "Splitten", "data": {"action":"23 11"}},{"menuName" : "Dashvip", "data": {"action":"23 12"}},{"menuName" : "Lozspeedten", "data": {"action":"23 13"}},{"menuName" : "Carboninferno", "data": {"action":"23 14"}},{"menuName" : "Carbonshadow", "data": {"action":"23 15"}},{"menuName" : "Carbonz", "data": {"action":"23 16"}},{"menuName" : "Carbonsolar", "data": {"action":"23 17"}},{"menuName" : "Carboncheetahr", "data": {"action":"23 18"}},{"menuName" : "Carbonsracer", "data": {"action":"23 19"}}],
    "wheel_lowrider": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Flare", "data": {"action":"23 0"}},{"menuName" : "Wired", "data": {"action":"23 1"}},{"menuName" : "Triplegolds", "data": {"action":"23 2"}},{"menuName" : "Bigworm", "data": {"action":"23 3"}},{"menuName" : "Sevenfives", "data": {"action":"23 4"}},{"menuName" : "Splitsix", "data": {"action":"23 5"}},{"menuName" : "Freshmesh", "data": {"action":"23 6"}},{"menuName" : "Leadsled", "data": {"action":"23 7"}},{"menuName" : "Turbine", "data": {"action":"23 8"}},{"menuName" : "Superfin", "data": {"action":"23 9"}},{"menuName" : "Classicrod", "data": {"action":"23 10"}},{"menuName" : "Dollar", "data": {"action":"23 11"}},{"menuName" : "Dukes", "data": {"action":"23 12"}},{"menuName" : "Lowfive", "data": {"action":"23 13"}},{"menuName" : "Gooch", "data": {"action":"23 14"}}],
    "wheel_muscle": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Classicfive", "data": {"action":"23 0"}},{"menuName" : "Dukes", "data": {"action":"23 1"}},{"menuName" : "Musclefreak", "data": {"action":"23 2"}},{"menuName" : "Kracka", "data": {"action":"23 3"}},{"menuName" : "Azrea", "data": {"action":"23 4"}},{"menuName" : "Mecha", "data": {"action":"23 5"}},{"menuName" : "Blacktop", "data": {"action":"23 6"}},{"menuName" : "Dragspl", "data": {"action":"23 7"}},{"menuName" : "Revolver", "data": {"action":"23 8"}},{"menuName" : "Classicrod", "data": {"action":"23 9"}},{"menuName" : "Spooner", "data": {"action":"23 10"}},{"menuName" : "Fivestar", "data": {"action":"23 11"}},{"menuName" : "Oldschool", "data": {"action":"23 12"}},{"menuName" : "Eljefe", "data": {"action":"23 13"}},{"menuName" : "Dodman", "data": {"action":"23 14"}},{"menuName" : "Sixgun", "data": {"action":"23 15"}},{"menuName" : "Mercenary", "data": {"action":"23 16"}}],
    "wheel_front": [{"menuName" : "Stock", "data": {"action":"23 -1"}},{"menuName" : "Speedway", "data": {"action":"23 0"}},{"menuName" : "Streetspecial", "data": {"action":"23 1"}},{"menuName" : "Racer", "data": {"action":"23 2"}},{"menuName" : "Trackstar", "data": {"action":"23 3"}},{"menuName" : "Overlord", "data": {"action":"23 4"}},{"menuName" : "Trident", "data": {"action":"23 5"}},{"menuName" : "Triplethreat", "data": {"action":"23 6"}},{"menuName" : "Stilleto", "data": {"action":"23 7"}},{"menuName" : "Wires", "data": {"action":"23 8"}},{"menuName" : "Bobber", "data": {"action":"23 9"}},{"menuName" : "Solidus", "data": {"action":"23 10"}},{"menuName" : "Iceshield", "data": {"action":"23 11"}},{"menuName" : "Loops", "data": {"action":"23 12"}}],
    "wheel_back": [{"menuName" : "Stock", "data": {"action":"24 -1"}},{"menuName" : "Speedway", "data": {"action":"24 0"}},{"menuName" : "Streetspecial", "data": {"action":"24 1"}},{"menuName" : "Racer", "data": {"action":"24 2"}},{"menuName" : "Trackstar", "data": {"action":"24 3"}},{"menuName" : "Overlord", "data": {"action":"24 4"}},{"menuName" : "Trident", "data": {"action":"24 5"}},{"menuName" : "Triplethreat", "data": {"action":"24 6"}},{"menuName" : "Stilleto", "data": {"action":"24 7"}},{"menuName" : "Wires", "data": {"action":"24 8"}},{"menuName" : "Bobber", "data": {"action":"24 9"}},{"menuName" : "Solidus", "data": {"action":"24 10"}},{"menuName" : "Iceshield", "data": {"action":"24 11"}},{"menuName" : "Loops", "data": {"action":"24 12"}}],
    "wheel_benny": [{"menuName": "Stock","data": {"action":"24 -1"}},{"menuName": "OG Hunnets","data": {"action":"24 0"}},{"menuName": "OG Hunnets (Chrome Lip)","data": {"action":"24 1"}}]
};


/***
 *           _    _____    ____    _   _    __      __                 _           _       _              
 *          | |  / ____|  / __ \  | \ | |   \ \    / /                (_)         | |     | |             
 *          | | | (___   | |  | | |  \| |    \ \  / /    __ _   _ __   _    __ _  | |__   | |   ___   ___ 
 *      _   | |  \___ \  | |  | | | . ` |     \ \/ /    / _` | | '__| | |  / _` | | '_ \  | |  / _ \ / __|
 *     | |__| |  ____) | | |__| | | |\  |      \  /    | (_| | | |    | | | (_| | | |_) | | | |  __/ \__ \
 *      \____/  |_____/   \____/  |_| \_|       \/      \__,_| |_|    |_|  \__,_| |_.__/  |_|  \___| |___/
 *                                                                                                        
 *                                                                                                        
 */


// Static Request Objects
var requestObjects = {
    "player_skins_characters" : playerList,
    "player_skins_animals" : AnimalList,
    "player_skins_npcs" : NPCList,
    "vehicle_cars_supercars" : vehicle_supercars,
    "vehicle_cars_sports" : vehicle_sports,
    "vehicle_cars_sportsclassics" : vehicle_sportsclassics,
    "vehicle_cars_muscle" : vehicle_muscle,
    "vehicle_cars_lowriders" : vehicle_lowriders,
    "vehicle_cars_coupes" : vehicle_coupes,
    "vehicle_cars_sedans" : vehicle_sedans,
    "vehicle_cars_compacts" : vehicle_compacts,
    "vehicle_cars_suvs" : vehicle_suvs,
    "vehicle_cars_offroad" : vehicle_offroad,
    "vehicle_cars_vip" : vehicle_vip,
    "vehicle_industrial_pickups" : vehicle_pickups,
    "vehicle_industrial_vans" : vehicle_vans,
    "vehicle_industrial_trucks" : vehicle_trucks,
    "vehicle_industrial_service" : vehicle_service,
    "vehicle_industrial_trailers" : vehicle_trailers,
    "vehicle_industrial_trains" : vehicle_trains,
    "vehicle_emergency" : vehicle_emergency,
    "vehicle_motorcycles" : vehicle_motorcycles,
    "vehicle_planes" : vehicle_planes,
    "vehicle_helicopters" : vehicle_helicopters,
    "vehicle_boats" : vehicle_boats,
    "vehicle_bicycles" : vehicle_bicycles,

    "weapon_melee" : weaponDB['Melee'],
    "weapon_handguns" : weaponDB['Handguns'],
    "weapon_submachine" : weaponDB['Submachine'],
    "weapon_assault" : weaponDB['Assault'],
    "weapon_shotgun" : weaponDB['Shotguns'],
    "weapon_snipers" : weaponDB['Snipers'],
    "weapon_heavy" : weaponDB['Heavy'],
    "weapon_thrown" : weaponDB['Thrown'],


    "vehicle_mod_paint_primary_normal": vehicleColors["primaryclassic"],
    "vehicle_mod_paint_secondary_normal": vehicleColors["secondaryclassic"],
    "vehicle_mod_paint_both_normal": vehicleColors["secondaryclassic"],
    "vehicle_mod_paint_primary_metal": vehicleColors["primarymetal"],
    "vehicle_mod_paint_secondary_metal": vehicleColors["secondarymetal"],
    "vehicle_mod_paint_both_metal": vehicleColors["secondarymetal"],
    "vehicle_mod_paint_primary_matte": vehicleColors["primarymatte"],
    "vehicle_mod_paint_secondary_matte": vehicleColors["secondarymatte"],
    "vehicle_mod_paint_both_matte": vehicleColors["secondarymatte"],
    "vehicle_mod_paint_primary_metallic": vehicleColors["primarymetallic"],
    "vehicle_mod_paint_secondary_metallic": vehicleColors["secondarymetallic"],
    "vehicle_mod_paint_both_metallic": vehicleColors["secondarymetallic"],
    "vehicle_mod_paint_primary_chrome": vehicleColors["primarychrome"],
    "vehicle_mod_paint_secondary_chrome": vehicleColors["secondarychrome"],
    "vehicle_mod_paint_both_chrome": vehicleColors["secondarychrome"],

    "vehicle_mod_paint_pearl_topcoat": vehicleColors["primaryclassic"],
    "vehicle_mod_paint_wheels": vehicleColors["wheelcolors"],

    "vehicle_mod_neon_colors": rgbcolors["neon"],
    "vehicle_mod_smoke_colors": rgbcolors["smoke"],


    "vehicle_mod_horn" : vehicle_mods['vehiclehorns'],
    "vehicle_wheel_0": vehicle_mods['wheel_sport'],
    "vehicle_wheel_1": vehicle_mods['wheel_muscle'],
    "vehicle_wheel_2": vehicle_mods['wheel_lowrider'],
    "vehicle_wheel_3": vehicle_mods['wheel_suv'],
    "vehicle_wheel_4": vehicle_mods['wheel_offroad'],
    "vehicle_wheel_5": vehicle_mods['wheel_tuner'],
    "vehicle_wheel_7": vehicle_mods['wheel_highend'],
    "vehicle_wheel_8": vehicle_mods['wheel_benny'],
    "vehicle_wheel_front": vehicle_mods['wheel_front'],
    "vehicle_wheel_back": vehicle_mods['wheel_back']
};



// Static Request Actions
var requestAction = {
    "player_skins_characters" : "playerskin",
    "player_skins_animals" :  "playerskin",
    "player_skins_npcs" :  "playerskin",
    "vehicle_cars_supercars" : "vehspawn",
    "vehicle_cars_sports" :  "vehspawn",
    "vehicle_cars_sportsclassics" :  "vehspawn",
    "vehicle_cars_muscle" :  "vehspawn",
    "vehicle_cars_lowriders" :  "vehspawn",
    "vehicle_cars_coupes" :  "vehspawn",
    "vehicle_cars_sedans" :  "vehspawn",
    "vehicle_cars_compacts" :  "vehspawn",
    "vehicle_cars_suvs" :  "vehspawn",
    "vehicle_cars_offroad" :  "vehspawn",
    "vehicle_cars_vip" :  "vehspawn",
    "vehicle_industrial_pickups" :  "vehspawn",
    "vehicle_industrial_vans" :  "vehspawn",
    "vehicle_industrial_trucks" :  "vehspawn",
    "vehicle_industrial_service" :  "vehspawn",
    "vehicle_industrial_trailers" :  "vehspawn",
    "vehicle_industrial_trains" :  "vehspawn",
    "vehicle_emergency" :  "vehspawn",
    "vehicle_motorcycles" :  "vehspawn",
    "vehicle_planes" :  "vehspawn",
    "vehicle_helicopters" :  "vehspawn",
    "vehicle_boats" :  "vehspawn",
    "vehicle_bicycles" :  "vehspawn",
    "weapon_melee" : "weapon mod",
    "weapon_handguns" : "weapon mod",
    "weapon_submachine" : "weapon mod",
    "weapon_assault" : "weapon mod",
    "weapon_shotgun" : "weapon mod",
    "weapon_snipers" : "weapon mod",
    "weapon_heavy" : "weapon mod",
    "weapon_thrown" : "weapon mod",


    "vehicle_mod_paint_primary_normal": "vehmod paint",
    "vehicle_mod_paint_secondary_normal": "vehmod paint2",
    "vehicle_mod_paint_both_normal": "vehmod paint3",
    "vehicle_mod_paint_primary_metal": "vehmod paint",
    "vehicle_mod_paint_secondary_metal": "vehmod paint2",
    "vehicle_mod_paint_both_metal": "vehmod paint3",
    "vehicle_mod_paint_primary_matte": "vehmod paint",
    "vehicle_mod_paint_secondary_matte": "vehmod paint2",
    "vehicle_mod_paint_both_matte": "vehmod paint3",
    "vehicle_mod_paint_primary_metallic": "vehmod paint",
    "vehicle_mod_paint_secondary_metallic": "vehmod paint2",
    "vehicle_mod_paint_both_metallic": "vehmod paint3",
    "vehicle_mod_paint_primary_chrome": "vehmod paint",
    "vehicle_mod_paint_secondary_chrome": "vehmod paint2",
    "vehicle_mod_paint_both_chrome": "vehmod paint3",
    "vehicle_mod_paint_pearl_topcoat": "vehmod paintpearl",
    "vehicle_mod_paint_wheels": "vehmod paintwheels",

    "vehicle_mod_neon_colors" : "vehmod lightcolor",
    "vehicle_mod_smoke_colors" : "vehmod smokecolor",


    "vehicle_mod_horn" : "vehmodify",
    "vehicle_wheel_0": "vehmodify",
    "vehicle_wheel_1": "vehmodify",
    "vehicle_wheel_2": "vehmodify",
    "vehicle_wheel_3": "vehmodify",
    "vehicle_wheel_4": "vehmodify",
    "vehicle_wheel_5":"vehmodify",
    "vehicle_wheel_7": "vehmodify",
    "vehicle_wheel_8": "vehmodify",
    "vehicle_wheel_front": "vehmodify",
    "vehicle_wheel_back": "vehmodify" 
};