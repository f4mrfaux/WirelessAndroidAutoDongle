setenv bootargs console=ttyS0,115200 root=/dev/mmcblk0p2 rootwait

fatload mmc 0:1 $kernel_addr_r Image
fatload mmc 0:1 $fdt_addr_r sun50i-h618-orangepi-zero2w.dtb

booti $kernel_addr_r - $fdt_addr_r