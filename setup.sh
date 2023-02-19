# shellcheck shell=bash
# Usage: ssh azure1 bash < setup.sh

FAHC_VERSION="7.6.21"
CPU_ARCH="$(dpkg --print-architecture)"

if [ "$CPU_ARCH" = "amd64" ]; then
  FOLDER_SUFFIX="64bit"
else
  FOLDER_SUFFIX="arm64"
fi

# TODO: set variables automatically
sudo mkdir /etc/fahclient && \
  cat <<EOF | sudo tee /etc/fahclient/config.xml
<config>
  <!-- Client Control -->
  <fold-anon v='true'/>

  <!-- Folding Slot Configuration -->
  <gpu v='false'/>

  <!-- Slot Control -->
  <power v='full'/>

  <!-- User Information -->
  <passkey v='$PASSKEY'/>
  <team v='$TEAMID'/>
  <user v='$USERID'/>

  <!-- Folding Slots -->
  <slot id='0' type='CPU'/>
</config>
EOF
  echo "fahclient       fahclient/autostart     boolean true" | sudo debconf-set-selections && \
  sudo apt install -y wget htop && \
  wget "https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-${FOLDER_SUFFIX}/v7.6/fahclient_${FAHC_VERSION}_${CPU_ARCH}.deb" && \
  DEBIAN_FRONTEND=noninteractive sudo dpkg -i "fahclient_${FAHC_VERSION}_${CPU_ARCH}.deb"
