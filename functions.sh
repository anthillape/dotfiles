#!/bin/bash
ask() {
  # https://djm.me/ask
  local prompt default reply

  while true; do

    if [ "${2:-}" = "Y" ]; then
      prompt="Y/n"
      default=Y
    elif [ "${2:-}" = "N" ]; then
      prompt="y/N"
      default=N
    else
      prompt="y/n"
      default=
    fi

    # Ask the question (not using "read -p" as it uses stderr not stdout)
    echo -n -e "\n$1 [$prompt] "

    # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
    read reply </dev/tty

    # Default?
    if [ -z "$reply" ]; then
      reply=$default
    fi

    # Check if the reply is valid
    case "$reply" in
      Y*|y*) return 0 ;;
      N*|n*) return 1 ;;
    esac

  done
}

# See https://github.com/mas-cli/mas/issues/107
# Thanks to Mark Ratcliffe https://github.com/MikeRatcliffe
loginToAppStore () {
  if ! mas account > /dev/null 2>&1; then
    if ask "You need to log in to the app store, press Y to open it" Y; then

      open -a "/Applications/App Store.app"

      until (mas account > /dev/null 2>&1);
      do
        sleep 3
      done
      echo "You are logged in to the app store, continuing..."
    else
      echo "Warning: The following brew steps may fail without logging in to the app store"
    fi
  fi
}
