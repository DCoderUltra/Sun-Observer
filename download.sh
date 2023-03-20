rm -rf last24/*jpg

# Time Control
day=$(date "+%02d")
month=$(date "+%02m")
year=$(date "+%Y")

# Dowwload
wget -N --no-parent -r --accept-regex ".*_1024_*" https://sdo.gsfc.nasa.gov/assets/img/browse/$year/$month/$day/
wget -N --no-parent -r --accept-regex ".*_1024_*" https://sdo.gsfc.nasa.gov/assets/img/browse/$year/$month/$(($day-1))/

# If you'd like a smaller image for storage saving change _1024_ to the desired size provided that is an available size on their site.

# There is still some fails downloading files from the first days because of the interpertation of the previous day (0d inseted o d).
