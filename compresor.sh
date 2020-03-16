function compresor() {
	declare ruta="$1"
	echo $ruta
	cd $ruta	
	declare nombre=$(basename $(pwd))
	for file in *
	do
		if [[ -f $file ]] 
		then

			tar --remove-files -rvf "$nombre.tar" "$file"
		else 
			if [[ -d $file ]] && [[ ! $file =~ ".*" ]]
			then
				compresor $file
				cd ..
		
			fi
		fi
	done
 }

compresor "$1"

