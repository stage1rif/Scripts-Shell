#!/bin/bash
#Exemple d'un script reprenant toutes les commandes et fonctions vues précédement
       # Pour faire une pause
       function pause {
               echo "Appuyer sur Entrée pour continuer"
               read x
       }
 
       # Pour savoir si un utilisateur existe
       function existUser {
               grep -qi "^$1:" /etc/passwd && return 0
             return 1
      }
 
      # Pour connaitre l'uid de l'utilisateur
      function getUid {
              grep -i "^$1:" /etc/passwd | cut -d':' -f3
      }
 
      # Initialisation des variables globales
      uid=""
      user=""
      choix=""
 
      while true
      do
              clear
             echo "- 1 - Savoir si un utilisateur existe"
              echo "- 2 - Connaitre l'UID d'un utilisateur"
              echo "- 3 - Fin"
              echo -e "Votre choix : \c"
              read choix
 
              if [[ $choix = @(1|2) ]] ; then
                      echo -e "Saisir le nom d'un utilisateur : \c"
                      read user
              fi
 
              case $choix in
 
                      1)      if existUser $user ; then
                                      echo "L'utilisateur $user existe"
                              else
                                      echo "l'utilisateur $user n'existe pas"
                              fi
                              ;;
 
                      2)      if existUser $user ; then
                                      uid=$(getUid $user)
                                      echo "l'UID de l'utilisateur $user est : $uid"
                              else
                                      echo "L'utilisateur $user n'existe pas"
                              fi
                              ;;
 
                      3)      exit 0
                              ;;
              esac
              pause
      done
$