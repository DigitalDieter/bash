
#Updating the system
sudo apt-get update
sudo apt-get -y upgrade

#Dependencies installation (Jupyter )
sudo apt-get install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget

#Removing old packages
sudo apt-get autoremove

#Create user anaconda
sudo adduser anaconda

#Add user to group sudo
sudo usermod -aG sudo anaconda

#Show firewall activity
ufw app list


if [ ! -d /homne/anaconda/anaconda ]
then
    su - anaconda
    echo "Create folder for installation"
    mkdir -p /homne/anaconda/anaconda
    cd /homne/anaconda/anaconda
    echo "Downloading anaconda script intaller"
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    echo "Install anaconda"
    installation_dir='/homne/anaconda/anaconda'
    bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}
    echo "Change folder permission"
    sudo chown -R anaconda:anaconda /homne/anaconda/
    sudo chmod -R go-w /homne/anaconda/
    conda info
fi


