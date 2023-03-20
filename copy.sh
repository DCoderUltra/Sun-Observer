# Time Control

past=24;
rm -rf last$past/
mkdir last$past/

day=$((($(date "+%d"))))
month=$((($(date "+%m"))))
year=$((($(date "+%Y"))))

now=$(date "+%s") #determine seconds until now
secN=$(date --date="@$now" "+%-S") # (0..59)
minN=$(date --date="@$now" "+%-M") # (0..59)
hourN=$(date --date="@$now" "+%-H") # (0..24)

yest=$(($now-$past*60*60))
yestD=$(($yest-$secN-$minN*60-$hourN*60*60))

nowF=$(date --date="@$now")
yestF=$(date --date="@$yest")
yestDF=$(date --date="@$yestD")

# Copying last past hours files
for d in $(seq $yest 3600 $now)
do
	date=$(date --date="@$d" "+%Y%m%d_%H")
	dateD=$(date --date="@$d" "+%d")
	dateM=$(date --date="@$d" "+%m")
	dateY=$(date --date="@$d" "+%Y")

	DIR="sdo.gsfc.nasa.gov/assets/img/browse/$dateY/$dateM/$dateD"
	for file in "$DIR"/$date*; do
		cp  $file last$past/
	done/
done


for len in $(cat lens.txt); do
	mkdir last$past/$len
	$ns="" # this is used to allow me to write * after the /
	DIR="last$past/"
	for file in "$DIR"/$ns*$len.jpg; do
		#echo $file
		mv  $file last$past/$len/
	done
done
