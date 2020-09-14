mkdir /sys/fs/cgroup/memory/foo
echo 5000 | sudo tee /sys/fs/cgroup/memory/foo/memory.limit_in_bytes
cat /sys/fs/cgroup/memory/foo/memory.limit_in_bytes
./test.sh &
echo $! > /sys/fs/cgroup/memory/foo/cgroup.procs