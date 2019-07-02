
# Script create virtual conda / python environments

# python 2.7
conda create -y  --name py27 python=2.7
conda install -y --name py27 pandas scipy numpy matplotlib tensorflow keras

# Python 3.5
conda create -y --name py35 python=3.5
conda install -y --name py35 pandas scipy numpy matplotlib tensorflow keras

# Python 3.6
conda create -y --name py36 python=3.6
conda install -y --name py36 pandas scipy numpy matplotlib tensorflow keras

# Show envs
conda env list
