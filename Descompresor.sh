
function Decompresor() {
	declare ruta="$1"
	echo $ruta
	cd $ruta	
	declare nombre=$(basename $(pwd))
	for file in *
	do
		if [[ -f $file ]] && [[ $file == "$nombre.tar" ]] 
		then

			tar  -xvf "$nombre.tar" 
		else 
			if [[ -d $file ]] && [[ ! $file =~ ".*" ]]
			then
				Decompresor $file
				cd ..
		
			fi
		fi
	done
 }

Decompresor "$1"

