#!/bin/bash
#################################################################################
# Script to convert M4A to FLAC, OGG, and MP3 VBR                                #
#                                                                                #
# Author: Michael SanAngelo (msanangelo@gmail.com                                #
#                                                                                #
# Requires: avconv, lame, vorbis-tools, glyrc, flac2all.py                       #
#                                                                                #
# https://raw.githubusercontent.com/ZivaVatra/flac2all/master/stable/flac2all.py #
##################################################################################

ARTIST="$1"
ALBUM="$2"
ARTIST_ALBUM=""$1" - "$2""

mkdir {flac,ogg,mp3}/"$ARTIST_ALBUM";
cd flac/"$ARTIST_ALBUM";

for file in ../../Apple_Lossless/"$ARTIST"/"$ALBUM"/*.m4a;
do avconv -i "$file" -f flac "`basename "$file" .m4a`.flac";
done

flac2all.py mp3 ./ -o ../../mp3/"$ARTIST_ALBUM"/ -n -v "V 2" "$3";

flac2all.py vorbis ./ -o ../../ogg/"$ARTIST_ALBUM"/ -n -v "quality=6" "$3";

glyrc cover --artist '"'"$1"'"' --album '"'"$2"'"' -w cover.png

cp cover.png ../../mp3/"$ARTIST_ALBUM"/
cp cover.png ../../ogg/"$ARTIST_ALBUM"/
ls -1 *.flac > "$ALBUM".m3u
cd ../../ogg/"$ARTIST_ALBUM"
ls -1 *.ogg > "$ALBUM".m3u
cd ../../mp3/"$ARTIST_ALBUM"
ls -1 *.mp3 > "$ALBUM".m3u
cd ../../
