Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59046 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726164AbeKZTOy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 14:14:54 -0500
Date: Mon, 26 Nov 2018 09:21:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        kieran.bingham@ideasonboard.com,
        Hoan Nguyen An <na-hoan@jinso.co.jp>
Subject: Re: [PATCH] drm: rcar-du: Fix DU3 start/stop on M3-N
Message-ID: <20181126082125.5k4f2qyx2wczgddq@verge.net.au>
References: <20181123114809.19693-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123114809.19693-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 23, 2018 at 01:48:08PM +0200, Laurent Pinchart wrote:
> Group start/stop is controlled by the DRES and DEN bits of DSYSR0 for
> the first group and DSYSR2 for the second group. On most DU instances,
> this maps to the first CRTC of the group. On M3-N, however, DU2 doesn't
> exist, but DSYSR2 does. There is no CRTC object there that maps to the
> correct DSYSR register.
> 
> Commit 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known
> initial value") switched group start/stop from using group read/write
> access to DSYSR to a CRTC-based API to cache the DSYSR value. While
> doing so, it introduced a regression on M3-N by accessing DSYSR3 instead
> of DSYSR2 to start/stop the second group.
> 
> To fix this, access the DSYSR register directly through group read/write
> if the SoC is missing the first DU channel of the group. Keep using the
> rcar_du_crtc_dsysr_clr_set() function otherwise, to retain the DSYSR
> caching feature.
> 
> Fixes: 9144adc5e5a9 ("drm: rcar-du: Cache DSYSR value to ensure known initial value")
> Reported-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks Laurent,

I have confirmed that with this patch applied on top of
renesas-devel-20181123-v4.20-rc3 Salvator-XS / M3-N ES1.0
boots to user-space when the kernel is compiled using renesas_defconfig.

Tested-by: Simon Horman <horms+renesas@verge.net.au>


Without this patch applied the boot log looks this:

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd073]
[    0.000000] Linux version 4.20.0-rc3-arm64-renesas
(horms@reginn.horms.nl) (gcc version 7.3.0 (GCC)) #283 SMP PREEMPT Mon Nov
26 09:14:14 CET 2018
[    0.000000] Machine model: Renesas Salvator-X 2nd version board based on
r8a77965
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 128 MiB at 0x00000000b8000000
[    0.000000] On node 0 totalpages: 491520
[    0.000000]   DMA32 zone: 7680 pages used for memmap
[    0.000000]   DMA32 zone: 0 pages reserved
[    0.000000]   DMA32 zone: 491520 pages, LIFO batch:63
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS resident on physical CPU 0x0
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] random: get_random_bytes called from start_kernel+0xac/0x480
with crng_init=0
[    0.000000] percpu: Embedded 23 pages/cpu @(____ptrval____) s64648 r0
d29560 u94208
[    0.000000] pcpu-alloc: s64648 r0 d29560 u94208 alloc=23*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for EL2 vector hardening
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages:
483840
[    0.000000] Kernel command line: ignore_loglevel rw root=/dev/nfs
nfsroot=10.7.3.162:/srv/nfs/arm64 ip=on
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152
bytes)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576
bytes)
[    0.000000] Memory: 1771168K/1966080K available (9980K kernel code,
1122K rwdata, 3008K rodata, 768K init, 12111K bss, 63840K reserved, 131072K
cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
[    0.000000] Running RCU self tests
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU lockdep checking is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=64 to
nr_cpu_ids=2.
[    0.000000]  Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is
25 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] arch_timer: cp15 timer(s) running at 8.32MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0x1eb398c07, max_idle_ns: 440795202503 ns
[    0.000003] sched_clock: 56 bits at 8MHz, resolution 120ns, wraps every
2199023255503ns
[    0.000142] Console: colour dummy device 80x25
[    0.001298] printk: console [tty0] enabled
[    0.001326] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,
Ingo Molnar
[    0.001366] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.001391] ... MAX_LOCK_DEPTH:          48
[    0.001415] ... MAX_LOCKDEP_KEYS:        8191
[    0.001441] ... CLASSHASH_SIZE:          4096
[    0.001466] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.001492] ... MAX_LOCKDEP_CHAINS:      65536
[    0.001518] ... CHAINHASH_SIZE:          32768
[    0.001543]  memory used by lock dependency info: 7263 kB
[    0.001573]  per task-struct memory footprint: 1920 bytes
[    0.001636] Calibrating delay loop (skipped), value calculated using
timer frequency.. 16.64 BogoMIPS (lpj=33280)
[    0.001692] pid_max: default: 32768 minimum: 301
[    0.001878] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes)
[    0.001928] Mountpoint-cache hash table entries: 4096 (order: 3, 32768
bytes)
[    0.024092] ASID allocator initialised with 32768 entries
[    0.032076] rcu: Hierarchical SRCU implementation.
[    0.040670] Detected Renesas R-Car Gen3 r8a77965 ES1.0
[    0.041374] EFI services will not be available.
[    0.048148] smp: Bringing up secondary CPUs ...
[    0.080449] Detected PIPT I-cache on CPU1
[    0.080499] CPU1: Booted secondary processor 0x0000000001 [0x411fd073]
[    0.080808] smp: Brought up 1 node, 2 CPUs
[    0.080895] SMP: Total of 2 processors activated.
[    0.080928] CPU features: detected: 32-bit EL0 Support
[    0.080959] CPU features: detected: CRC32 instructions
[    0.083973] CPU: All CPU(s) started at EL1
[    0.084025] alternatives: patching kernel code
[    0.085610] devtmpfs: initialized
[    0.101022] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.101100] futex hash table entries: 512 (order: 4, 65536 bytes)
[    0.102979] pinctrl core: initialized pinctrl subsystem
[    0.104177] DMI not present or invalid.
[    0.104879] NET: Registered protocol family 16
[    0.105422] audit: initializing netlink subsys (disabled)
[    0.105718] audit: type=2000 audit(0.104:1): state=initialized
audit_enabled=0 res=1
[    0.106460] cpuidle: using governor menu
[    0.106691] vdso: 2 pages (1 code @ (____ptrval____), 1 data @
(____ptrval____))
[    0.106749] hw-breakpoint: found 6 breakpoint and 4 watchpoint
registers.
[    0.108376] DMA: preallocated 256 KiB pool for atomic allocations
[    0.112247] sh-pfc e6060000.pin-controller: r8a77965_pfc support
registered
[    0.146202] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.146965] cryptd: max_cpu_qlen set to 1000
[    0.153209] vgaarb: loaded
[    0.153581] SCSI subsystem initialized
[    0.153927] libata version 3.00 loaded.
[    0.154165] usbcore: registered new interface driver usbfs
[    0.154249] usbcore: registered new interface driver hub
[    0.154374] usbcore: registered new device driver usb
[    0.156184] i2c-sh_mobile e60b0000.i2c: I2C adapter 7, bus speed 400000
Hz
[    0.156730] media: Linux media interface: v0.10
[    0.156800] videodev: Linux video capture interface: v2.00
[    0.156924] pps_core: LinuxPPS API ver. 1 registered
[    0.156956] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.157020] PTP clock support registered
[    0.157073] EDAC MC: Ver: 3.0.0
[    0.158364] Advanced Linux Sound Architecture Driver Initialized.
[    0.159529] clocksource: Switched to clocksource arch_sys_counter
[    0.238280] VFS: Disk quotas dquot_6.6.0
[    0.238398] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    0.249396] NET: Registered protocol family 2
[    0.250315] tcp_listen_portaddr_hash hash table entries: 1024 (order: 4,
73728 bytes)
[    0.250492] TCP established hash table entries: 16384 (order: 5, 131072
bytes)
[    0.250587] TCP bind hash table entries: 16384 (order: 8, 1048576 bytes)
[    0.252472] TCP: Hash tables configured (established 16384 bind 16384)
[    0.252824] UDP hash table entries: 1024 (order: 5, 163840 bytes)
[    0.253116] UDP-Lite hash table entries: 1024 (order: 5, 163840 bytes)
[    0.253609] NET: Registered protocol family 1
[    0.254765] RPC: Registered named UNIX socket transport module.
[    0.254820] RPC: Registered udp transport module.
[    0.254850] RPC: Registered tcp transport module.
[    0.254880] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.254923] PCI: CLS 0 bytes, default 64
[    0.256118] hw perfevents: enabled with armv8_cortex_a57 PMU driver, 7
counters available
[    0.256712] kvm [1]: HYP mode not available
[    0.262582] workingset: timestamp_bits=46 max_order=19 bucket_order=0
[    0.273506] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.274481] NFS: Registering the id_resolver key type
[    0.274599] Key type id_resolver registered
[    0.274642] Key type id_legacy registered
[    0.274682] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.274733] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
Registering...
[    0.279467] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 245)
[    0.279647] io scheduler noop registered
[    0.279876] io scheduler cfq registered (default)
[    0.279911] io scheduler mq-deadline registered
[    0.279942] io scheduler kyber registered
[    0.285126] gpio_rcar e6050000.gpio: driving 16 GPIOs
[    0.285649] gpio_rcar e6051000.gpio: driving 29 GPIOs
[    0.286129] gpio_rcar e6052000.gpio: driving 15 GPIOs
[    0.286568] gpio_rcar e6053000.gpio: driving 16 GPIOs
[    0.287005] gpio_rcar e6054000.gpio: driving 18 GPIOs
[    0.287438] gpio_rcar e6055000.gpio: driving 26 GPIOs
[    0.288056] gpio_rcar e6055400.gpio: driving 32 GPIOs
[    0.288498] gpio_rcar e6055800.gpio: driving 4 GPIOs
[    0.290158] rcar-pcie fe000000.pcie: host bridge /soc/pcie@fe000000
ranges:
[    0.290238] rcar-pcie fe000000.pcie:    IO 0xfe100000..0xfe1fffff ->
0x00000000
[    0.290325] rcar-pcie fe000000.pcie:   MEM 0xfe200000..0xfe3fffff ->
0xfe200000
[    0.290388] rcar-pcie fe000000.pcie:   MEM 0x30000000..0x37ffffff ->
0x30000000
[    0.290442] rcar-pcie fe000000.pcie:   MEM 0x38000000..0x3fffffff ->
0x38000000
[    0.355586] rcar-pcie fe000000.pcie: PCIe link down
[    0.356211] rcar-pcie ee800000.pcie: host bridge /soc/pcie@ee800000
ranges:
[    0.356282] rcar-pcie ee800000.pcie:    IO 0xee900000..0xee9fffff ->
0x00000000
[    0.356348] rcar-pcie ee800000.pcie:   MEM 0xeea00000..0xeebfffff ->
0xeea00000
[    0.356410] rcar-pcie ee800000.pcie:   MEM 0xc0000000..0xc7ffffff ->
0xc0000000
[    0.356464] rcar-pcie ee800000.pcie:   MEM 0xc8000000..0xcfffffff ->
0xc8000000
[    0.423444] rcar-pcie ee800000.pcie: PCIe link down
[    0.424698] pwm-backlight backlight: Linked as a consumer to regulator.3
[    0.497733] SuperH (H)SCI(F) driver initialized
[    0.498836] e6550000.serial: ttySC1 at MMIO 0xe6550000 (irq = 28,
base_baud = 0) is a hscif
[    0.500165] e6e88000.serial: ttySC0 at MMIO 0xe6e88000 (irq = 110,
base_baud = 0) is a scif
[    1.381522] printk: console [ttySC0] enabled
[    1.388623] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.395328] [drm] No driver support for vblank timestamp query.
[    1.402388] rcar-dw-hdmi fead0000.hdmi: Detected HDMI TX controller
v2.01a with HDCP (DWC HDMI 2.0 TX PHY)
[    1.412740] rcar-dw-hdmi fead0000.hdmi: registered DesignWare HDMI I2C
bus driver
[    1.435731] loop: module loaded
[    1.441987] scsi host0: sata_rcar
[    1.445954] ata1: SATA max UDMA/133 irq 160
[    1.452142] libphy: Fixed MDIO Bus: probed
[    1.456656] tun: Universal TUN/TAP device driver, 1.6
[    1.462124] CAN device driver interface
[    1.467692] VFIO - User Level meta-driver version: 0.3
[    1.473231] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.479822] ehci-pci: EHCI PCI platform driver
[    1.484335] ehci-platform: EHCI generic platform driver
[    1.490520] ehci-platform ee0a0100.usb: EHCI Host Controller
[    1.496334] ehci-platform ee0a0100.usb: new USB bus registered, assigned
bus number 1
[    1.504725] ehci-platform ee0a0100.usb: irq 156, io mem 0xee0a0100
[    1.523548] ehci-platform ee0a0100.usb: USB 2.0 started, EHCI 1.10
[    1.531082] hub 1-0:1.0: USB hub found
[    1.534991] hub 1-0:1.0: 1 port detected
[    1.539907] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.546183] ohci-pci: OHCI PCI platform driver
[    1.550714] ohci-platform: OHCI generic platform driver
[    1.556697] ohci-platform ee0a0000.usb: Generic Platform OHCI controller
[    1.563486] ohci-platform ee0a0000.usb: new USB bus registered, assigned
bus number 2
[    1.571643] ohci-platform ee0a0000.usb: irq 156, io mem 0xee0a0000
[    1.666522] hub 2-0:1.0: USB hub found
[    1.670371] hub 2-0:1.0: 1 port detected
[    1.675757] xhci-hcd ee000000.usb: xHCI Host Controller
[    1.681059] xhci-hcd ee000000.usb: new USB bus registered, assigned bus
number 3
[    1.688800] xhci-hcd ee000000.usb: Direct firmware load for
r8a779x_usb3_v3.dlmem failed with error -2
[    1.698350] xhci-hcd ee000000.usb: can't setup: -2
[    1.703211] xhci-hcd ee000000.usb: USB bus 3 deregistered
[    1.708823] xhci-hcd: probe of ee000000.usb failed with error -2
[    1.715167] usbcore: registered new interface driver usb-storage
[    1.722160] renesas_usbhs e6590000.usb: host probed
[    1.727128] renesas_usbhs e6590000.usb: no transceiver found
[    1.733140] renesas_usbhs e6590000.usb: gadget probed
[    1.738490] renesas_usbhs e6590000.usb: probed
[    1.744707] renesas_usb3 ee020000.usb: probed with phy
[    1.750684] i2c /dev entries driver
[    1.763154] cs2000-cp 2-004f: revision - C1
[    1.767553] i2c-rcar e6510000.i2c: probed
[    1.772529] pca953x 4-0020: 4-0020 supply vcc not found, using dummy
regulator
[    1.780030] pca953x 4-0020: Linked as a consumer to regulator.0
[    1.787205] GPIO line 355 (PCIE/SATA switch) hogged as output/low
[    1.801115] random: fast init done
[    1.806749] i2c-rcar e66d8000.i2c: probed
[    1.811689] adv748x 4-0070: Endpoint
/soc/i2c@e66d8000/video-receiver@70/port@7/endpoint on port 7
[    1.820728] adv748x 4-0070: Endpoint
/soc/i2c@e66d8000/video-receiver@70/port@8/endpoint on port 8
[    1.829755] adv748x 4-0070: Endpoint
/soc/i2c@e66d8000/video-receiver@70/port@a/endpoint on port 10
[    1.838868] adv748x 4-0070: Endpoint
/soc/i2c@e66d8000/video-receiver@70/port@b/endpoint on port 11
[    1.848533] adv748x 4-0070: chip found @ 0xe0 revision 2143
[    1.867574] ata1: link resume succeeded after 1 retries
[    1.965229] rcar_fdp1 fe940000.fdp1: Device registered as /dev/video0
[    1.971904] rcar_fdp1 fe940000.fdp1: FDP1 Unidentifiable (0x02010204)
[    1.979446] ata1: SATA link down (SStatus 0 SControl 300)
[    1.996718] rcar-csi2 fea80000.csi2: 1 lanes found
[    2.001841] rcar-csi2 feaa0000.csi2: 4 lanes found
[    2.010703] 
[    2.012201] ======================================================
[    2.018379] WARNING: possible circular locking dependency detected
[    2.024558] 4.20.0-rc3-arm64-renesas #283 Not tainted
[    2.029607] ------------------------------------------------------
[    2.035785] swapper/0/1 is trying to acquire lock:
[    2.040573] (____ptrval____) (&group->lock){+.+.}, at:
rvin_group_notify_bound+0x30/0xa8
[    2.048677] 
[    2.048677] but task is already holding lock:
[    2.054507] (____ptrval____) (list_lock){+.+.}, at:
__v4l2_async_notifier_register+0x48/0x158
[    2.063041] 
[    2.063041] which lock already depends on the new lock.
[    2.063041] 
[    2.071218] 
[    2.071218] the existing dependency chain (in reverse order) is:
[    2.078699] 
[    2.078699] -> #1 (list_lock){+.+.}:
[    2.083757]        __mutex_lock+0x70/0x840
[    2.087851]        mutex_lock_nested+0x1c/0x28
[    2.092292]        v4l2_async_notifier_init+0x28/0x48
[    2.097341]        rcar_vin_probe+0x504/0x6a0
[    2.101700]        platform_drv_probe+0x50/0xa0
[    2.106228]        really_probe+0x20c/0x2b0
[    2.110409]        driver_probe_device+0x58/0x108
[    2.115112]        __driver_attach+0xe4/0xe8
[    2.119379]        bus_for_each_dev+0x74/0xc8
[    2.123734]        driver_attach+0x20/0x28
[    2.127828]        bus_add_driver+0x1b0/0x220
[    2.132182]        driver_register+0x60/0x110
[    2.136537]        __platform_driver_register+0x40/0x48
[    2.141763]        rcar_vin_driver_init+0x18/0x20
[    2.146467]        do_one_initcall+0x180/0x36c
[    2.150907]        kernel_init_freeable+0x478/0x51c
[    2.155784]        kernel_init+0x10/0x100
[    2.159793]        ret_from_fork+0x10/0x1c
[    2.163885] 
[    2.163885] -> #0 (&group->lock){+.+.}:
[    2.169200]        lock_acquire+0xc0/0x230
[    2.173293]        __mutex_lock+0x70/0x840
[    2.177386]        mutex_lock_nested+0x1c/0x28
[    2.181826]        rvin_group_notify_bound+0x30/0xa8
[    2.186788]        v4l2_async_match_notify+0x54/0x138
[    2.191838]        v4l2_async_notifier_try_all_subdevs+0x5c/0xc0
[    2.197843]        __v4l2_async_notifier_register+0xe8/0x158
[    2.203500]        v4l2_async_notifier_register+0x40/0x68
[    2.208895]        rcar_vin_probe+0x588/0x6a0
[    2.213249]        platform_drv_probe+0x50/0xa0
[    2.217777]        really_probe+0x20c/0x2b0
[    2.221958]        driver_probe_device+0x58/0x108
[    2.226659]        __driver_attach+0xe4/0xe8
[    2.230927]        bus_for_each_dev+0x74/0xc8
[    2.235281]        driver_attach+0x20/0x28
[    2.239374]        bus_add_driver+0x1b0/0x220
[    2.243728]        driver_register+0x60/0x110
[    2.248082]        __platform_driver_register+0x40/0x48
[    2.253304]        rcar_vin_driver_init+0x18/0x20
[    2.258005]        do_one_initcall+0x180/0x36c
[    2.262446]        kernel_init_freeable+0x478/0x51c
[    2.267321]        kernel_init+0x10/0x100
[    2.271327]        ret_from_fork+0x10/0x1c
[    2.275419] 
[    2.275419] other info that might help us debug this:
[    2.275419] 
[    2.283423]  Possible unsafe locking scenario:
[    2.283423] 
[    2.289340]        CPU0                    CPU1
[    2.293865]        ----                    ----
[    2.298391]   lock(list_lock);
[    2.301442]                                lock(&group->lock);
[    2.307272]                                lock(list_lock);
[    2.312842]   lock(&group->lock);
[    2.316153] 
[    2.316153]  *** DEADLOCK ***
[    2.316153] 
[    2.322073] 2 locks held by swapper/0/1:
[    2.325991]  #0: (____ptrval____) (&dev->mutex){....}, at:
__driver_attach+0x5c/0xe8
[    2.333737]  #1: (____ptrval____) (list_lock){+.+.}, at:
__v4l2_async_notifier_register+0x48/0x158
[    2.342699] 
[    2.342699] stack backtrace:
[    2.347057] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
4.20.0-rc3-arm64-renesas #283
[    2.354712] Hardware name: Renesas Salvator-X 2nd version board based on
r8a77965 (DT)
[    2.362628] Call trace:
[    2.365073]  dump_backtrace+0x0/0x1c0
[    2.368732]  show_stack+0x14/0x20
[    2.372046]  dump_stack+0xbc/0xf4
[    2.375358]  print_circular_bug.isra.19+0x1d4/0x2e8
[    2.380233]  __lock_acquire+0x12e8/0x1800
[    2.384239]  lock_acquire+0xc0/0x230
[    2.387811]  __mutex_lock+0x70/0x840
[    2.391383]  mutex_lock_nested+0x1c/0x28
[    2.395302]  rvin_group_notify_bound+0x30/0xa8
[    2.399743]  v4l2_async_match_notify+0x54/0x138
[    2.404271]  v4l2_async_notifier_try_all_subdevs+0x5c/0xc0
[    2.409754]  __v4l2_async_notifier_register+0xe8/0x158
[    2.414890]  v4l2_async_notifier_register+0x40/0x68
[    2.419765]  rcar_vin_probe+0x588/0x6a0
[    2.423598]  platform_drv_probe+0x50/0xa0
[    2.427605]  really_probe+0x20c/0x2b0
[    2.431264]  driver_probe_device+0x58/0x108
[    2.435444]  __driver_attach+0xe4/0xe8
[    2.439190]  bus_for_each_dev+0x74/0xc8
[    2.443023]  driver_attach+0x20/0x28
[    2.446595]  bus_add_driver+0x1b0/0x220
[    2.450428]  driver_register+0x60/0x110
[    2.454261]  __platform_driver_register+0x40/0x48
[    2.458962]  rcar_vin_driver_init+0x18/0x20
[    2.463142]  do_one_initcall+0x180/0x36c
[    2.467061]  kernel_init_freeable+0x478/0x51c
[    2.471415]  kernel_init+0x10/0x100
[    2.474901]  ret_from_fork+0x10/0x1c
[    2.479311] rcar-vin e6ef0000.video: Device registered as video11
[    2.485571] rcar-vin e6ef1000.video: Device registered as video12
[    2.491808] rcar-vin e6ef2000.video: Device registered as video13
[    2.498039] rcar-vin e6ef3000.video: Device registered as video14
[    2.504291] rcar-vin e6ef4000.video: Device registered as video15
[    2.510527] rcar-vin e6ef5000.video: Device registered as video16
[    2.516772] rcar-vin e6ef6000.video: Device registered as video17
[    2.523000] rcar-vin e6ef7000.video: Device registered as video18
[    2.534628] rcar_gen3_thermal e6198000.thermal: TSC0: Loaded 1 trip
points
[    2.545646] rcar_gen3_thermal e6198000.thermal: TSC1: Loaded 1 trip
points
[    2.556637] rcar_gen3_thermal e6198000.thermal: TSC2: Loaded 1 trip
points
[    2.565665] cpufreq: cpufreq_online: CPU0: Running at unlisted freq:
1497600 KHz
[    2.573145] cpufreq: cpufreq_online: CPU0: Unlisted initial frequency
changed to: 1500000 KHz
[    2.582928] renesas_sdhi_internal_dmac ee100000.sd: Got CD GPIO
[    2.588933] renesas_sdhi_internal_dmac ee100000.sd: Got WP GPIO
[    2.595712] renesas_sdhi_internal_dmac ee140000.sd: Linked as a consumer
to regulator.2
[    2.603846] renesas_sdhi_internal_dmac ee140000.sd: Linked as a consumer
to regulator.1
[    2.660495] renesas_sdhi_internal_dmac ee140000.sd: mmc0 base at
0xee140000 max clock rate 200 MHz
[    2.670133] renesas_sdhi_internal_dmac ee160000.sd: Got CD GPIO
[    2.676212] renesas_sdhi_internal_dmac ee160000.sd: Got WP GPIO
[    2.683001] ledtrig-cpu: registered to indicate activity on CPUs
[    2.689793] usbcore: registered new interface driver usbhid
[    2.695434] usbhid: USB HID core driver
[    2.720993] rcar_sound ec500000.sound: probed
[    2.725796] NET: Registered protocol family 17
[    2.730284] can: controller area network core (rev 20170425 abi 9)
[    2.736572] NET: Registered protocol family 29
[    2.741050] can: raw protocol (rev 20170425)
[    2.745348] can: broadcast manager protocol (rev 20170425 t)
[    2.751042] can: netlink gateway (rev 20170425) max_hops=1
[    2.756751] Key type dns_resolver registered
[    2.761614] registered taskstats version 1
[    2.773596] mmc0: new HS200 MMC card at address 0001
[    2.779233] mmcblk0: mmc0:0001 BGSD3R 29.1 GiB 
[    2.783483] renesas_irqc e61c0000.interrupt-controller: driving 6 irqs
[    2.784162] mmcblk0boot0: mmc0:0001 BGSD3R partition 1 16.0 MiB
[    2.792685] phy_rcar_gen3_usb2 ee080200.usb-phy: Linked as a consumer to
regulator.4
[    2.796641] mmcblk0boot1: mmc0:0001 BGSD3R partition 2 16.0 MiB
[    2.805663] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    2.810272] mmcblk0rpmb: mmc0:0001 BGSD3R partition 3 4.00 MiB, chardev
(243:0)
[    2.816755] [drm] No driver support for vblank timestamp query.
<no more output>
