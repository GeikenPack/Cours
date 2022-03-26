let nbJoueurs = 0
let blackBot = new BlackBot(nbJoueurs)
let joueurActuel = -1
let miseJoueurs = []
let miseNouveJoueur = 0

//Définition du croupier : Un nom, une zone pour les cartes et une zone pour le score
const defCroupierHtml = '<h2 class="nomCroupier">Croupier</h2>' +
                        '<div class="carteBanque cartes"></div>' +
                        '<div class="score scoreCroupier"></div>'


$('document').ready(function() {
    //On récupère les zones que l'on va utiliser
    const $zoneCroupier = $('.croupier')
    const $zoneJoueurs = $('#joueurs')
    //Ajout de la zone du croupier
    $zoneCroupier.append(defCroupierHtml)

    //Au démrage, il y a deux joueurs. On les ajoute et on les actualise
    ajoutGestionJoueurs()
    actualiserJoueurs()

    //Quand on appuie sur tirage, on distribue des cartes a tout les joueurs, on les actualise pour afficher les cartes et on passe en jeu
    $('.tirage').attr('disabled','disabled').click(function() {
        blackBot.distribuer()
        actualiserJoueurs()
        passageJeu()
    })

    //Quand on recommence, on relance la partie, on actualise les joueurs pour enlever les cartes et on passe en mise
    $('.recommencer').attr('disabled','disabled').click(function() {
        blackBot.relancerPartie()
        joueurActuel = -1
        actualiserJoueurs()
        passageMise()
        $('.message').html("")
    })

    /**
     * Ajoute les zones de joueurs suivant le nombre de joueurs défini
     */
    function ajoutJoueurs() {
        $zoneJoueurs.html('')
        //Ajout des zones des joueurs
        for (let i = 0; i < nbJoueurs; i++){
            //Chaques joueurs a une mise de base de 100
            //Définition d'un joueur
            $zoneJoueurs.append('<div class="joueur">' +
                                '<h2 class="nomJoueur">Joueur '+i+'</h2>' +
                                '<div class="cartes'+i+' cartes"></div>' +
                                '<div class="score scoreJoueur'+i+'"></div>' +
                                '<div class="mise miseJoueur'+i+'">'+blackBot.miseJoueurs[i]+'</div>' +
                                '<div class="boutonsJoueurs">' +
                                    '<input type="text" class="miseInput'+i+'"/>' +
                                    '<button class="miser'+i+'">Miser</button>' +
                                    '<button class="tirer'+i+'">Tirer</button>' +
                                    '<button class="stop'+i+'">Stop</button>' +
                                '</div>' +
                                '<div class="argent argent'+i+'"></div>' +
                                '</div>')

            /**
             * Action de miser
             * Quand le joueur appuie sur miser, on récupère la valeur saisie dans le champs approprié et l'enleve de son argent
             */
            $('.miser'+i).click(function() {
                miseActJoueur = $('.miseInput'+i).val()
                if (miseActJoueur > 0 && miseJoueurs[i] - miseActJoueur >= 0) {
                    blackBot.miser(i, new Number(blackBot.miseJoueurs[i])+new Number(miseActJoueur))
                    miseJoueurs[i] -= miseActJoueur
                    $('.miseJoueur'+i).text(blackBot.miseJoueurs[i])
                    actualiserJoueurs()
                    $('.tirage').removeAttr('disabled')
                }
            })

            /**
             * Action de tirer
             * Quand le joueur appuie sur tirer, on tire une carte et on actualise les cartes
             */
            $('.tirer'+i).attr('disabled', 'disabled').click(function() {
                blackBot.tirer(i)
                actualiserJoueurs()
                checkFinPartie()
            })

            /**
             * Action de stop
             * Quand le joueur appuie sur stop, on termine le joueur et on change de joueur actuel
             */
            $('.stop'+i).attr('disabled', 'disabled').click(function() {
                blackBot.terminer(i)
                joueurActuel++
                actualiserJoueurs()
                checkFinPartie()
            })

        }
        //Zone de gestion des joueurs
        console.log(miseNouveJoueur);
        miseJoueurs.push(miseNouveJoueur)
        ajoutGestionJoueurs()
    }

    /**
     * Ajoute la partie de gestion des joueurs
     * Ajoute les boutons + et -
     */
    function ajoutGestionJoueurs() {
        $zoneJoueurs.append('<div class="butGestJoueurs"></div>')
        //On peut avoir 7 joueurs max et pas moin de 0 joueurs
        if (nbJoueurs <= 6) {
            $('.butGestJoueurs').append('<div class="gestAdd">' +
                                        '<button class="addJoueur">+</button>' +
                                        '<input type="text" placeholder="Mise" class="miseNouvJoueur"/>' +
                                        //Tooltip pour la mise minimum
                                        '<div class="tooltip">?<span class="tooltipText">Mise minimum supérieure à 0</span></div></div>')
        }
        if (nbJoueurs > 0) {
            $('.butGestJoueurs').append('<button class="removeJoueur">-</button>')
        }

        /**
         * Action d'ajout
         * Quand on clique sur +, on ajoute un joueur et on actualise les joueurs
         */
         $('.addJoueur').click(function(){
            if($('.miseNouvJoueur').val() > 0){
                nbJoueurs++
                blackBot = new BlackBot(nbJoueurs)
                miseNouveJoueur = $('.miseNouvJoueur').val()
                ajoutJoueurs()
                actualiserJoueurs()
            }
        })

        /**
         * Action de retrait
         * Quand on clique sur -, on retire un joueur et on actualise les joueurs
         */
        $('.removeJoueur').click(function(){
            nbJoueurs--
            blackBot = new BlackBot(nbJoueurs)
            ajoutJoueurs()
            actualiserJoueurs()
        })
    }

    /**
     * Actualisation des joueurs
     * Parcours de l'ensemble des joueurs et mise a jour des cartes et scores. n fait la vérification des boutons du joueurs
     * Atualisation des cartes et score du croupier
     */
    function actualiserJoueurs() {
        for (let i = 0; i < nbJoueurs; i++) {
            actualiserCartesJoueur(i)
            $('.miseJoueur'+i).html("Mise : " + blackBot.miseJoueurs[i])
            $('.scoreJoueur'+i).html("Score : " + blackBot.mainJoueurs[i].getScore())
            $('.argent'+i).html("Argent : "+miseJoueurs[i])
            if (joueurActuel === i) {
                if (blackBot.finJoueurs[i] === true) {
                    joueurActuel++
                } else {
                    $('.tirer'+i).removeAttr('disabled')
                    $('.stop'+i).removeAttr('disabled')
                }
            } else {
                $('.tirer'+i).attr('disabled', 'disabled')
                $('.stop'+i).attr('disabled', 'disabled')
            }
            if (blackBot.etat === EtatBlackBot.GAIN
                || blackBot.finJoueurs[i] === true) {
                $('.miser'+i).attr('disabled', 'disabled')
                $('.tirer'+i).attr('disabled', 'disabled')
                $('.stop'+i).attr('disabled', 'disabled')
            }
        }
        actualiserCartesBanque()
        $('.scoreCroupier').text("Score : " + blackBot.mainBanque.getScore())
        if (blackBot.etat === EtatBlackBot.GAIN) {
            $('.recommencer').removeAttr('disabled')
        } else {
            $('.recommencer').attr('disabled', 'disabled')
        }
    }

    /**
     * Passage en mode jeu
     * Desactivation du bouton miser pour tous les joueurs et activation des boutons tirer et stop si le joueur a une mise
     * Desactivation des boutons tirage, + et -
     */
    function passageJeu(){
        for (let i = 0; i < nbJoueurs; i++) {
            if (blackBot.miseJoueurs[i] > 0){
                $('.miser'+i).attr('disabled', 'disabled')
                if(joueurActuel === -1) {
                    joueurActuel = i
                }
            } else {
                $('.miser'+i).attr('disabled', 'disabled')
                $('.tirer'+i).attr('disabled', 'disabled')
                $('.stop'+i).attr('disabled', 'disabled')
            }
        }
        $('.tirer'+joueurActuel).attr('disabled',false)
        $('.stop'+joueurActuel).removeAttr('disabled')

        $('.tirage').attr('disabled', 'disabled')
        $('.addJoueur').attr('disabled', 'disabled')
        $('.removeJoueur').attr('disabled', 'disabled')
    }

    /**
     * Passage en mode mise
     * Parcours des joueurs et desaction des boutons tirer et stop puis activation du bouton miser
     */
    function passageMise() {
        for (let i = 0; i < nbJoueurs; i++) {
            $('.miser'+i).removeAttr('disabled')
            $('.tirer'+i).attr('disabled', 'disabled')
            $('.stop'+i).attr('disabled', 'disabled')
        }
        $('.addJoueur').removeAttr('disabled')
        $('.removeJoueur').removeAttr('disabled')
    }

    /**
     * Vérification de la fin de partie
     * Vérification des score des joueurs et du croupier pourtrouver le joueur ayant gagné
     * @returns {boolean} true si la partie est finie
     */
    function checkFinPartie() {
        for (let i = 0; i < blackBot.finJoueurs.length; i++) {
            if (blackBot.finJoueurs[i] === false) {return}
        }
        let meilleurScore = 0
        let indMeilleurScore = -1
        for (let i = 0; i < blackBot.mainJoueurs.length; i++) {
            if (blackBot.mainJoueurs[i].getScore() > meilleurScore &&
                blackBot.mainJoueurs[i].getScore() <= 21) {
                    meilleurScore = blackBot.mainJoueurs[i].getScore();
                    indMeilleurScore = i
            }
            miseJoueurs[i] += blackBot.miseJoueurs[i]
        }
        if (meilleurScore < blackBot.mainBanque.getScore() &&
            blackBot.mainBanque.getScore() <= 21) {
                meilleurScore = 0
        }
        if (meilleurScore === 0) {
            //Banquier gagne
            afficherMessage("Le croupier à gagné !")
        } else {
            //Joueur gagne
            afficherMessage("Le joueur " + indMeilleurScore + " à gagné !")
        }
    }

    /**
     * Affichage d'un message
     */
    function afficherMessage(message) {
        $('.message').html(message)
    }

    /**
     * Actualisation des cartes d'un joueur
     * @param {int} indJoueur Indice du joueur nécéssitant une actualisation des cartes
     */
    function actualiserCartesJoueur(indJoueur){
        $('.cartes'+indJoueur).empty()
        for (let i = 0; i < blackBot.mainJoueurs[indJoueur].getNbCartes(); i++){
            let carteAct = blackBot.mainJoueurs[indJoueur].cartes[i]
            $(".cartes"+indJoueur).append('<img src="resources/Cartes/' + NomCarte[carteAct.hauteur]+'_'+CouleurCarte[carteAct.couleur]+'.png" width="100" height="180"></img>')
        }
    }

    /**
     * Actualisation des cartes du croupier
     */
    function actualiserCartesBanque(){
        $(".carteBanque").empty()
        for (let i = 0; i < blackBot.mainBanque.getNbCartes(); i++){
            let carteAct = blackBot.mainBanque.cartes[i]
            $(".carteBanque").append('<img src="resources/Cartes/' + NomCarte[carteAct.hauteur]+'_'+CouleurCarte[carteAct.couleur]+'.png" width="100" height="180"></img>')
        }
    }
})