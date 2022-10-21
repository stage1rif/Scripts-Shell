 #!/bin/bash
 #La commande interne exec permet de manipuler les descripteurs de fichier du shell courant.
#Utilisée à l'intérieur d'un script, elle permet de rediriger de manière globale les entrées/sorties de celui-ci.
#Redirection de la sortie standard vers /tmp/fichier1.log et redirection de la sortie d'erreur standard vers /tmp/fichier2.log.
       exec 1> tmp/fichier1.log 2> tmp/fichier2.log
       echo "Début du traitement : $(date)"
       ls
       cp *.zzz tmp
       rm *.zzz
       sleep 5
       echo "Fin du traitement : $(date)"
       exit 0