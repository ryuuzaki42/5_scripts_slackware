#!/bin/bash
echo "Script para iniciar VMWARE"
status=`su root -c "sh /etc/rc.d/init.d/vmware status"`
if echo $status | grep not > /dev/null
then
  echo "Iniciando modulo"
  su root -c "sh /etc/rc.d/init.d/vmware start"
fi
#su l -c "/usr/bin/vmware"