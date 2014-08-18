flask-vagrant
=============

This is a vagrant box for working with flask and mysql.  nginx + uwsgi support is coming.

### Requirements

- Vagrant > 1.5 (http://vagrantup.com) for creating the VM
- VirtualBox > 4.3.10 (http://www.virtualbox.org) for the VM container

### Getting Started

1. Make sure all requirements are satisfied.  Clone this project and `cd` into the project root
2. `vagrant up` to provision the virtualbox VM

### Starting the Server

1. `vagrant ssh` to go into the server
2. `cd /vagrant/src`
3. `python hello.py` to start the development server
4. Connect to the MySQL server:
    Server: 192.168.66.66
    Port: 3306
    Username: testuser
    Password: testuser_pwd

### Changing Parameters

- To change the database name, username, and password, modify the yaml file in `salt/roots/pillar/mysql.sls`
- To change the IP address, modify `Vagrantfile` and change the `private_network` IP address

