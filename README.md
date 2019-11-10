# kubernetes-jitsi-install
How to install Jitsi on kubernetes

Prosody configs are not overwritten


Jibri
```bash
sudo sh -c 'echo "options snd-aloop enable=1,1,1,1,1 index=0,1,2,3,4" > /etc/modprobe.d/asound.conf'
sudo sh -c 'echo "snd-aloop" >> /etc/modules'
sudo modprobe snd-aloop
sudo lsmod | grep snd_aloop


kubectl label nodes ip-172-20-62-72.ec2.internal sound=alsa
```
