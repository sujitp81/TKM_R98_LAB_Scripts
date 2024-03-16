sudo apt update
sudo apt install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 tree amdgpu -y
sudo apt install build-essential
wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
chmod +x Anaconda3-2023.09-0-Linux-x86_64.sh
./Anaconda3-2023.09-0-Linux-x86_64.sh 

conda create -n test python=3.11

#https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#pre-installation-actions
sudo apt-get install linux-headers-$(uname -r)
sudo apt-key del 7fa2af80
#https://developer.nvidia.com/cuda-11-8-0-download-archive
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.8.0/local_installers/cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-11-8-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo dpkg -i cuda-repo-ubuntu2004-11-8-local_11.8.0-520.61.05-1_amd64.deb

sudo apt-get update
sudo apt-get -y install cuda
export PATH=/usr/local/cuda-11.8/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

nvidia-smi
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
sudo apt install lm-sensors
wget http://repo.radeon.com/amdgpu-install/latest/ubuntu/focal/amdgpu-install_5.7.50700-1_all.deb
sudo dpkg -i amdgpu-install_5.7.50700-1_all.deb 

sudo dpkg -i cudnn-local-repo-ubuntu2004-8.9.5.29_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2004-8.9.5.29/cudnn-local-C1AC07B2-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get install libcudnn8=8.9.5.29-1+cuda11.8
sudo apt-get install libcudnn8-dev=8.9.5.29-1+cuda11.8
sudo apt-get install libcudnn8-samples=8.9.5.29-1+cuda11.8

#RDP
sudo apt install xrdp
sudo systemctl enable --now xrdp
sudo ufw allow from any to any port 3389 proto tcp
wget https://download.anydesk.com/linux/anydesk_6.3.0-1_amd64.deb

 pip install xq
 sudo apt install python3-distutils
 

 sudo apt install xserver-xorg-video-dummy
#List connected monitors 
 xrandr | grep ' connected'
 
rm /etc/anydesk/service.conf 


 

