# Feinstaub-Map_Capture
Small scripts to periodically capture screenshots from http://deutschland.maps.luftdaten.info

## Files:
the file [rasterize.js](rasterize.js) does the magic of taking the screenshots. It is taken from http://phantomjs.org/screen-capture.html


the file [grabLuftdaten_pub.sh](grabLuftdaten_pub.sh) is the file that i called from my crontab on a regular basis. It made the screenshot and then uploaded the files from my raspberry pi to a server using scp.


the file [CreateLuftBildMovie_pub.sh](CreateLuftBildMovie_pub.sh) converts all jpegs with the same prefix into a small movie. Stept one it copies the files and renames them with a ordering number. Then the jpegs are compined to a mpeg with ffmpeg. Finally the created jpegs are deleted again. I used 8 frames a second in my latest film.

__Will be updated during the next couple of days__
