# Time Control

# For each len
for len in $(cat lens.txt)
do
ns="" # this is used to allow me to write * after the /
	DIR="last24/$len"
	for dir in "$DIR" ; do
	 convert -loop 0 -delay 0 "$DIR"/* meta.gif
	 cp meta.gif gifs/sun$len.gif
	done
done
rm -f meta.gif
