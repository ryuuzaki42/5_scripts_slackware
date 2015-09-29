#!/bin/bash
dialog --yesno "vc esta certo disso?" 220 200
if [ $? = "0" ]; then 
dialog --msgbox "parabens vc foi em sim" 220 200 
else 
dialog --msgbox "hoo que pena" 220 200 
fi
exit 0
