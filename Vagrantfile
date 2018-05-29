Vagrant.configure("2") do |config|
  # define provider configuration
  config.vm.provider :virtualbox do |v|
    v.memory = 2048
  end
  # define a VM machine configuration
  config.vm.define "treetracker-app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.hostname = "treetracker-app"
    app.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/configuration.yml"
    end
  end
end
