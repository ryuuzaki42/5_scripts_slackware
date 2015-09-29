#! /bin/bash
echo "Este script vai atualizar a data"
su - root -c 'ntpdate -u -b ntp1.ptb.de'