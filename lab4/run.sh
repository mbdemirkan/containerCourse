#LXC uygulamasi
lxc-ls
ls /usr/share/lxc/templates/
lxc-create -n ubuntu_lxc -t ubuntu
lxc-ls
lxc-ls --active
lxc-info --name ubuntu_lxc
lxc-start -n ubuntu_lxc -d
lxc-console -n ubuntu_lxc -t 0
lxc-stop -n ubuntu_lxc

