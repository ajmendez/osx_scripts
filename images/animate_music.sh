FFMPEG=/Volumes/ffmpegX_0.0.9y-L/ffmpegX.app/Contents/Resources/ffmpeg

# cnc Music Combination
# ${FFMPEG} -i cnc.mov -i cnc_music.mp3 -map 0:0 -map 1:0 \
	   # -acodec copy -vcodec copy -ab 128k -ar 44100 cncMusic.mov  
# # Geiger Music
${FFMPEG} -i geiger2.mov -i geigerMusic.mp3 -map 0:0 -map 1:0 \
	   -acodec copy -vcodec copy -ab 128k -ar 44100 geiger.mov  
