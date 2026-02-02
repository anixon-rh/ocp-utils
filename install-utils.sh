#!/bin/sh
#Copy utils into bashrc

WORKDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASHRC_FILE="${HOME}/.bashrc"
UTILS_FILE="${WORKDIR}/.ocp-utils.sh"
SOURCE_CMD="source ${HOME}/.ocp-utils.sh"


#Check if bashrc file exists
if [[ ! -f "${BASHRC_FILE}" ]]
then
echo "${BASHRC_FILE} not found."
exit 1
fi

#Check if ocp utils file exists in working directory. Copy to home directory if so.
if [[ ! -f "${UTILS_FILE}" ]]
then
echo "${UTILS_FILE} not found."
exit 1
else
    cp "${UTILS_FILE}" "${HOME}/.ocp-utils.sh"
fi

#Check to see if utils already present
grep ${SOURCE_CMD} ${BASHRC_FILE} > /dev/null 2>&1
if [[ $? -eq 0 ]]
then
    echo "Utils source command already present in ${BASHRC_FILE}"
    exit 0
fi
#Append utils to bashrc
echo ${SOURCE_CMD} >> ${BASHRC_FILE}
echo "Utils source command appended to ${BASHRC_FILE}. Run 'source ~/.bashrc' to load them into your current shell."