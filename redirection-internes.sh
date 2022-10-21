#!/bin/bash
#Redirections internes au script
exec <etc/passwd >tmp/resultat.log
cpt=1
while read ligne
do
	   echo "Ecriture de la ligne $cpt"
	   echo $ligne
	   ((cpt+=1))
done
exit 0


