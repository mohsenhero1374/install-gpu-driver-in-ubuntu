
#!/bin/bash


  if grep 'NAME="Ubuntu"' /etc/os-release;then
    sudo apt update && sudo apt install gcc -y && sudo apt install make -y
    sudo lspci -vnn | grep -i nvid -B20 > /tmp/gpu-type
    ftpaddress=172.20.91.30
    if grep -iq "20f1" /tmp/gpu-type; then  #A100#
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/Tesla/a100/NVIDIA-Linux-x86_64-515.48.07.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.48.07.run
      sudo ./NVIDIA-Linux-x86_64-515.48.07.run --ui=none -a -s -q
      sleep 2
    elif grep -iq "2204" /tmp/gpu-type; then  #3090#
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/GeForce_RTX_3090_and_2080TI/NVIDIA-Linux-x86_64-515.57.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.57.run
      sudo ./NVIDIA-Linux-x86_64-515.57.run --ui=none -a -s -q
      sleep 2
    elif grep -iq "1df6" /tmp/gpu-type; then  #v100#
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/Tesla/v100/NVIDIA-Linux-x86_64-515.65.01.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-515.65.01.run
      sudo ./NVIDIA-Linux-x86_64-515.65.01.run --ui=none -a -s -q
    elif grep -iq "1e07" /tmp/gpu-type; then #2080TI#
      sudo wget ftp://$ftpaddress/GPU/Linux_64-bit/GeForce_RTX_3090_and_2080TI/NVIDIA-Linux-x86_64-535.86.05.run 2> /dev/null
      sudo chmod +x NVIDIA-Linux-x86_64-535.86.05.run
      sudo ./NVIDIA-Linux-x86_64-535.86.05.run --ui=none -a -s -q
    fi
    sudo nvidia-smi
  else
     echo "This type of operating system is not related to Ubuntu."
  fi


