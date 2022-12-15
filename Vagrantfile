# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.


  config.vm.box = "ubuntu/focal64"
  config.vm.synced_folder '.', '/vagrant',disabled:true
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.memory = "2048"
    v.cpus = 2
    v.linked_clone = true
  end

  instances = [
    { :name => "web01", :ip => "192.168.51.10"},
    { :name => "web02", :ip => "192.168.51.11"},
    { :name => "web03", :ip => "192.168.51.15"},
  ]

  instances.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]

      if opts[:name] == "web03"
        config.vm.provision "ansible" do |ansible|
          ansible.host_key_checking = false
          ansible.playbook = "playbook.yml"
          ansible.limit = "all"
        end
      end
    end
  end
end

