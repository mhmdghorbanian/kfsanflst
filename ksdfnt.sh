echo "kill (lsof -t -i:8081)
sudo ssh -p 22 -f -N -L 0.0.0.0:8081:mk11.bcnt.in:8081 root@mk11.bcnt.in
kill (lsof -t -i:8443)
sudo ssh -p 22 -f -N -L 0.0.0.0:8443:mk11.bcnt.in:8443 root@mk11.bcnt.in
kill (lsof -t -i:8080)
sudo ssh -p 22 -f -N -L 0.0.0.0:8080:mk11.bcnt.in:8080 root@mk11.bcnt.in
kill (lsof -t -i:2053)
sudo ssh -p 22 -f -N -L 0.0.0.0:2053:mk11.bcnt.in:2053 root@mk11.bcnt.in" > /etc/mt.sh
echo "net.ipv4.ip_forward = 1" | sudo tee /etc/sysctl.d/60-custom.conf
echo "net.core.default_qdisc=fq" | sudo tee -a /etc/sysctl.d/60-custom.conf
echo "net.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.d/60-custom.conf
sudo sysctl -p /etc/sysctl.d/60-custom.conf
sudo ssh-keygen
sudo ssh-copy-id -p 22 root@mk11.bcnt.in
crontab -e
nano /etc/mt.sh
bash /etc/mt.sh
sudo timedatectl set-timezone Asia/Tehran
