#!/bin/bash
echo "Script de serviços do virtualbox"
echo -e "(i)niciar \n(p)arar \n(s)tatus \n(n)ada \n"
read resposta
if [ $resposta = i ] 
then
su root -c "sh /etc/rc.d/rc.vboxdrv start"
fi
if [ $resposta = p ] 
then
su root -c "sh /etc/rc.d/rc.vboxdrv stop"
fi
if [ $resposta = s ] 
then
sh /etc/rc.d/rc.vboxdrv status
fi
if [ $resposta = n ] 
then
exit 0
fi
echo -e "fim do script \n"