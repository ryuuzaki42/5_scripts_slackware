#!/bin/bash
echo "Script para iniciar VMWARE"
echo -e "(i)niciar \n(p)arar \n(s)tatus \n(n)ada \n"
read resposta
if [ $resposta = i ] 
then
su root -c "sh /etc/rc.d/init.d/vmware start"
fi
if [ $resposta = p ] 
then
su root -c "sh /etc/rc.d/init.d/vmware stop"
fi
if [ $resposta = s ] 
then
su root -c "sh /etc/rc.d/init.d/vmware status"
fi
if [ $resposta = n ] 
then
exit 0
fi
echo -e "fim do script \n"