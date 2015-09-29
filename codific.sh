#! /bin/bash
if [ $# -ne 1 ] # verifica se foi passado o nome do arquivo
then
   echo "$(basename "$0"): Erro de Operandos"
   echo "Use $0 nome.extensão do arquivo que deseja converter"
   echo "Tente $0 --help para mais detalhes"
   exit 0
fi

ajuda () { #função de Ajuda
  echo "#                                                             #"
  echo "# Use o nome do arquivo (com a extensão) que deseja converter #"  
  echo "# Ex.: $0 file.srt                                  #"
  echo "#                                                             #" 
  exit 0
}

case "$1" in #Case virifica chamada da função ajuda
'--help')
  ajuda  
esac

nomeArquivo="$1" #Nome do arquivo $1
if [ -e "$nomeArquivo" ]
then
  echo >/dev/null
else
  echo -e "Arquivo passado por parâmetro não existe\nTente \"$0 --help\" ou com outro arquivo"
  exit 1
fi
tamanhoNome=$(echo "$nomeArquivo" | wc -m) #Calcula o tamanho do Nome e retirando retorno do wc
tamanhoNome2=$((tamanhoNome - 5)) #Tamanho do nome do arquivo sem a extensão
nomeArquivo2=$(echo "$nomeArquivo" | cut -c1-$tamanhoNome2) #Nome do arquivo sem extensão
tamanhoNome2=$((tamanhoNome - 3)) #Tamanho do nome do arquivo sem a extensão pra pegar a extensão
extensao=$(echo "$nomeArquivo" | cut -c$tamanhoNome2-) # extensao do arquivo
codificacao=$(cat "$nomeArquivo" | file -) #Verifica codificação do arquivo

if echo $codificacao | grep ISO-8859  > /dev/null #verifica codificacao do arquivo é iso-8859
then
  codInicial=iso-8859
  codFinal=utf-8
  iconv -f iso-8859-1 -t utf-8 "$nomeArquivo" > "$nomeArquivo2"_"$codFinal"."$extensao" #converter arquivo para utf-8 salvando em outro arquivo
elif echo $codificacao | grep UTF-8 > /dev/null #verifica codificacao do arquivo é iso-8859
then  
  codInicial=utf-8
  codFinal=iso-8859 
  iconv -f utf-8 -t iso-8859-1 "$nomeArquivo" > "$nomeArquivo2"_"$codFinal"."$extensao" #converter arquivo para iso-8859 salvando em outro arquivo
else #Em ultimo caso, nenhuma das duas codificações termina
  echo -e "Codificação desconhecida\nArquivo não pode ser convertido"
  exit 1
fi

if [ $? -eq 1 ]
then
  echo -e "Erro encontrado na execução do iconv\nTente $0 --help"
  exit 1
else
  echo -e "##Arquivo convertido com sucesso##\n\"$nomeArquivo\" de $codInicial para $codFinal"
  echo "$nomeArquivo --> $nomeArquivo2"_"$codFinal.$extensao"
fi