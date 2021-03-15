#unshare komutu ile bir programi ayri bir namespace'de baslatabiliriz. -u parametresi yeni bir UTS namespace anlamina galiyor.
#UTS (UNIX Time Sharing) namespace is named after the data structure used to store information returned by the uname system call

hostname

ls -l /proc/$$/ns
unshare -u bash
ls -l /proc/$$/ns
hostname thehost
hostname
