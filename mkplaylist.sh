# Make script to make playlists
#!/bin/bash
for i in ./
do ls -1 "$i"*.flac #> "$i"/playlist.m3u
done
exit
