#!/bin/bash
ARTIST="$1";
ALBUM="$2";
ARTIST_ALBUM="'"$1"' - '"$2"'";
#glyrc cover --artist '"$ARTIST"' --album '"$ALBUM"' -w flac/"$ARTIST_ALBUM"/cover.png;
cp flac/"$ARTIST_ALBUM"/cover.png mp3/"$ARTIST_ALBUM";
cp flac/"$ARTIST_ALBUM"/cover.png ogg/"$ARTIST_ALBUM";
exit
