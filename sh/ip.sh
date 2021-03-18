
#!/usr/bin/env bash

# 获取电脑ip

if [[ $(uname) == 'Darwin' ]]; then
  ip=`ifconfig en0 | grep "inet " | awk '{print $2}'`
  echo $ip
else
  net_devs=`ls /sys/class/net | grep -E '^(eth|wlan|enp|wlp)'`
  for net_dev in $net_devs
  do
    echo -n "${net_dev}: "
    ip=`ifconfig ${net_dev} | grep "inet " | awk '{print $2}'`
    echo ${ip}
  done
fi
