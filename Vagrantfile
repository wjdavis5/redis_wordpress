Vagrant.configure("2") do |config|
  config.vm.define "redis1" do |redis1|
    redis1.vm.box = "bento/ubuntu-16.04"
    redis1.vm.box_version = "201812.27.0"
    #redis1.vm.provision :shell, path: "bootstrap.sh", :args => "redis1"
    redis1.vm.network "public_network", bridge: "Main"
    redis1.vm.synced_folder ".", "/vagrant", type: "smb", disabled: true
    redis1.vm.provision "shell", inline: $script, :args => "redis1"
  end

  config.vm.define "redis2" do |redis2|
    redis2.vm.box = "bento/ubuntu-16.04"
    redis2.vm.box_version = "201812.27.0"
    redis2.vm.provision "shell", inline: $script, :args => "redis2"
    redis2.vm.network "public_network", bridge: "Main"
    redis2.vm.synced_folder ".", "/vagrant", type: "smb", disabled: true
  end

  config.vm.define "redis3" do |redis3|
    redis3.vm.box = "bento/ubuntu-16.04"
    redis3.vm.box_version = "201812.27.0"
    redis3.vm.provision "shell", inline: $script, :args => "redis3"
    redis3.vm.network "public_network", bridge: "Main"
    redis3.vm.synced_folder ".", "/vagrant", type: "smb", disabled: true
  end

end




$script = <<-SCRIPT
hostnamectl set-hostname $1
echo 127.0.0.1 $1 >> /etc/hosts
apt-get update
apt-get remove docker docker-engine docker.io containerd runc
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
sudo apt-get install docker-ce  -y
SCRIPT
