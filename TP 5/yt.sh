#/bin/bash
#Kevin
#04/03/2024

if [ ! -d "/srv/yt/downloads/" ]; then
    exit 1
fi 

if [ ! -d "/var/log/yt/" ]; then
    exit 1
fi

video_name=$(youtube-dl --get-title "$1"
mkdir -p "/srv/yt/downloads/$video_name"
youtube-dl -o "/srv/yt/downloads/$video_name/$video_name.mp4" "$1"
youtube-dl --write-description -o "/srv/yt/downloads/$video_name/description" "$1"
echo "Video $1 was downloaded."
echo "File path : /srv/yt/downloads/$video_name/$video_name.mp4"
date=$(date +'%Y/%m/%d %H:%M:%S')
echo "[$date] Video $1 was downloaded. File path : /srv/yt/downloads/$video_name/$video_name.mp4" >> /var/log/yt/download.log
