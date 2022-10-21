 #!/bin/bash
 # uploadBackup.sh
 # set -x
 # Répertoire des scripts shell
 SCRIPTDIR="/root/script_archivage_incremental"
 # Répertoire des fichiers à sauvegarder
 DATADIR="/root/dossier_a_sauvegarder"
 # Répertoire local des archives
 ARCHIVEDIR="/root/local_backup"
 # Inclure les fonctions
 . $SCRIPTDIR/fonctions.inc.sh
 # Fichier de log
 LOG=$ARCHIVEDIR/`getDate`.log
 # Redirection de toutes les sorties du script vers le fichier de log
 exec 1>$LOG 2>&1
 # Déterminer le niveau de sauvegarde
 # Le 1er du mois => niveau 0
 jourDuMois=`getDayForCalcul`
 ((niveau=$jourDuMois-1))
 case $niveau in
     	0) # Sauvegarde totale
             	# Nettoyage du répertoire d'archive
             	rm -i $ARCHIVEDIR/*.bz2 $ARCHIVEDIR/niveau*
             	# Création du fichier de niveau (niveau 0)
             	touch $ARCHIVEDIR/niveau0
             	archive="$ARCHIVEDIR/`getDate`_niveau0.cpio"
             	find $DATADIR | cpio -ocv | bzip2 -c > $archive.bz2
             	;;
     	*)
             	# Creation du fichier de niveau
             	touch $ARCHIVEDIR/niveau$niveau
             	archive="$ARCHIVEDIR/`getDate`_niveau${niveau}.cpio"
             	# Determination du niveau precedent
             	((niveauPrec=$niveau-1))
             	# Test si le fichier de niveau precedent existe
             	if [[ ! -f $ARCHIVEDIR/niveau$niveauPrec ]]
             	then
                     	# Si il n'existe pas, sauvegarde integrale du repertoire
                     	echo "Fichier de niveau $niveauPrec inexistant"
                     	echo "Execution d'une sauvegarde integrale en cours de mois"
                     	find $DATADIR | cpio -ocv | bzip2 -c > $archive.bz2
             	else
                     	# Sauvegarde incrementale
                     	find $DATADIR -newer $ARCHIVEDIR/niveau$niveauPrec | cpio -ocv | bzip2 -c > $archive.bz2
             	fi
             	;;
 esac
 # Vérification de la validité de l'archive
 if isArchiveInvalide $archive.bz2 ; then
     	echo "Archive $archive.bz2 INVALIDE - Fichier non transfere"
     	exit 1
 fi
 # Transfert du fichier vers le serveur de sauvegarde
 if transfert ${archive}.bz2 ; then
     	echo "Transfert realise avec succes"
     	exit 0
 fi
 # Si le transfert a echoue
 echo "Echec de transfert"
 exit 1