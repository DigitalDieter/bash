#########################################
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget
sudo apt-get autoremove
sudo rm -rf /var/lib/apt/lists/*



#################    ANACONDA  #################
echo "Create user anaconda"
adduser anaconda --disabled-password --shell /bin/bash --gecos "User" $username

if [ ! -d /opt/anaconda ]
then
    echo "Create folder for installation"
    mkdir -p /opt/anaconda
    echo "Downloading anaconda script intaller"
    curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
    echo "Install anaconda"
    installation_dir='/opt/anaconda'
    bash Anaconda3-2019.03-Linux-x86_64.sh -b -f -p ${installation_dir}
    chown -R anaconda:anaconda /opt/anaconda
    #
    chmod -R go-w /opt/anaconda
    #
    chmod -R go+rX /opt/anaconda
    #

    su anaconda
    conda info
fi




