#!/usr/bin/env bash 

# script i found on the internet that i fixed up & added checks to

check_deps() {
  local missing=()
  for tool in foot cmus nvim; do
    if ! command -v "$tool" &> /dev/null; then
      missing+=("$tool")
    fi
  done

  if [ ${#missing[@]} -ne 0 ]; then
    echo "-- missing dependencies: ${missing[*]} --"
    
    if command -v pacman &> /dev/null; then
      sudo pacman -S "${missing[@]}"
    elif command -v apt &> /dev/null; then
      sudo apt install "${missing[@]}" || sudo apt install neovim 
    elif command -v dnf &> /dev/null; then
      sudo dnf install "${missing[@]}"
    elif command -v xbps-install &> /dev/null; then
      sudo xbps-install -S "${missing[@]}"
    elif command -v zypper &> /dev/null; then
      sudo zypper install "${missing[@]}"
    elif command -v emerge &> /dev/null; then
      sudo emerge "${missing[@]}"
    fi
    
  else
    echo "all dependencies found congrats"
  fi
}

##############
# install.sh #
##############

# make config 

mkdir -p $HOME/.config/chroctl/ 

cat <<EOF > "$HOME/.config/chroctl/chroctl.conf"
##################
# chroctl config #
##################
term="footclient"
editor="nvim"
mplayer="cmus"
volc=5
wallpath="\$HOME/walls"
srcpath="/usr/local/bin/chroctl"
EOF

# dependency check 
echo "would you like to install hardcoded apps? (y/n)"
echo "you dont need to, you can just edit them via $HOME/.config/chroctl/chroctl.conf"
echo "or, if it breaks, edit the source code at /usr/local/bin/chroctl"
echo ""
echo "dependency list: foot, cmus, nvim"
read hcd_input

if [[ $hcd_input == "y" ]]; then   
  check_deps
else 
  echo "id recommend editing your $HOME/.config/chroctl/chroctl.conf or the source code just in case!"
fi 

# finalizing, installing

echo "installing chroctl to /usr/local/bin.."
sudo cp chroctl /usr/local/bin/chroctl && 
sudo chmod +x /usr/local/bin/chroctl && 
echo "done. try chroctl -h now"
