uninstall_usage() {
  cat <<-USAGE

Usage:

    c3tk uninstall

Description:

    Uninstalls c3tk, removing /opt/c3tk, /usr/local/bin/c3tk, and ~/.config/c3tk

USAGE
exit 0
}

uninstall() {
  if [[ -d "${OPT_PATH:="/opt/c3tk"}" ]]
  then 
    echo "Removing "${OPT_PATH}", /usr/local/bin/c3tk..."
    rm -rf "${OPT_PATH}" /usr/local/bin/c3tk
  fi
  
  echo "Removing ~/.config/c3tk..."
  rm -rf ~/.config/c3tk
  echo "c3tk uninstalled."
}
