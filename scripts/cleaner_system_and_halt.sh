#! /bin/bash
user_current=`whoami`
if [ $user_current = root ]
 then
 echo -e "\t\terro, execute como usuário comum!\n"
 exit 0
fi
echo "Este script(para slackware) vai Limpar o seu sistema e Desligar!"
echo "Necessário ter bleachbit instalado e configurado."
echo "Irá executar o bleachbit como root e como usuário corrente."
echo "Além de apagar algumas pastas e arquivos."
echo "Usuário corrente:$user_current"
echo "Comandos a serem executados:"
echo "'su - root -c su - $user_current -c \"bleachbit -c --preset\""
echo "bleachbit -c --preset"
echo "rm -rfv /tmp/*"
echo "rm -rfv /tmp/.*"
echo "rm -rfv /var/tmp/*"
echo "rm -rfv /var/tmp/.*"
#echo "rm /home/$user_current/.bash_history"
#echo "rm /root/.bash_history"
echo "halt'"
echo -e "   Deseja continuar \n   (y)es \n   (n)o!"
read resposta
if [ $resposta = y ]
  then
  echo -e "Digite a senha do usuário root"
  su - root -c 'su - $user_current -c "bleachbit -c --preset"
  bleachbit -c --preset
  rm -rfv /tmp/*
  rm -rfv /tmp/.*
  rm -rfv /var/tmp/*
  rm -rfv /var/tmp/.*
  echo "halt"
  halt'
  #rm /home/'$user_current'/.bash_history
  #rm /root/.bash_history  
fi
if [ $resposta = n ] 
  then
  echo -e "fim do script \n"
  exit 0
fi
