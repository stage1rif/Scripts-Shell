#!/bin/bash
 	for fichier in `ls`
 	do
      	if [[ -f fichier ]]
 	    	then
 	             	echo "$fichier"
 	     	fi
 	done