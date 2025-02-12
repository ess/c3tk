configure_usage() {
  cat <<-USAGE

Usage:

    c3tk configure

Description:

    Configure loads all ~/.c3tk/config/*.c3tk files

USAGE
exit 0
}

gen_config() {
  mkdir -p "${CONFIG_PATH}"/{bin,cmds,config}
}

config_read() {
  local _cmd="$1" _key="$2"
  local _cmd_file="${CONFIG_PATH}/cmds/${_cmd}"
  awk -F= "/${_key}/{print \$2}" "${_cmd_file}"
}

configure() {
  local _config _group
  for _config in $(find ~/.c3tk/config  -iname '*.c3tk')
  do
    _group=$(basename ${_config} '.c3tk')
    echo -e "\n${_group}:\n$(printf '=%.0s' {1..80})"
    while read _line 
    do 
      echo " => ${_line}"
      $0 $_line
    done < <(cat ${_config} | sed -e '/^[[:blank:]]*#/d;s/#.*//')
  done
}

platform() {
  echo "${DIST:-$(config_read "${cmd}" "dist")}/${ARCH:-$(config_read "${cmd}" "arch")}"
}

