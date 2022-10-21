#!/bin/bash
 #Appel d'une fonction
 #Une fonction peut être appelée aussi bien à partir du programme principal qu'à partir d'une autre fonction.
       fctn01 () {
               echo "Fonction fctn01"
       }
 
       function fctn02 {
               echo "Fonction fctn02"
       }
 
       echo "Début du programme principal"
       echo "Appel de la fonction fctn01"
      fctn01
      echo "Appel de la fonction fctn02"
     fctn02
     echo "Fin du programme principal"
     exit 0