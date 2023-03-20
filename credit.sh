# Time Control
#rm -f last24/*jpg

#Image Editing
for folder in $(cat lens.txt)
do
for file in last24/$folder/*.jpg
do
	echo $file
	convert -font impact -fill white -pointsize 30 -gravity North -draw "text 10,10 'Courtesy of NASA/SDO and the AIA, EVE, and HMI science teams.'" $file $file
done
done
