set -e

DISK_MOUNT=output-virtualbox-iso/mount_docker

#packer build  -var "preseed_type=docker" ubuntu1604.json
#qemu-img convert -O raw output-virtualbox-iso/packer-ubuntu-16.04-amd64-disk1.vmdk output-virtualbox-iso/docker.raw
mkdir -p $DISK_MOUNT
sudo umount $DISK_MOUNT || true
sudo mount -o offset=$((2048 * 512)) output-virtualbox-iso/packer-ubuntu-16.04-amd64-disk1.raw $DISK_MOUNT
sudo rm -rf $DISK_MOUNT/boot $DISK_MOUNT/home
sudo tar -c -C $DISK_MOUNT . | docker import - ubuntu-16-base
sudo umount $DISK_MOUNT
