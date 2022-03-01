let nbJoueurs = 2
const blackBot = new BlackBot(nbJoueurs)

const defCroupierHtml = '<div class="croupier">' +
                        '<h2 class="nomCroupier">Croupier</h2>' +
                        '<div class="carteBanque cartes"></div>' +
                        '</div>';


$('document').ready(function() {
    const $zoneCroupier = $('.croupier')
    const $zoneJoueurs = $('#joueurs')
    //Ajout de la zone du croupier
    $zoneCroupier.append(defCroupierHtml)

    //Ajout des zones des joueurs
    for (let i = 0; i < nbJoueurs; i++){
        $zoneJoueurs.append('<div class="joueur">' +
                            '<h2 class="nomJoueur">Joueur '+i+'</h2>' +
                            '<div class="cartes'+i+' cartes"></div>' +
                            '<div class="mise miseJoueur'+i+'">'+blackBot.miseJoueurs[i]+'</div>' +
                            '<div class="boutonsJoueurs">' +
                                '<button class="miser'+i+'">Miser</button>' +
                                '<button class="tirer'+i+'">Tirer</button>' +
                                '<button class="stop'+i+'">Stop</button>' +
                            '</div>' +
                            '</div>')

        $('.miser'+i).click(function() {
            blackBot.miser(i, 10)
            $('.miseJoueur'+i).text(blackBot.miseJoueurs[i])
            actualiserJoueurs()
            $('.tirage').removeAttr('disabled')
        })

        $('.tirer'+i).attr('disabled', 'disabled').click(function() {
            blackBot.tirer(i)
            actualiserJoueurs()
        })

        $('.stop'+i).attr('disabled', 'disabled').click(function() {
            blackBot.terminer(i)
            actualiserJoueurs()
        })
    }
    
    actualiserJoueurs()

    $('.tirage').attr('disabled','disabled').click(function() {
        blackBot.distribuer()
        actualiserJoueurs()
        passageJeu()
    })

    $('.recommencer').attr('disabled','disabled').click(function() {
        blackBot.relancerPartie()
        actualiserJoueurs()
        passageMise()
    })

    function actualiserJoueurs() {
        for (let i = 0; i < nbJoueurs; i++) {
            actualiserCartesJoueur(i)
            $('.miseJoueur'+i).html(blackBot.miseJoueurs[i])
            if (blackBot.etat === EtatBlackBot.GAIN) {
                $('.miser'+i).attr('disabled', 'disabled')
                $('.tirer'+i).attr('disabled', 'disabled')
                $('.stop'+i).attr('disabled', 'disabled')
            }
        }
        actualiserCartesBanque()
        if (blackBot.etat === EtatBlackBot.GAIN) {
            $('.recommencer').removeAttr('disabled')
        } else {
            $('.recommencer').attr('disabled', 'disabled')
        }
    }

    function passageJeu(){
        for (let i = 0; i < nbJoueurs; i++) {
            $('.miser'+i).attr('disabled', 'disabled')
            $('.tirer'+i).attr('disabled',false)
            $('.stop'+i).removeAttr('disabled')
        }
        $('.tirage').attr('disabled', 'disabled')
    }

    function passageMise() {
        for (let i = 0; i < nbJoueurs; i++) {
            $('.miser'+i).removeAttr('disabled')
            $('.tirer'+i).attr('disabled', 'disabled')
            $('.stop'+i).attr('disabled', 'disabled')
        }
        $('.tirage').removeAttr('disabled')
    }

    function actualiserCartesJoueur(indJoueur){
        for (let i = 0; i < blackBot.mainJoueurs[indJoueur].getNbCartes(); i++){
            let carteAct = blackBot.mainJoueurs[indJoueur].cartes[i]
            $(".cartes"+indJoueur).append('<img src="resources/Cartes/' + NomCarte[carteAct.hauteur]+'_'+CouleurCarte[carteAct.couleur]+'.png" width="100" height="200"></img>')
        }
    }

    function actualiserCartesBanque(){
        for (let i = 0; i < blackBot.mainBanque.getNbCartes(); i++){
            let carteAct = blackBot.mainBanque.cartes[i]
            $(".carteBanque").append('<img src="resources/Cartes/' + NomCarte[carteAct.hauteur]+'_'+CouleurCarte[carteAct.couleur]+'.png" width="100" height="200"></img>')
        }
    }
})