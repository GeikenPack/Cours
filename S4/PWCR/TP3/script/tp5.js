/*
 *	TP 5 : �v�nements Tableaux et Onglets
*/

// Au chargement de la page 

$(document).ready(function(){
	$('table').css("display", "none");
		/*
			EXEMPLE 
			Classe "active" sur les items cliqu�s dans le menu par onglet
		*/	
		// Variables contenant l'ensemble des liens du menu par onglet :
		var $ongletItems = $(".onglets a");
		// Fonction d�clench�es quand on clique sur l'un de ces items
		$ongletItems.click(function(){	
			// On enl�ve la classe sur tous les items
			$ongletItems.removeClass("active");	
			// On met la classe active sur l'item qui a �t� cliqu�
			$(this).addClass("active");
			$('table').css("display", "none");
			let tab = $(this).attr('href');
			$(tab).css("display", "block")
			// Annule l'action par d�faut (soit le d�placement du focus sur l'ancre correspondant � ce lien)
			return false;
		});
		/*
			EXERCICE 2
			Dans le conteneur (�div#conteneur�), ajouter l'�l�ment suivant :
			<div id="loupe"></div>
			Masqu� par d�faut, cet �l�ment appara�t quand on survole une cellule. Il affiche alors le contenu de la cellule.
		*/
			$conteneur = $('#conteneur')
			$conteneur.append("<div id='loupe'></div>")

			$loupe = $("#loupe")
			$cellule = $('td')
			$cellule.mouseover(function() {
				$loupe.text($(this).html())
				$colonne = $(this).attr('headers')
				$('td[headers=' + $colonne + ']').addClass('on');
				$idLigne = $(this).closest('tr').attr('id')
				$('#' + $idLigne + ' td').addClass('on')
				$(this).addClass('active')
			})

			$cellule.mouseleave(function() {
				$loupe.text('')
				$colonne = $(this).attr('headers')
				$('td[headers=' + $colonne + ']').removeClass('on');
				$idLigne = $(this).closest('tr').attr('id')
				$('#' + $idLigne + ' td').removeClass('on')
				$(this).removeClass('active')
			})
			
		/*
			EXERCICE 3
			Quand une cellule est survol�e, les cellules de la m�me ligne et de la m�me colonne prennent la classe on.
			La cellule survol�e prend la classe active.
			Astuce :
			Dans cette page, on peut retrouver les cellules d'une m�me colonne gr�ce � leur attribut "headers". 
			En effet, sa valeur est l'identifiant de la t�te de la colonne.
			Si vous ne l'avez pas fait avant, regardez �galement la documentation de parents(), find() et filter()
		*/	

});	// Fin des instructions envoy�es au chargement de la page
