GUIAction = {
    closeGui () {
        $('#identity').css("display", "none");
        $('#register').css("display", "none");
        $("#cursor").css("display", "none");
    },
    openGuiIdentity (data) {
        data = data || {}
        let infoMissing = 'Not specified'
        if (data.dateofbirth) {
            data.dateofbirth = data.dateofbirth.substr(0,11)
        }
        if (data.sex !== undefined) {
            data.sex = data.sex === 'm' ? 'Homme' : 'Femme'
            if (data.sex === 'm') {
                $('#identity').addClass('identity-male');
            }

            if (data.sex === 'f') {
                $('#identity').addClass('identity-female');
            }
        }
        if (data.height !== undefined){
            data.height = data.height + ' cm'
        }
        ['lastname','firstname','jobs', 'dateofbirth', 'sex', 'height'].forEach(k => {
            $('#'+k).text(data[k] || infoMissing)
        })
        let id = ('000' + data.id).substr(-4)
        let cardNumber = "ID:" + id + "<<" 

        cardNumber += (data.lastname || 'WWWW').substr(0, 4) 
        cardNumber += (data.dateofbirth || '0000001900').substr(6,4)
        cardNumber += "12<<95N3M7Vh4"

        $('#cardNumber').text(cardNumber)
        $('#identity').show();
    },
    openGuiRegisterIdentity () {
        $("#cursor").show();
        $('#register').css("display", "flex");
    },
    clickGui () {
        var element = $(document.elementFromPoint(cursorX, cursorY))
        element.focus().click()
    }
}

window.addEventListener('message', function (event){
    let method = event.data.method
    if (GUIAction[method] !== undefined) {
        GUIAction[method](event.data.data)
    }
})


/*$(document).ready(function () {
    $('#register').submit(function (event) {
        event.preventDefault()
        let form = event.target
        let data = {}
        let attrs = ['lastname', 'firstname', 'dateofbirth', 'sex', 'height']
        attrs.forEach(e => {
            data[e] = form.elements[e].value
        })
        data.dateofbirth = data.dateofbirth.split('/').reverse().join('-')

        $.post('http://gcIdentity/register', JSON.stringify(data));
    })
})*/

//
// Gestion de la souris
//
$(document).ready(function(){
    var documentWidth = document.documentElement.clientWidth
    var documentHeight = document.documentElement.clientHeight
    var cursor = $('#cursor')
    cursorX = documentWidth / 2
    cursorY = documentHeight / 2
    cursor.css('left', cursorX)
    cursor.css('top', cursorY)
    $(document).mousemove( function (event) {
        cursorX = event.pageX
        cursorY = event.pageY
        cursor.css('left', cursorX + 1)
        cursor.css('top', cursorY + 1)
    })
})