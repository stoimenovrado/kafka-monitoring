# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.box = "shekeriev/debian-11"

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 2048
    v.cpus = 2
  end

  # Apache Kafka Machines - Debian 11
    config.vm.define "kafka" do |kafka|
      kafka.vm.hostname = "kafka"
      kafka.vm.network "private_network", ip: "192.168.89.161"
      kafka.vm.provision "shell", path: "add_hosts.sh"
      kafka.vm.provision "shell", path: "docker-terraform-setup.sh"
      kafka.vm.provision "shell", path: "kafka/kafka.sh"
      kafka.vm.provision "shell", path: "kafka/kafka-exporter.sh"
    end
  
  # Monitoring Machine - Debian 11
  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.hostname = "monitoring"
    monitoring.vm.network "private_network", ip: "192.168.89.162"
    monitoring.vm.provision "shell", path: "add_hosts.sh"
    monitoring.vm.provision "shell", path: "docker-terraform-setup.sh"
    monitoring.vm.provision "shell", path: "monitoring/monitoring-up.sh"
  end

end
