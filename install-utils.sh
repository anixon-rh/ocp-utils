#!/bin/sh
#Copy utils into bashrc

WORKDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASHRC_FILE="${HOME}/.bashrc"
UTILS_FILE="${WORKDIR}/append-to-bashrc.txt"

#Check if bashrc file exists
if [[ ! -f "${BASHRC_FILE}" ]]
then
echo ".bashrc not found."
exit 1
fi

#Check to see if utils already present
while IFS= read -r line; do
    if [[ "$line" =~ ^[[:space:]]*$ ]]
    then
        continue
    elif grep -Fxq "$line" "$BASHRC_FILE"
    then
        echo "Utils already present in ${BASHRC_FILE}"
        exit 0
    fi

done < "$UTILS_FILE"

#Append utils to bashrc
cat ${UTILS_FILE} >> ${BASHRC_FILE}
echo "Utils appended to ${BASHRC_FILE}. Run 'source ~/.bashrc' to load them into your current shell."