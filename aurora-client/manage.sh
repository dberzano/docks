#!/bin/bash -e
BUILDERS=( "build_AliPhysics_release"
           "build_AliRoot_el6native"
           "build_AliRoot_release"
           "build_Configuration_o2-dataflow"
           "build_Monitoring_o2-dataflow"
           "build_O2_Common"
           "build_O2_o2-dev-fairroot"
           "build_O2_o2"
           "build_QualityControl_o2-dataflow"
           "build_alo_alo"
           "build_o2checkcode_o2" )

function pp() {
  local MSG
  [[ $1 == 0 ]] && MSG="\033[32;1m[ OK ]\033[m" || MSG="\033[31;1m[FAIL]\033[m"
  echo -e "$MSG \033[34;1m$2\033[m"
}

function pq() {
  echo -n -e "\033[33;1m[ ?? ]\033[m \033[36;1m$1\033[m"
}

CONF=/home/dberzano/cern-git/ali-marathon/aurora/continuos-integration.aurora
if [[ $1 != force-restart && $1 != update ]]; then
  echo "Usage: $0 [force-restart|update]"
  exit 0
fi
for B in "${BUILDERS[@]}"; do

  if [[ $1 == force-restart ]]; then
    pq "Do you want to force-restart $B? [no] "
    read ANS
    if [[ $ANS == y || $ANS == yes ]]; then
      ERR=0
      aurora job killall build/mesosci/devel/$B || true
      aurora job create build/mesosci/devel/$B $CONF || ERR=$?
      pp $ERR "force-restart of $B"
    fi
  elif [[ $1 == update ]]; then
    aurora job diff build/mesosci/devel/$B $CONF || true
    pq "Do you want to update $B? [no] "
    if [[ $ANS == y || $ANS == yes ]]; then
      ERR=0
      aurora job update build/mesosci/devel/$B $CONF || ERR=$?
      pp $ERR "update of $B"
    fi
  fi

done
