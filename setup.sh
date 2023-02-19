# shellcheck shell=bash
# Usage: ssh azure1 bash < setup.sh

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
  wget https://download.foldingathome.org/releases/public/release/fahclient/debian-testing-64bit/v7.4/fahclient_7.4.4_amd64.deb && \
  DEBIAN_FRONTEND=noninteractive sudo dpkg -i fahclient_7.4.4_amd64.deb
