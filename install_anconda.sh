
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
    sudo chown -R anaconda:anaconda /home/anaconda
    sudo chmod -R go-w /home/anaconda
    echo "Create folder for installation"
    echo "Downloading anaconda script intaller"
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    echo "Install anaconda"
    installation_dir='/homne/anaconda'
    sudo -u anaconda sudo bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}

    bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}
    echo "Change folder permission"
    conda info
fi




