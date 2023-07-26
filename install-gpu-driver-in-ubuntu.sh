
#!/bin/bash

if  grep 'NAME="Ubuntu"' /etc/os-release; then # in this line checking that operating system is ubuntu"
    sudo lspci -vnn | grep -i nvid -B20 > /tmp/GPU-type
    sudo apt update && sudo apt install gcc -y && sudo apt install make -y
    ftpaddress=172.20.91.30 #local addresses for download gpu driver#
    if grep -iq "20f1" /tmp/gpu-type; then   #this line check gpu id in a100 graphics #
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/Tesla/a100/NVIDIA-Linux-x86_64-515.48.07.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.48.07.run
      sudo ./NVIDIA-Linux-x86_64-515.48.07.run --ui=none -a -s -q
      sleep 2
    elif grep -iq "2204" /tmp/gpu-type; then
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/GeForce_RTX_3090/NVIDIA-Linux-x86_64-515.57.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.57.run
      sudo ./NVIDIA-Linux-x86_64-515.57.run --ui=none -a -s -q
      sleep 2
    elif grep -iq "1df6" /tmp/gpu-type; then
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/Tesla/v100/NVIDIA-Linux-x86_64-515.65.01.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.65.01.run
      sudo ./NVIDIA-Linux-x86_64-515.65.01.run --ui=none -a -s -q
    fi
    sudo nvidia-smi #show that GPU driver is installed or not #
else 
    echo "This type of operating system is not related to Ubuntu."
fi
