ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'
 
Vagrant.configure("2") do |config|
  config.vm.define "mongodb" do |a|
    a.vm.provider "docker" do |d|
      d.name = "mongodb"
      d.remains_running = true
      d.image = "dockerfile/mongodb"
    end
  end
  
  config.vm.define "nodejs" do |a|
    a.vm.provider "docker" do |d|
      d.name = "nodejs"
      d.remains_running = false
      d.image = "dockerfile/nodejs"
      d.cmd = ["npm",  "install"]
      d.volumes = [Dir.pwd + ":/data"]
    end
  end
  
  config.vm.define "express" do |a|
    a.vm.provider "docker" do |d|
      d.name = "express"
      d.remains_running = true
      d.image = "dockerfile/nodejs"
      d.cmd = ["npm",  "run-script", "docker-server"]
      d.volumes = [Dir.pwd + ":/data"]
      d.ports = ["3001:3001"]
      d.link("mongodb:mongodb")
    end
  end
end
