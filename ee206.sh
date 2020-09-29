#Name: Patrick Durojaiye Student Number: 18321093

#! /bin/bash


options=$(getopt -o "hi:o:" -l "help output: pagesize:" -- "$@") 

	#creates an options for user to choose from 

[ $? -eq 0 ] || {

	echo "$(tput setaf 1) $(tput setab  7)Parameter invalid"	

	#if user inputs an option that wasn't given a text is outputed to the screen showing an invalid parameter was imputed 	
	
	exit 1

} 

eval set -- "$options"

while true 
do 

	case $1 in    

	#the different options for which a user can input is given
	
	-h|--help)  

  	#prints out how to use programme

		echo "$(tput setaf 1) $(tput setab  7)
 		      This is a programme to download any RFC as a text file and to convert to a pdf

                      1: Give a numerical value of the rfc you want for output
		      2: Input the rfc you want to save as a text file
		      3: Inout the rfc number being converted"
		exit 0
		;;

	-o|--output)
		shift

 	#shifts the case to the next one

		input_file=$1
		echo "$(tput setaf 1) $(tput setab  7)Output file: $1"

 	#displays what the output file is gonna be 
	
		;;

	-p|--pagesize)
		shift 
		

		url="https://www.rfc-editor.org/rfc/rfc$1.txt"

 	#url link of rfc asked to get

		curl ${url} > rfc$1.txt 

 	#saves the url file as text file 

		~/text2pdf/text2pdf -A4 rfc$1.txt>rfc$1.pdf   

	#converts text file to pdf by calling the c code used to convert text to pdf

		echo "$(tput setaf 1) $(tput setab  7)rfc$1.txt has been converted into a pdf called rfc$1.pdf" #prints task done to screen
		;;
	--)
		shift 
	break
	esac
	shift
done

