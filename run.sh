echo 'START' >> time.txt
date >> time.txt
./../rins/rins.pl -c ../config.txt -o result.txt
echo 'END' >> time.txt
date >> time.txt