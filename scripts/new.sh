#!/usr/bin/bash
rails _6.0.2.1_ new demo --database=postgresql

mkdir -p /usr/local/runtime
cp -rf demo/* /usr/local/runtime
chmod -R 777 demo

cat /proc/self/cgroup | grep 'docker'
echo "To make this image current, copy container ID and then run:"
echo "  docker commit ID gs/rails_vN"
echo "  docker tag gs/rails_vN gs/current_rails"
echo DONE
tail -f /dev/null
