const compteur = new Compteur()

$(document).ready(function() {
    const $score = $('#score')
    const $nbCoups = $('#nbcoups')
    const $boutons = $('#boutons')
    const $RAZ = $('#RAZ')

    actualiser()

    function actualiser(){
        $score.text(compteur.score)
        $nbCoups.text(compteur.nbCoups)
    }

    for(let i = -10; i < 11; i++) {
        $boutons.append('<button>'+i+'</button>  ')
    }

    $('button').not('#RAZ').click(function() {
        compteur.ajout($(this).html())
        actualiser()
        $(this).attr('disabled', 'true')
    })

    $RAZ.click(function(){
        $('button').removeAttr('disabled', 'false')
    })
})