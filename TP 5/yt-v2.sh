#/bin/bash
#Kevin
#04/03/2024

while true; do 

 file="/srv/yt/toDownload"
    while IFS= read -r line
    do
    if [[ $line =~ ^https:\/\/www\.youtube\.com\/watch\?v=[a-zA-Z0-9]{11}$ ]]; then
        
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
    fi
    sed -i '1d' $file
    done < "$file"
    sleep 10
done