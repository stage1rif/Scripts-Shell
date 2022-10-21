#!/bin/bash
#Dans un script shell, il est tout à fait possible de passer des arguments
# à une fonction étant donné qu'une fonction est 
# reconnue par le shell comme étant une commande à part entière.
       function f1 {
               echo "Arguments de la fonction f1 :"
               echo "\$0 => $0"
               echo "\$1 => $1"
               echo "\$2 => $2"
               echo "\$3 => $3"
               echo "\$* => $*"
              echo "\$# => $#"
      }
 
      function f2 {
              echo "Arguments de la fonction f2 :"
              echo "\$0 => $0"
              echo "\$1 => $1"
              echo "\$2 => $2"
              echo "\$3 => $3"
              echo "\$* => $*"
              echo "\$# => $#"
      }
 
      function f3 {
              echo "Arguments de la fonction f3 :"
              echo "\$0 => $0"
              echo "\$1 => $1"
              echo "\$2 => $2"
              echo "\$3 => $3"
              echo "\$* => $*"
              echo "\$# => $#"
      }
 
      echo "Arguments du programme principal :"
      echo "\$0 => $0"
      echo "\$1 => $1"
      echo "\$2 => $2"
      echo "\$3 => $3"
      echo "\$* => $*"
      echo "\$# => $#"
 
      # Appel de la fonction f1 avec 3 arguments
      f1 a b c
 
      # Appel de la fonction f2 avec 3 arguments
      f2 file.c 2000 500
 
      # Appel de la fonction f3 avec 2 arguments provenant du programme principal
      f3 $2 $3
 
      exit 0