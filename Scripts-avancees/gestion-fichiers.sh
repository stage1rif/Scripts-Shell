       #!/bin/bash
       # Ouverture du fichier /etc/passwd en lecture sous le descripteur 3
       # et du fichier /tmp/resultat.log en écriture sous le descripteur 4
       exec 3</etc/passwd 4>/tmp/resultat.log
       cpt=1
       # Lecture ligne par ligne du fichier /etc/passwd
       # correspondant au descripteur 3
       while read -u3 ligne
       do
              # Ecriture des données dans le fichier /tmp/resultat.log
              # correspondant au descripteur 4
              echo "Ecriture de la ligne $cpt" >&4
              echo $ligne >&4
              ((cpt+=1))
      done
      # Fermeture du fichier /etc/passwd correspondant au descripteur 3
      exec 3<&-
      # Fermeture du fichier /tmp/resultat.log correspondant au descripteur 4
      exec 4>&-
      exit 0

