# Vagrantfile for Ansible control node and two managed nodes afiter one more node is added to the inventory file.

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  
  NODES = {
    "ansible-control" => { ip: "192.168.56.30", role: "control" },
    "node1" => { ip: "192.168.56.31", role: "node" },
    "node2" => { ip: "192.168.56.32", role: "node" }
  }

  NODES.each do |name, opts|
    config.vm.define name do |machine|
      machine.vm.hostname = name
      machine.vm.network "private_network", ip: opts[:ip]
      
      machine.vm.provider "virtualbox" do |vb|
        vb.memory = (opts[:role] == "control") ? 1536 : 1024
        vb.cpus = 2
      end

      if opts[:role] == "control"
        machine.vm.synced_folder "./ansible", "/ansible", mount_options: ["dmode=775, fmode=600"]
        machine.vm.synced_folder ".vagrant", "/ansible/.vagrant", mount_options: ["dmode=775, fmode=600"]
        machine.vm.provision "shell", path: "provision/bootstrap-control.sh"
      else
        machine.vm.provision "shell", path: "provision/bootstrap-node.sh"
      end
    end
  end
end