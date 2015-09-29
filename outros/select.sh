#!/bin/sh
echo "Qual é o seu SO preferido ?"
select var in "Linux" "Gnu Hurd" "Free BSD" "Other"; do
   break
done
echo "Você selecionou $var" 