# kubernetes-jitsi-install
How to install Jitsi on kubernetes

Prosody configs are not overwritten


Jibri

```bash
sudo sh -c 'echo "options snd-aloop enable=1,1,1,1,1 index=0,1,2,3,4" > /etc/modprobe.d/asound.conf'
sudo sh -c 'echo "snd-aloop" >> /etc/modules'
sudo modprobe snd-aloop
sudo lsmod | grep snd_aloop
```

Lable NODE appropriately

```bash
kubectl label nodes ip-172-20-62-72.ec2.internal sound=alsa
```

```json
 "control_login": {
                "domain": "auth.meet.jitsi",
                // The credentials for logging in
                "username": "jibri",
                "password": "passw0rd"
            },
            // Using the control_login information above, Jibri will join 
            //  a control muc as a means of announcing its availability 
            //  to provide services for a given environment
            "control_muc": {
                "domain": "internal-muc.meet.jitsi",
                "room_name": "jibribrewery",
		// MUST be unic for every instanse
                "nickname": "jibri-instanse-732705008"
            },
            // All participants in a call join a muc so they can exchange
            //  information.  Jibri can be instructed to join a special muc
            //  with credentials to give it special abilities (e.g. not being
            //  displayed to other users like a normal participant)
            "call_login": {
                "domain": "recorder.meet.jitsi",
                "username": "recorder",
                "password": "passw0rd"
            },
```
So, it wouldn't work until manually registered users.
Internal users must be created with the ``prosodyctl`` utility in the ``prosody`` container.

```bash
prosodyctl --config /config/prosody.cfg.lua register "${JIBRI_XMPP_USER}"              "${XMPP_AUTH_DOMAIN}"     "${JIBRI_XMPP_PASSWORD}"
prosodyctl --config /config/prosody.cfg.lua register "${JIBRI_RECORDER_USER=recorder}" "${XMPP_RECORDER_DOMAIN}" "${JIBRI_RECORDER_PASSWORD}"
```
Which can be extracted as:
```bash
prosodyctl --config /config/prosody.cfg.lua register jibri    auth.meet.jitsi     passw0rd
prosodyctl --config /config/prosody.cfg.lua register recorder recorder.meet.jitsi passw0rd
```



```bash
git clone https://github.com/netaskd/docker-jitsi-meet
cd docker-jitsi-meet
```
```bash
SYSTEMS="base base-java prosody jicofo jvb jibri jigasi web"
JITSI_REPO=sunsingerus

for system in $SYSTEMS; do
	echo "==============="
	echo "=== $system ==="
	echo "==============="
	cd $system
	set -x
	docker build --build-arg JITSI_REPO=$JITSI_REPO -t sunsingerus/$system -f ./Dockerfile .
	set +x
	docker push $JITSI_REPO/$system:latest
	cd ..
done
```

