GUIAction = {
    hideCagoule () {
        let currentDiv = $("#screen");
        if (currentDiv.hasClass("cagoule"))
                currentDiv.removeClass("cagoule");
    },
    hideAll (pType) {
        switch (pType) {
            case "cagoule":
                this.hideCagoule();
                break;
            default:
                this.hideCagoule();
        }
    },
    display (pType) {
        let currentDiv = $("#screen");
        
        if (currentDiv != null) {
            switch (pType) {
                case "cagoule":
                    currentDiv.addClass("cagoule");
                    break;
            }
        }
    }
}

var isReady = false;

window.addEventListener('message', function (event){
    let method = event.data.method
    if (GUIAction[method] !== undefined) {
        GUIAction[method](event.data.pType)
    }
})
