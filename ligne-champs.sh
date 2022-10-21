
       #!/bin/bash
	   #Découper une ligne en champs
	   #Le script suivant génère, à partir du fichier /etc/passwd, un affichage à l'écran du username suivi de son uid.
       if (( $# != 1 ))
       then
               echo "Mauvais nombre d'arguments"
               echo "Usage : $0 fichier"
               exit 1
       fi
       if [[ ( ! -f "$1" ) || ( ! -r "$1" ) ]]
       then
              echo "$1 n'est pas un fichier ordinaire ou n'est pas accessible en lecture"
              exit 2
      fi
      oldIFS="$IFS"
      IFS=":"
      while read username password uid gid nomComplet home shell
      do
              echo "$username ==> $uid"
      done < $1
      IFS="$oldIFS"
      exit 0