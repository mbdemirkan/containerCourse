mkdir /sys/fs/cgroup/memory/test
echo 5000 | tee /sys/fs/cgroup/memory/test/memory.limit_in_bytes
cat /sys/fs/cgroup/memory/test/memory.limit_in_bytes
./test.sh &
echo $! > /sys/fs/cgroup/memory/test/cgroup.procs