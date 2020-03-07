#namespace uygulamasi
#namespace listesi
ls -l /proc/$$/ns
#sunucu anini okuyalim
hostname
#Yeni bir UTS namespace'li terminal acalim
unshare -u bash
#unshare komutu ile bir programi ayri bir namespace'de baslatabiliriz. -u parametresi yeni bir UTS namespace anlamina galiyor.
#UTS (UNIX Time Sharing) namespace is named after the data structure used to store information returned by the uname system call
#namespace listesi
ls -l /proc/$$/ns
#sunucu adini degistirelim
hostname thehost
#sunucu anini okuyalim
hostname
