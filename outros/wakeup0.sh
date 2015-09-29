#!/bin/bash
horainicial=`date +%H` #Pegando hora atual 0-23
minutoinicial=`date +%M` #Pegando minutos atual 0-59

#para teste
#horainicial=23
#minutoinicial=37

echo "Em qual hora quer levantar?"
read horalevantar 
echo "Em qual minuto quer levantar?"
read minutolevantar 

if [ $horainicial -gt $horalevantar ] #hora inicial maior que hora de levantar
then
  horafinal=$((24 - $horainicial + $horalevantar)) 
else
 horafinal=$(($horalevantar - $horainicial))   
fi 

if [ $minutoinicial -gt $minutolevantar ] #minuto inicial maior que o final
then
  minutofinal=$((60 - $minutoinicial + $minutolevantar))
  horafinal=$(($horafinal-1))
else
   minutofinal=$(($minutolevantar - $minutoinicial))
fi

if [ $horafinal -eq -1 ]
then
    horafinal=23
fi

clear
echo "#Inicial== $horainicial:$minutoinicial"
echo "#Levantar= $horalevantar:$minutolevantar"
echo -e "#Final==== $horafinal:$minutofinal\n"

if [ $horafinal != 0 ] 
then  
   echo -e "Podera dormir $horafinal:$minutofinal, bom descanso :)\n"
   sleep "$horafinal"h "$minutofinal"m
else
   echo -e "Podera dormir só $minutofinal minutos, :\ \n" 
   sleep "$minutofinal"m
fi

horainicial=`date +%k` #Pegando hora atual 0-23
minutoinicial=`date +%M` #Pegando minutos atual 0-59
echo -e "Hora atual $horainicial:$minutoinicial\n"

aumix -v 100 #aumentar volume do canal master
aumix -p 100 #aumentar volume do canal pcm
vlc -Z /media/sda1/videos/* # reproduzir aleatoriamente o conteúdo da pasta /media/files/videos