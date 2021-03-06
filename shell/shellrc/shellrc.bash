#*****************CURR_FILE_DIR*****************
# Get directory of current script file, follow symlink if needed.
CURR_FILE="${BASH_SOURCE[0]}"
if [ -L ${CURR_FILE} ]; then
	CURR_FILE=`readlink ${CURR_FILE}`
fi
CURR_FILE_DIR="$(cd "$(dirname "${CURR_FILE}" )" && pwd )"
#*****************CURR_FILE_DIR*****************

pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

alias cd=pushd

source ${CURR_FILE_DIR}/shellrc.generic

if exist tmuxinator; then
	source ${CURR_FILE_DIR}/tmuxinator.bash
fi

unset CURR_FILE_DIR
