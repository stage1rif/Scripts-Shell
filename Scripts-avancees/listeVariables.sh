#!/bin/bash
      cpt=1
       echo "Utilisation de la variable \$*"
       for arg in $*
       do
               echo "Argument $cpt : $arg"
               ((cpt+=1))
      done
      cpt=1
      echo "Utilisation de la variable \$@"
      for arg in $@
      do
              echo "Argument $cpt : $arg"
            ((cpt+=1))
    done
  exit 0
	
