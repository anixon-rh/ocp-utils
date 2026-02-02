#!/bin/sh
#Copy utils into bashrc

WORKDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASHRC_FILE="${HOME}/.bashrc"
BASHCONFIG_FILE="${WORKDIR}/.bashconfig"
BASHCONFIGS_DIR="${WORKDIR}/.bashconfigs"
SOURCE_CMD="source ${HOME}/.bashconfig"


#Check if bashrc file exists
if [[ ! -f "${BASHRC_FILE}" ]]
then
echo "${BASHRC_FILE} not found."
exit 1
fi

#Check if .bashconfig file exists in working directory. Copy to home directory if so.
if [[ ! -f "${BASHCONFIG_FILE}" ]]
then
echo "${BASHCONFIG_FILE} not found."
exit 1
else
    echo "Copying ${BASHCONFIG_FILE} to ${HOME}/"
    cp "${BASHCONFIG_FILE}" "${HOME}/"
    cp -r "${BASHCONFIGS_DIR}" "${HOME}/"
fi

#Check to see if bashconfig source command already present
grep "${SOURCE_CMD}" ${BASHRC_FILE} > /dev/null 2>&1
if [[ $? -eq 0 ]]
then
    echo "Bashconfig source command already present in ${BASHRC_FILE}"
    exit 0
fi

#Append bashconfig source command to bashrc
echo ${SOURCE_CMD} >> ${BASHRC_FILE}
echo "Bashconfig source command appended to ${BASHRC_FILE}. Run 'source ~/.bashrc' to load them into your current shell."