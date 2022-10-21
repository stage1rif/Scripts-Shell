#!/bin/bash
# fonctions.inc.sh
 function transfert {
     	typeset mois
     	typeset annee
     	# Recuperation de la valeur du premier argument passe a la fonction
     	# Recuperation du nom de l'archive a envoyer au serveur de sauvegarde
     	typeset ficATransferer=$1
     	# Adresse du serveur de sauvegarde
     	typeset serveur_sauvegarde="192.168.1.113"
     	# Compte utilise pour se connecter au serveur de sauvegarde
     	typeset user="root"
     	# Chemin absolu du dossier ou sera stocke la sauvegarde
     	typeset dossier_distant="/root/sauvegarde_dossier"
     	mois=`getMonth`
     	annee=`getYear`
     	# Test si le dossier de sauvegarde existe sur le serveur de sauvegarde
     	# Connexion au serveur avec le user root
     	ssh $user@$serveur_sauvegarde test -d $dossier_distant/$annee/$mois
     	# Test sur le code retour de la commande precedente
     	case $? in
             	0)
                     	;;
             	255)
                     	echo "Echec de la commande SSH"
                     	return 1
                     	;;
             	*)
                     	# Si code retour different de 0 et 255
                     	# Creation du repertoire de la sauvegarde
                     	ssh $user@$serveur_sauvegarde mkdir -p $dossier_distant/$annee/$mois
                     	;;
     	esac
     	# Connexion au serveur de sauvegarde en FTP sécurisé
     	# Ne pas oublier les doubles chevrons << avant le mot cle FIN
     	# Ne pas mettre d'espace entre << et FIN
     	sftp -b - $user@$serveur_sauvegarde <<FIN
# Positionnement dans le repertoire de la sauvegarde
     	cd $dossier_distant/$annee/$mois
     	pwd
# Envoi de la sauvegarde
     	put $ficATransferer
FIN
 # Ne pas mettre de tabulation ou d'espace devant le mot clé FIN
 # Sinon celui-ci n'est pas reconnu
 # Test sur le code retour de la commande SFTP
 # Si le code retour est different de 0
 # Une anomalie a ete rencontree
     	(( $? != 0 )) && return 1
     	# Tester si archive valide sur serveur de sauvegarde
     	ficSurMachineCible=$(basename $ficATransferer)
     	ssh $user@$serveur_sauvegarde bzip2 -t $dossier_distant/$annee/$mois/$ficSurMachineCible
     	case $? in
             	0)
                     	;;
             	255)
                     	echo "Echec de la commande SSH"
                     	return 1
                     	;;
             	*)
                     	# Si code retour different de 0 et 255
                     	# Alors l'archive est invalide
                     	echo "Archive $dossier_distant/$annee/$mois/$ficSurMachineCible INVALIDE"
                     	return 1
                     	;;
     	esac
     	return 0
 }
 function isArchiveInvalide {
     	typeset archive=$1
     	bzip2 -t $archive 2>/dev/null && return 1
     	return 0
 }
 function getDate {
     	date '+%Y_%m_%d'
 }
 function getYear {
     	date '+%Y'
 }
 function getMonth {
     	date '+%m'
 }
 function getDayForCalcul {
     	date '+%e' | sed 's/ //'
 }