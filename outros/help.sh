#/bin/sh
start () {
  clear
  echo "start"
}

stop () {
  clear
  echo "stop"
}

ajuda () {
  echo "########################"
  echo " isto e o help"
  }
  
case "$1" in
'start')
  start
  ;;
'stop')
  stop
  ;;
'--help')
  ajuda
  ;;
*)
  echo "usage $0 start|stop|--help"
esac