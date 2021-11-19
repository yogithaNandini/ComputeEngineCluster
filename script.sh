exec &> >(tee -a "bootstrap.log") 
echo "Hello World" > test
sudo apt install apt-transport-https ca-certificates curl gnupg2     software-properties-common -y
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
sudo apt update -y
apt-cache policy docker-ce
apt-cache policy docker-ce
sudo apt install docker-ce -y
systemctl status docker
docker pull streamsets/datacollector
docker images
docker run --restart on-failure -p 18630:18630 -d --name sdc streamsets/datacollector
docker ps -a
netstat -tulpn