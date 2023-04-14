#!/bin/csh -f

# set default(s)
_home=${1:-$(pwd)}

# primary variable(s)
export MGUI_TELESCOPE=kuiper
export MGUI_HOME=${_home}
export MGUI_BIN=${MGUI_HOME}/bin
export MGUI_CFG=${MGUI_HOME}/cfg
export MGUI_ETC=${MGUI_HOME}/etc
export MGUI_SRC=${MGUI_HOME}/src
export MGUI_TSV=${MGUI_HOME}/tsv

# secondary variable(s)
export MGUI_XOPT=${MGUI_CFG}/mgui.xopt

# path(s)
export PATH="${MGUI_BIN}:${MGUI_SRC}:${PATH}"
