#!/bin/bash
#
# Autor= João Batista Ribeiro
# Bugs, Agradecimentos, Críticas "construtivas"
# Mande me um e-mail. Ficarei Grato!
# e-mail: joao42lbatista@gmail.com
#
# Com contibuições de Rumbler Soppa (github.com/rumbler)
#
# Este programa é um software livre; você pode redistribui-lo e/ou
# modifica-lo dentro dos termos da Licença Pública Geral GNU como
# publicada pela Fundação do Software Livre (FSF); na versão 2 da
# Licença, ou (na sua opinião) qualquer versão.
#
# Este programa é distribuído na esperança que possa ser útil,
# mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a
# qualquer MERCADO ou APLICAÇÃO EM PARTICULAR.
#
# Veja a Licença Pública Geral GNU para mais detalhes.
# Você deve ter recebido uma cópia da Licença Pública Geral GNU
# junto com este programa, se não, escreva para a Fundação do Software
#
# Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
#
# Script: Change values in one subtitle like: 2 to 1, 3 to 2, 4 to 3, and so on
#
# Last update: 24/08/2020
#
fileToWork=$1
fileToWork2=${fileToWork::-3}"-TMP"

# Grep cont line
countLines=$(grep -E "^[0-9]{1,4}" "$fileToWork" | tail -n 2 | head -n 1 | tr -dc '0-9')
# echo $countLines

# Work with tmp file
cp "$fileToWork" "$fileToWork2"

# Make the sed part to change the values, 2 to 1, 3 to 2, and so on
sedComands=$(
i=1
for j in $(seq 2 "$countLines"); do
    echo -n "s/^$j$/$i/g; "
    ((i++))
done
)

# Change $ to '$' to seed work correctly
sedComands2=${sedComands//$/\'$\'}

# Create the full command sed
sedCommandComplete=$(echo "sed -i '$sedComands2' $(pwd)/$fileToWork2")

# Tmp file to be the script with the sed complete command
scriptTmp=$(mktemp)
echo "$sedCommandComplete" > $scriptTmp

# Add permission to run the script and rum
chmod +x $scriptTmp
$scriptTmp

# Delete the script not need any more
rm $scriptTmp

echo "File result: $fileToWork2"
