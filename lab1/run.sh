#chroot lab
mkdir -p /home/a/bin
#bir kac komut kopyalayalim
cp /bin/bash /home/a/bin/bash
cp /bin/ls /home/a/bin/ls
cp /bin/cat /home/a/bin/cat
#kopyaladigimiz kolutlarin kullandigi kutuphaneler neler
ldd /bin/bash /bin/ls /bin/cat
#kutuphane dosyalari icin dizinleri olusturalim
mkdir -p /home/a/{lib64,lib/x86_64-linux-gnu}
#kutuphane dosyalarini kopyalayalim
cp /lib/x86_64-linux-gnu/libtinfo.so.5 /home/a/lib/x86_64-linux-gnu/libtinfo.so.5
cp /lib/x86_64-linux-gnu/libdl.so.2 /home/a/lib/x86_64-linux-gnu/libdl.so.2
cp /lib/x86_64-linux-gnu/libc.so.6 /home/a/lib/x86_64-linux-gnu/libc.so.6
cp /lib64/ld-linux-x86-64.so.2 /home/a/lib64/ld-linux-x86-64.so.2
cp /lib/x86_64-linux-gnu/libselinux.so.1 /home/a/lib/x86_64-linux-gnu/libselinux.so.1
cp /lib/x86_64-linux-gnu/libpcre.so.3 /home/a/lib/x86_64-linux-gnu/libpcre.so.3
cp /lib/x86_64-linux-gnu/libpthread.so.0 /home/a/lib/x86_64-linux-gnu/libpthread.so.0
#bir de dosya olusturalim
echo world > /home/a/hello.txt
#yeni bir sistem rootu olusturalim
chroot /home/a /bin/bash

