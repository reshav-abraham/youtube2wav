#!/bin/bash
#call python script to produce text file of video links and titles
#iterate through links and call js program with link as arg
while IFS= read -r line; do
    #echo "Text read from file: $line"
    #split text
    title="$(cut -d'|' -f2 <<< $line)" 
    link="$(cut -d'|' -f1 <<< $line)"
    echo $link
    node script.js $link $title 
    #ffmpeg -i "audioData/$title.mp4" -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 "wavfiles/audio.mp3"
    ffmpeg -i "audioData/$title.mp4" -vn -acodec pcm_s16le -ar 44100 -ac 2 "wavfiles/$title.wav"
    #pass arguments to js code
    #get mp4 then convert to wav

done < "links_titles.txt"
#iterate through videos and use ffmpeg to conver to wav
#write to output directory
#ffmpeg -i video.mp4 -vn -acodec libmp3lame -ac 2 -ab 160k -ar 48000 audio.mp3