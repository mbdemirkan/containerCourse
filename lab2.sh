ldd /bin/bash /bin/ls /bin/cat
mkdir -p /home/a/{bin,/lib,/usr/lib} 
cp /bin/bash /home/a/bin/bash 
cp /bin/ls /home/a/bin/ls 
cp /bin/cat /home/a/bin/cat 
cp /lib/ld-musl-x86_64.so.1 /home/a/lib/ld-musl-x86_64.so.1
cp /usr/lib/libreadline.so.8 /home/a/usr/lib/libreadline.so.8
cp /lib/ld-musl-x86_64.so.1 /home/a/lib/ld-musl-x86_64.so.1
cp /usr/lib/libncursesw.so.6 /home/a/usr/lib/libncursesw.so.6 

chroot /home/a /bin/bash 
