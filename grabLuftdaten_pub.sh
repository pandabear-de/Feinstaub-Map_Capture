#!/bin/bash
QT_QPA_PLATFORM=offscreen /usr/bin/phantomjs /usr/local/bin/rasterize.js http://www.deutschland.maps.luftdaten.info/#6/50.1/8.1 /home/pi/LuftdatenMap/Luftdaten_D_1600x1200__`date '+%Y%m%d_%H%M%S'`.jpg 1600px*1200px

/usr/bin/logger --tag Luftdaten Screenshots taken
scp -i /home/pi/.ssh/kontent_com /home/pi/LuftdatenMap/*  userxy@ssh.yourserver.org:/WWW/htdocs
if [ $? -eq 0 ];
then
    rm /home/pi/LuftdatenMap/*
    /usr/bin/logger --tag Luftdaten Screenshots  uploaded
    #curl -s -X POST https://api.telegram.org/bot1234:ABCD/sendMessage -d chat_id=1234 -d text="Luftdaten uploaded"
else
    /usr/bin/logger --tag Luftdaten Screenshots  upload failed
    curl -s -X POST https://api.telegram.org/bot1234:ABCD/sendMessage -d chat_id=1234 -d  text="Luftdaten upload failed"
fi