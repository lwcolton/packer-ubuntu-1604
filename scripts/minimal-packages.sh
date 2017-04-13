sudo DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude ubuntu-minimal
sudo DEBIAN_FRONTEND=noninteractive aptitude markauto -y '~i!~nubuntu-minimal ~i!~nca-certificates -~i!~napt-transport-https ~i!~napt ~i!~nopenssl ~i!~ntime ~i!~nopenssh-server ~i!~nbuild-essential ~i!~ncurl'
sudo DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove aptitude
sudo pip install --upgrade pip
if [ "$BUILD_TYPE" == "docker" ]; then
  sudo DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove linux-* openssh-server
fi
sudo rm -rf /var/lib/apt/lists && sudo apt-get clean
