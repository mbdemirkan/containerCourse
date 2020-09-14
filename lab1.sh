cd /home
mkdir deneme
mkdir deneme/bin
#bir kac komut kopyalayalim
cp /bin/bash /home/deneme/bin
cp /bin/ls /home/deneme/bin/ls
cp /bin/cat /home/deneme/bin/cat
#kopyaladigimiz kolutlarin kullandigi kutuphaneler neler
ldd /bin/bash /bin/ls /bin/cat
#kutuphane dosyalari icin dizinleri olusturalim
mkdir -p /home/deneme/{lib,/usr/lib} 
#kutuphane dosyalarini kopyalayalim
cp /usr/lib/libreadline.so.8 /home/deneme/usr/lib/libreadline.so.8
cp /lib/ld-musl-x86_64.so.1 /home/deneme/lib/ld-musl-x86_64.so.1
cp /usr/lib/libncursesw.so.6 /home/deneme/usr/lib/libncursesw.so.6 
#bir de dosya olusturalim
echo world > /home/deneme/hello.txt
#yeni bir sistem rootu olusturalim
chroot /home/deneme /bin/bash
