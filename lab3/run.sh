#cgroups uygulamasi
#bellek icin bir kontrol grubu olusturalim
mkdir /sys/fs/cgroup/memory/kg
#icine limit istedigimiz bir deger yazalim
echo 10000000 > /sys/fs/cgroup/memory/kg/memory.limit_in_bytes
cat /sys/fs/cgroup/memory/kg/memory.limit_in_bytes
#Gordugumuz deger her zaman kernel page size'in katidir

./test.sh &

echo {{PID}} > /sys/fs/cgroup/memory/kg/cgroup.procs
ps -o cgroup  {{PID}}
cat /sys/fs/cgroup/memory/kg/memory.usage_in_bytes
echo 5000 > /sys/fs/cgroup/memory/kg/memory.limit_in_bytes
cat /sys/fs/cgroup/memory/kg/memory.limit_in_bytes
cat /var/log/syslog
