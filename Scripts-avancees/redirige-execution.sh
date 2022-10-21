 
       #!/bin/bash
	   #Rediriger l'exécution du script
#Les redirections peuvent également être faites au moment de l'exécution du script.


       cpt=1
       # Lecture ligne par ligne du fichier passé en paramètre
       # ou lecture de la saisie clavier si pas de fichier en paramètre
       while read ligne
       do
               # Ecriture des données dans le fichier passé en paramètre
               # ou affichage à l'écran si pas de fichier en paramètre
               echo "Ecriture de la ligne $cpt"
             echo $ligne
             ((cpt+=1))
      done
      exit 0
