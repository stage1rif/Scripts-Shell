#!/bin/bash
#Comme n'importe quelle commande renvoyant un résultat, 
#une fonction peut également être placée à l'intérieur de caractères de substitution de commande `` ou $( ).
       
 
       function getUid {
               grep "^$1:" /etc/passwd | cut -d':' -f3
       }
 
       # Initialisation de la variable globale uid
       uid=""
 
       # Appel de la fonction getUid avec l'argument du programme principal
       # Juste pour l'affichage
       getUid $1
 
      # Affectation du résultat de la fonction getUid à la variable uid
      uid=$(getUid $1)
 
      if [[ $uid != "" ]]
      then
              echo "L'utilisateur $1 a pour UID : $uid"
      else
              echo "L'utilisateur $1 n'existe pas"
      fi
 
      exit 0