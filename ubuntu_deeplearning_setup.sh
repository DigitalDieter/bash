#########################################
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget
sudo apt-get autoremove
sudo rm -rf /var/lib/apt/lists/*

#adduser --disabled-password --shell /bin/bash --gecos "User" $username
adduser anaconda --disabled-password --shell /bin/bash --gecos "User" $username
echo "Create dir"
mkdir /opt/anaconda
cd  /opt/anaconda
su anaconda
echo "Download and Install Anaconda"
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
chmod +x Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
#Change owner
chown -R anaconda:anaconda /opt/anaconda
#
chmod -R go-w /opt/anaconda
#
chmod -R go+rX /opt/anaconda
#