
#Jupyter Hzub
pip3 install jupyter


# Install libs for R support 
sudo apt-get install -y r-base r-base-dev libssl-dev libcurl3-dev curl

pip install --upgrade jupyter_enterprise_gateway+



apt-get install unzip emacs wget curl python3-pip
pip3 install -U jupyter

#Start Kernel from terminal


jupyter enterprisegateway --ip=0.0.0.0 --port_retries=0


export XDG_RUNTIME_DIR=""
jupyter notebook --ip=0.0.0.0 --no-browser
