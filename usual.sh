#! /bin/bash
#echo $# Quantidade de parâmetros
echo -e "\nscript para coisas do dia a dia\n"
if [ $# -lt 1 ]
 then
 echo "$(basename "$0"): erro de operandos"
 echo "tente $0 opcao para ver todas opções\n"
 exit 0;
fi
opcao="$1"
#0
if [ $opcao = opcao ]
 then
 echo "1 data - atualizar a data"
 echo "2 vpnc - conectar na vpn da USP"
 echo "3 vpnd - desconectar da vpn"
 echo "3 swap - limpar o swap"
 echo "4 pdf - reduzir pdf"
 echo "5 slack-up - slack update"
 echo # -> "\n"
#1
elif [ $opcao = data ]
 then
 echo -e "atualizar a data\n"
 su - root -c 'ntpdate -u -b ntp1.ptb.de'
#2
elif [ $opcao = vpnc ]
 then
 echo -e "conectar na vpn da USP\n"
 su - root -c 'vpnc /etc/vpnc/usp.conf'
#3
elif [ $opcao = vpnd ]
 then
 echo -e "desconectar da vpn\n"
 su - root -c 'vpnc-disconnect'
#4
elif [ $opcao = swap ]
 then
 echo -e "swap off e on\n"
 su - root -c 'swapoff -a
 swapon -a'
#5
elif [ $opcao = pdf ]
 then
 echo -e "Reduzir pdf\n"
 if [ $# -eq 1 ]
  then
  echo -e "Erro, utilize $0 pdf arquivo.pdf\n"
 else
  arquivo="$2"
  gs -sDEVICE=pdfwrite -dNOPAUSE -dBATCH -sOutputFile="$arquivo"-r.pdf "$arquivo"
 fi
#6
elif [ $opcao = slack-up ] 
 then
 echo -e "slack update\n"
 su - root -c '
 slackpkg update gpg
 slackpkg update
 slackpkg upgrade-all'
#x
else
 echo -e "erro, opção invalida!\n"
fi