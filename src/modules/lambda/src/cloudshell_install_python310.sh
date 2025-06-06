sudo yum -y groupinstall "Development Tools"
sudo yum -y install openssl-devel bzip2-devel libffi-devel
wget https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tgz
tar xvf Python-3.10.2.tgz
cd Python-3.10.2
./configure --enable-optimizations --prefix=$HOME/.local
sudo make altinstall
cd ..
sudo rm -rf Python-3.10.2 Python-3.10.2.tgz
python3.10 --version
pip3.10 --version