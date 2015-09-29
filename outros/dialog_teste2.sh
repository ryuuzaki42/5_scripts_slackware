#!/bin/bash
operador=`kdialog --yesno "vc esta certo disso joão?"`
if [ $? = "0" ]; then 
kdialog --msgbox "parabens vc foi em sim" 
else 
kdialog --msgbox "hoo que pena" 
fi
kdialog --passivepopup "ok vc venceu!" 3
exit 0
