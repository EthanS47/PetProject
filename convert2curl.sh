#use ! as delimiters instead of / (s/// --> s!!!)
#add curl..." to the beginning of every other line starting on line 2
sed '2~2s!^!curl -X POST --data "!' dfpetwRef.fasta> temp1.out

#append the rest of curl command to the end of every other line starting on line 2
sed '2~2s!$!" https://api.esmatlas.com/foldSequence/v1/pdb/ > !' temp1.out > temp2.out

#change > at the beginning of line to # (comment out the Target ID line)
sed 's!^>!#!' temp2.out > temp3.out

#append the output file name to the end using part of the Targetc ID as the file name
sed '{N; s!^#\(.*\)|\(.*\).\(.*\)>!#\1|\2\3 >\1\.pdb\n\n sleep 3!}' temp3.out > curl_scriptR.sh

#add executeable permission 
chmod +x curl_scriptR.sh

#cleaning up temp files
#rm temp1.out
#rm temp2.out
#rm temp3.out

#  move the shell script to another directory (output file will be created there when running the script
#  ./scul_script.sh
