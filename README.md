#### Some useful bash scripts / code snippets to automate boring stuff

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