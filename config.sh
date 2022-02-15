#!/bin/bash

# Systematically create directories for the servers and clients

# SET Values
DIRS=(echo */)

bootstrap_content () {
   # This could also be done through a template
   # inside the master dir.
cat > bootstrap.sh <<EOF
Some Text...
EOF
}

vagrant_content () {
   if [ ! -f Vagrantfile ]; then
cat > Vagrantfile << EOF
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Box
  config.vm.box = "ubuntu/focal64"

  # Box Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
  end

end
EOF
   else
      echo "Vagrantfile already exists in $dir"
   fi;
};

# Helper Funcs
warn () {
   echo "[WARNING] {@}";
}

fatal () {
   echo "[FATAL] {@}";
}

# Setup a minimal-cluster setup using vagrant and the official ubuntu/focal64 box.

if [ pwd = "/home/*" ]; then fatal "I refuse to work in the ~ dir."; fi;

setup_dirs () {
   # `-p` since we want to create the dir if it doesn't exist
   mkdir -p server1 server2 client1 client2;
}

loop_dirs () {
   # echo */ will include the echo term, so we skip it using `:1`.
   for dir in "${DIRS[@]:1}"; do
      # We have to put the cmds in a subshell (&&) to ensure we change the working dir.
      cd $dir && vagrant_content && cd - > /dev/null;  # cd - > /dev/null to avoid printing the dir.
   done
}

# Execute Logic
setup_dirs;
loop_dirs;
