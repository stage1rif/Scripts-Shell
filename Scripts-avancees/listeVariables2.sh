       #!/bin/bash
#Les variables $* et $@ contiennent la liste des arguments d'un script shell.
#Lorsqu'elles ne sont pas entourées par des guillemets, elles sont équivalentes.
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
	
