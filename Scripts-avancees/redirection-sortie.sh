#!/bin/bash
	   #Redirection de la sortie standard et de la sortie d'erreur standard vers le fichier /tmp/fichier3.log
	   #(commande non executable ou mal expliqué)
       exec 1> tmp/fichier3.log 2>&1
       echo "Début du traitement : $(date)"
       ls
       cp *.zzz tmp
       rm *.zzz
       sleep 5
       echo "Fin du traitement : $(date)"
       exit 0
