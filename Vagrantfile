# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # Ubuntu box
  config.vm.box = "ubuntu/trusty64"
  # We need at least 2 cores
  config.vm.provider "virtualbox" do |v|
      v.cpus = 2
  end
  # Run shell provisioning
  config.vm.provision :shell, privileged: false, path: "install.sh"
  # Move files
  config.vm.provision "file", source: "model.prototxt", destination: "Files/001/model.prototxt"
  config.vm.provision "file", source: "solver.prototxt", destination: "Files/001/solver.prototxt"
  config.vm.provision "file", source: "task.json", destination: "Files/001/task.json"
  config.vm.provision "file", source: "tasks.txt", destination: "Files/tasks.txt"
  config.vm.provision "file", source: "matplotlib-config", destination: "Mri-app/mriapp/matplotlib-config"
  config.vm.provision "file", source: "mri-server-config", destination: "Mri-app/mriapp/mri-server-config"
  # Run Tests
  config.vm.provision :shell, privileged: false, path: "run.sh"
end
