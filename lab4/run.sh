#LXC uygulamasi
lxc-ls
ls /usr/share/lxc/templates/
lxc-create -n mylxc -t busybox
lxc-ls
lxc-ls --active
lxc-info --name mylxc
lxc-start -n mylxc -d
lxc-console -n mylxc -t 0
lxc-stop -n mylxc

