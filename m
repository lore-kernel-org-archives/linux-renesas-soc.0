Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:35427 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750735AbdATFF2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 00:05:28 -0500
Subject: Re: The failure summary report of GEN2 for linux stable v4.10-rc2
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1484558970996626000058af@nat.cybozu.com>
 <1988000.69YelQnMiB@avalon>
 <8a056d37-3de9-30ac-74bc-e1393d1b193a@jinso.co.jp>
 <5001200.M7izD2cjP9@avalon>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        na-hoan@jinso.co.jp
From: DongCV <cv-dong@jinso.co.jp>
Message-ID: <53275dcd-a10d-a9b1-6354-04f146eb633f@jinso.co.jp>
Date: Fri, 20 Jan 2017 12:11:50 +0900
MIME-Version: 1.0
In-Reply-To: <5001200.M7izD2cjP9@avalon>
Content-Type: multipart/mixed;
 boundary="------------E7E926AE3B89A3ED064238AC"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------E7E926AE3B89A3ED064238AC
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Dear Mr Laurent,

Thank you for your quick reply.
This is the log file contains information about the command "modetest -M 
rcar-du" (with the HDMI cable plugged).
Thank you very much.

Jinso Linux team
Dong


On 01/20/2017 08:49 AM, Laurent Pinchart wrote:
> Dear Dong,
>
> On Thursday 19 Jan 2017 18:14:45 DongCV wrote:
>> Dear Mr Laurent
>>
>> I apologize for the misunderstanding.
> No worries, I should have been more precise.
>
>> I've retested the HDMI output on Lager(H2) with v4.10-rc2.
>>
>> The results:
>>
>> Enabled CMA:
>>
>> The HDMI cable unplugged: Could not recognize the display.
>> The HDMI cable plugged: Recognized the display-> test fail.
>>
>> The VGA cable unplugged: Recognized the display-> test ok.
>> The VGA cable plugged: Recognized the display-> test ok.
>>
>>
>> Disabled CMA: The same to the case of enabled CMA.
>>
>> I attach the test procedures and test tool, test result.
>> Please have a look at it.
> I've followed the same test procedure:
>
> - Check out kernel v4.10-rc2
> - Compile the kernel with the CONFIG_CMA_ENABLE.txt you have provided
> - Disconnect the VGA and HDMI cables
> - Turn the power on to the Lager board, let it boot
> - Plug the HDMI cable
> - Run 'bmap /dev/fb0 hdmi.bmp' with the hdmi.bmp file you have provided
>
> The output on the display is fine, identical to your 'VGA_Image.jpg' picture.
>
> At this point I believe the key difference between our setups is the HDMI
> monitor. Could you please send me the output of
>
> modetest -M rcar-du
>
> with the HDMI cable plugged ?
>


--------------E7E926AE3B89A3ED064238AC
Content-Type: text/plain; charset=UTF-8;
 name="Log_info_modetest_rcar_du_command.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="Log_info_modetest_rcar_du_command.txt"

LAGER SPI_LOADER V0.27 2014.06.20
DEVICE S25FL512


U-Boot 2016.01 (Jul 27 2016 - 15:27:42 +0900)

CPU: Renesas Electronics R8A7790 rev 2.0
Board: Lager
I2C:   ready
DRAM:  512 MiB
MMC:   sh_mmcif: 0, sh-sdhi: 1, sh-sdhi: 2
SF: Detected S25FL512S_256K with page size 512 Bytes, erase size 256 KiB, total 64 MiB
In:    serial_sh
Out:   serial_sh
Err:   serial_sh
Net:   sh_eth
Hit any key to stop autoboot:  0 
sh_eth Waiting for PHY auto negotiation to complete.. done
sh_eth: 100Base/Half
BOOTP broadcast 1
BOOTP broadcast 2
BOOTP broadcast 3
BOOTP broadcast 4
BOOTP broadcast 5
BOOTP broadcast 6
DHCP client bound to address 192.168.1.235 (5781 ms)
Using sh_eth device
TFTP from server 192.168.1.225; our IP address is 192.168.1.235
Filename 'lager/uImage.dtb'.
Load address: 0x40007fc0
Loading: #################################################################
         #################################################################
         #################################################################
         #############################################################
         7.2 MiB/s
done
Bytes transferred = 3750536 (393a88 hex)
## Booting kernel from Legacy Image at 40007fc0 ...
   Image Name:   Linux-v4.10-rc2
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3750472 Bytes = 3.6 MiB
   Load Address: 40008000
   Entry Point:  40008000
   Verifying Checksum ... OK
   XIP Kernel Image ... OK

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.10.0-rc2-dirty (dong@dong-Jinso) (gcc version 4.8.4 (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.1) ) #327 SMP Fri Jan 20 11:30:16 JST 2017
[    0.000000] CPU: ARMv7 Processor [413fc0f2] revision 2 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction cache
[    0.000000] OF: fdt:Machine model: Lager
[    0.000000] OF: fdt:Ignoring memory block 0x140000000 - 0x200000000
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] On node 0 totalpages: 262144
[    0.000000] free_area_init_node: node 0, pgdat c0a32840, node_mem_map ef7f9000
[    0.000000]   Normal zone: 1536 pages used for memmap
[    0.000000]   Normal zone: 0 pages reserved
[    0.000000]   Normal zone: 196608 pages, LIFO batch:31
[    0.000000]   HighMem zone: 65536 pages, LIFO batch:15
[    0.000000] percpu: Embedded 12 pages/cpu @ef775000 s25152 r0 d24000 u49152
[    0.000000] pcpu-alloc: s25152 r0 d24000 u49152 alloc=12*4096
[    0.000000] pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260608
[    0.000000] Kernel command line: console=ttySC0,38400 ignore_loglevel rw root=/dev/nfs ip=dhcp
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
[    0.000000] Memory: 1029252K/1048576K available (6144K kernel code, 207K rwdata, 1488K rodata, 1024K init, 300K bss, 19324K reserved, 0K cma-reserved, 262144K highmem)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
[    0.000000]     vmalloc : 0xf0800000 - 0xff800000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xf0000000   ( 768 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0700000   (7136 kB)
[    0.000000]       .init : 0xc0900000 - 0xc0a00000   (1024 kB)
[    0.000000]       .data : 0xc0a00000 - 0xc0a33c60   ( 208 kB)
[    0.000000]        .bss : 0xc0a35000 - 0xc0a8020c   ( 301 kB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 32.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at 10.00MHz (virt).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x24e6a1710, max_idle_ns: 440795202120 ns
[    0.000004] sched_clock: 56 bits at 10MHz, resolution 100ns, wraps every 4398046511100ns
[    0.000012] Switching to timer-based delay loop, resolution 100ns
[    0.000523] Console: colour dummy device 80x30
[    0.000545] Calibrating delay loop (skipped), value calculated using timer frequency.. 20.00 BogoMIPS (lpj=100000)
[    0.000558] pid_max: default: 32768 minimum: 301
[    0.000669] Mount-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000677] Mountpoint-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.001169] CPU: Testing write buffer coherency: ok
[    0.001424] CPU0: update cpu_capacity 1535
[    0.001432] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.002438] Setting up static identity map for 0x40100000 - 0x40100058
[    0.003034] smp: Bringing up secondary CPUs ...
[    0.005241] CPU1: update cpu_capacity 1535
[    0.005246] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.006207] CPU2: update cpu_capacity 1535
[    0.006212] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.007171] CPU3: update cpu_capacity 1535
[    0.007177] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.007825] CPU4: failed to boot: -22
[    0.008478] CPU5: failed to boot: -22
[    0.009124] CPU6: failed to boot: -22
[    0.009768] CPU7: failed to boot: -22
[    0.009923] smp: Brought up 1 node, 4 CPUs
[    0.009930] SMP: Total of 4 processors activated (80.00 BogoMIPS).
[    0.009936] CPU: All CPU(s) started in SVC mode.
[    0.010974] devtmpfs: initialized
[    0.020994] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.021383] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.021503] pinctrl core: initialized pinctrl subsystem
[    0.021644] Detected Renesas R-Car Gen2 r8a7790 ES2.0
[    0.022203] NET: Registered protocol family 16
[    0.022357] DMA: preallocated 256 KiB pool for atomic coherent allocations
[    0.023424] No ATAGs?
[    0.023452] hw-breakpoint: Failed to enable monitor mode on CPU 0.
[    0.023554] IRQ2 is asserted, installing da9063/da9210 regulator quirk
[    0.026248] renesas_irqc e61c0000.interrupt-controller: driving 4 irqs
[    0.031211] sh-pfc e6060000.pfc: r8a77900_pfc support registered
[    0.047063] vgaarb: loaded
[    0.047321] SCSI subsystem initialized
[    0.047495] libata version 3.00 loaded.
[    0.047702] usbcore: registered new interface driver usbfs
[    0.047748] usbcore: registered new interface driver hub
[    0.047841] usbcore: registered new device driver usb
[    0.049110] i2c-sh_mobile e6520000.i2c: I2C adapter 6, bus speed 100000 Hz
[    0.049547] i2c 7-0058: clearing da9063/da9210 interrupts
[    0.050697] i2c 7-0058: IRQ2 is not asserted, removing quirk
[    0.050845] i2c-sh_mobile e60b0000.i2c: I2C adapter 7, bus speed 100000 Hz
[    0.051068] media: Linux media interface: v0.10
[    0.051117] Linux video capture interface: v2.00
[    0.051457] sh_cmt ffca0000.timer: ch0: used for clock events
[    0.051470] sh_cmt ffca0000.timer: ch1: used as clock source
[    0.051481] clocksource: ffca0000.timer: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000000 ns
[    0.052109] Advanced Linux Sound Architecture Driver Initialized.
[    0.052629] sh_cmt ffca0000.timer: PM domain always-on will not be powered off
[    0.052791] clocksource: Switched to clocksource arch_sys_counter
[    0.061531] NET: Registered protocol family 2
[    0.061961] TCP established hash table entries: 8192 (order: 3, 32768 bytes)
[    0.062013] TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
[    0.062108] TCP: Hash tables configured (established 8192 bind 8192)
[    0.062147] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.062170] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.062328] NET: Registered protocol family 1
[    0.062680] RPC: Registered named UNIX socket transport module.
[    0.062687] RPC: Registered udp transport module.
[    0.062693] RPC: Registered tcp transport module.
[    0.062698] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.062708] PCI: CLS 0 bytes, default 64
[    0.064473] futex hash table entries: 2048 (order: 5, 131072 bytes)
[    0.065009] workingset: timestamp_bits=30 max_order=18 bucket_order=0
[    0.065460] NFS: Registering the id_resolver key type
[    0.065481] Key type id_resolver registered
[    0.065488] Key type id_legacy registered
[    0.065501] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.065507] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.066969] bounce: pool size: 64 pages
[    0.067019] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.067027] io scheduler noop registered
[    0.067034] io scheduler deadline registered
[    0.067058] io scheduler cfq registered (default)
[    0.069232] gpio_rcar e6050000.gpio: driving 32 GPIOs
[    0.070392] gpio_rcar e6051000.gpio: driving 30 GPIOs
[    0.071519] gpio_rcar e6052000.gpio: driving 30 GPIOs
[    0.072694] gpio_rcar e6053000.gpio: driving 32 GPIOs
[    0.073893] gpio_rcar e6054000.gpio: driving 32 GPIOs
[    0.075096] gpio_rcar e6055000.gpio: driving 32 GPIOs
[    0.075838] pci-rcar-gen2 ee090000.pci: PCI: bus0 revision 11
[    0.076002] pci-rcar-gen2 ee090000.pci: PCI host bridge to bus 0000:00
[    0.076012] pci_bus 0000:00: root bus resource [mem 0xee080000-0xee0810ff]
[    0.076020] pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
[    0.076052] pci 0000:00:00.0: [1033:0000] type 00 class 0x060000
[    0.076074] pci 0000:00:00.0: reg 0x10: [mem 0xee090800-0xee090bff]
[    0.076085] pci 0000:00:00.0: reg 0x14: [mem 0x40000000-0x7fffffff pref]
[    0.076300] pci 0000:00:01.0: [1033:0035] type 00 class 0x0c0310
[    0.076321] pci 0000:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[    0.076393] pci 0000:00:01.0: supports D1 D2
[    0.076400] pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot
[    0.076610] pci 0000:00:02.0: [1033:00e0] type 00 class 0x0c0320
[    0.076630] pci 0000:00:02.0: reg 0x10: [mem 0x00000000-0x000000ff]
[    0.076701] pci 0000:00:02.0: supports D1 D2
[    0.076708] pci 0000:00:02.0: PME# supported from D0 D1 D2 D3hot
[    0.076921] PCI: bus0: Fast back to back transfers disabled
[    0.076931] pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
[    0.077011] pci 0000:00:01.0: BAR 0: assigned [mem 0xee080000-0xee080fff]
[    0.077023] pci 0000:00:02.0: BAR 0: assigned [mem 0xee081000-0xee0810ff]
[    0.077056] pci 0000:00:01.0: enabling device (0140 -> 0142)
[    0.077090] pci 0000:00:02.0: enabling device (0140 -> 0142)
[    0.077329] pci-rcar-gen2 ee0b0000.pci: PCI: bus0 revision 11
[    0.077479] pci-rcar-gen2 ee0b0000.pci: PCI host bridge to bus 0001:01
[    0.077487] pci_bus 0001:01: root bus resource [mem 0xee0a0000-0xee0a10ff]
[    0.077495] pci_bus 0001:01: No busn resource found for root bus, will use [bus 01-ff]
[    0.077515] pci 0001:01:00.0: [1033:0000] type 00 class 0x060000
[    0.077532] pci 0001:01:00.0: reg 0x10: [mem 0xee0b0800-0xee0b0bff]
[    0.077543] pci 0001:01:00.0: reg 0x14: [mem 0x40000000-0x7fffffff pref]
[    0.077734] pci 0001:01:01.0: [1033:0035] type 00 class 0x0c0310
[    0.077756] pci 0001:01:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[    0.077827] pci 0001:01:01.0: supports D1 D2
[    0.077834] pci 0001:01:01.0: PME# supported from D0 D1 D2 D3hot
[    0.078020] pci 0001:01:02.0: [1033:00e0] type 00 class 0x0c0320
[    0.078041] pci 0001:01:02.0: reg 0x10: [mem 0x00000000-0x000000ff]
[    0.078112] pci 0001:01:02.0: supports D1 D2
[    0.078118] pci 0001:01:02.0: PME# supported from D0 D1 D2 D3hot
[    0.078313] PCI: bus1: Fast back to back transfers disabled
[    0.078322] pci_bus 0001:01: busn_res: [bus 01-ff] end is updated to 01
[    0.078448] pci 0001:01:01.0: BAR 0: assigned [mem 0xee0a0000-0xee0a0fff]
[    0.078459] pci 0001:01:02.0: BAR 0: assigned [mem 0xee0a1000-0xee0a10ff]
[    0.078488] pci 0001:01:01.0: enabling device (0140 -> 0142)
[    0.078521] pci 0001:01:02.0: enabling device (0140 -> 0142)
[    0.078691] pci-rcar-gen2 ee0d0000.pci: PCI: bus0 revision 11
[    0.078839] pci-rcar-gen2 ee0d0000.pci: PCI host bridge to bus 0002:02
[    0.078848] pci_bus 0002:02: root bus resource [mem 0xee0c0000-0xee0c10ff]
[    0.078855] pci_bus 0002:02: No busn resource found for root bus, will use [bus 02-ff]
[    0.078880] pci 0002:02:00.0: [1033:0000] type 00 class 0x060000
[    0.078897] pci 0002:02:00.0: reg 0x10: [mem 0xee0d0800-0xee0d0bff]
[    0.078908] pci 0002:02:00.0: reg 0x14: [mem 0x40000000-0x7fffffff pref]
[    0.079100] pci 0002:02:01.0: [1033:0035] type 00 class 0x0c0310
[    0.079120] pci 0002:02:01.0: reg 0x10: [mem 0x00000000-0x00000fff]
[    0.079192] pci 0002:02:01.0: supports D1 D2
[    0.079199] pci 0002:02:01.0: PME# supported from D0 D1 D2 D3hot
[    0.079396] pci 0002:02:02.0: [1033:00e0] type 00 class 0x0c0320
[    0.079416] pci 0002:02:02.0: reg 0x10: [mem 0x00000000-0x000000ff]
[    0.079486] pci 0002:02:02.0: supports D1 D2
[    0.079492] pci 0002:02:02.0: PME# supported from D0 D1 D2 D3hot
[    0.079695] PCI: bus2: Fast back to back transfers disabled
[    0.079704] pci_bus 0002:02: busn_res: [bus 02-ff] end is updated to 02
[    0.079879] pci 0002:02:01.0: BAR 0: assigned [mem 0xee0c0000-0xee0c0fff]
[    0.079890] pci 0002:02:02.0: BAR 0: assigned [mem 0xee0c1000-0xee0c10ff]
[    0.079918] pci 0002:02:01.0: enabling device (0140 -> 0142)
[    0.079951] pci 0002:02:02.0: enabling device (0140 -> 0142)
[    0.093400] DA9210: Bringing 1080000uV into 1000000-1000000uV
[    0.099165] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.100333] SuperH (H)SCI(F) driver initialized
[    0.100839] e6c50000.serial: ttySC1 at MMIO 0xe6c50000 (irq = 101, base_baud = 0) is a scifa
[    0.101388] e6e60000.serial: ttySC0 at MMIO 0xe6e60000 (irq = 102, base_baud = 0) is a scif
[    3.483617] console [ttySC0] enabled
[    3.494858] [drm] Initialized
[    3.504759] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.524589] [drm] No driver support for vblank timestamp query.
[    3.557192] da9063 7-0058: Device detected (chip-ID: 0x61, var-ID: 0x30)
[    3.578440] random: fast init done
[    3.601333] scsi host0: sata_rcar
[    3.611470] ata1: SATA max UDMA/133 irq 104
[    3.624776] renesas_spi e6b10000.spi: DMA available
[    3.640144] m25p80 spi0.0: s25fl512s (65536 Kbytes)
[    3.654787] 3 ofpart partitions found on MTD device spi0.0
[    3.671223] Creating 3 MTD partitions on "spi0.0":
[    3.685577] 0x000000000000-0x000000040000 : "loader"
[    3.701339] 0x000000040000-0x000000440000 : "user"
[    3.716515] 0x000000440000-0x000004000000 : "flash"
[    3.731956] renesas_spi e6b10000.spi: probed
[    3.745563] spi_sh_msiof e6e10000.spi: DMA available
[    3.761168] libphy: Fixed MDIO Bus: probed
[    3.774017] CAN device driver interface
[    3.786391] libphy: sh_mii: probed
[    3.797669] sh-eth ee700000.ethernet eth0: Base address at 0xee700000, 2e:09:0a:00:3d:c1, IRQ 103.
[    3.824827] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.844391] ehci-pci: EHCI PCI platform driver
[    3.857839] ehci-pci 0000:00:02.0: EHCI Host Controller
[    3.873513] ehci-pci 0000:00:02.0: new USB bus registered, assigned bus number 1
[    3.895779] ehci-pci 0000:00:02.0: irq 119, io mem 0xee081000
[    3.942806] ehci-pci 0000:00:02.0: USB 2.0 started, EHCI 1.00
[    3.960740] hub 1-0:1.0: USB hub found
[    3.972003] hub 1-0:1.0: 1 port detected
[    3.984163] ehci-pci 0001:01:02.0: EHCI Host Controller
[    3.999836] ehci-pci 0001:01:02.0: new USB bus registered, assigned bus number 2
[    4.022089] ehci-pci 0001:01:02.0: irq 120, io mem 0xee0a1000
[    4.062796] ehci-pci 0001:01:02.0: USB 2.0 started, EHCI 1.00
[    4.072794] ata1: link resume succeeded after 1 retries
[    4.096323] hub 2-0:1.0: USB hub found
[    4.107584] hub 2-0:1.0: 1 port detected
[    4.119748] ehci-pci 0002:02:02.0: EHCI Host Controller
[    4.135422] ehci-pci 0002:02:02.0: new USB bus registered, assigned bus number 3
[    4.157671] ehci-pci 0002:02:02.0: irq 121, io mem 0xee0c1000
[    4.182809] ata1: SATA link down (SStatus 0 SControl 300)
[    4.202797] ehci-pci 0002:02:02.0: USB 2.0 started, EHCI 1.00
[    4.220647] hub 3-0:1.0: USB hub found
[    4.231923] hub 3-0:1.0: 1 port detected
[    4.244038] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    4.262561] ohci-pci: OHCI PCI platform driver
[    4.275935] ohci-pci 0000:00:01.0: OHCI PCI host controller
[    4.292644] ohci-pci 0000:00:01.0: new USB bus registered, assigned bus number 4
[    4.314839] ohci-pci 0000:00:01.0: irq 119, io mem 0xee080000
[    4.423435] hub 4-0:1.0: USB hub found
[    4.434699] hub 4-0:1.0: 1 port detected
[    4.446809] ohci-pci 0001:01:01.0: OHCI PCI host controller
[    4.463523] ohci-pci 0001:01:01.0: new USB bus registered, assigned bus number 5
[    4.485720] ohci-pci 0001:01:01.0: irq 120, io mem 0xee0a0000
[    4.603437] hub 5-0:1.0: USB hub found
[    4.614700] hub 5-0:1.0: 1 port detected
[    4.626829] ohci-pci 0002:02:01.0: OHCI PCI host controller
[    4.643544] ohci-pci 0002:02:01.0: new USB bus registered, assigned bus number 6
[    4.665741] ohci-pci 0002:02:01.0: irq 121, io mem 0xee0c0000
[    4.783428] hub 6-0:1.0: USB hub found
[    4.794690] hub 6-0:1.0: 1 port detected
[    4.807125] sh-pfc e6060000.pfc: pin GP_5_19 already requested by ee090000.pci; cannot claim for e6590000.usb
[    4.836849] sh-pfc e6060000.pfc: pin-179 (e6590000.usb) status -22
[    4.855370] sh-pfc e6060000.pfc: could not request pin 179 (GP_5_19) from group usb0_ovc_vbus  on device sh-pfc
[    4.885608] renesas_usbhs e6590000.usb: Error applying setting, reverse things back
[    4.908560] renesas_usbhs: probe of e6590000.usb failed with error -22
[    4.928308] udc-core: couldn't find an available UDC - added [g_ether] to list of pending drivers
[    4.955070] mousedev: PS/2 mouse device common for all mice
[    4.987273] da9063-rtc da9063-rtc: rtc core: registered da9063-rtc as rtc0
[    5.012974] i2c /dev entries driver
[    5.025164] i2c-sh_mobile e6500000.i2c: I2C adapter 4, bus speed 100000 Hz
[    5.046969] i2c-sh_mobile e6510000.i2c: I2C adapter 5, bus speed 100000 Hz
[    5.068128] adv7180 6-0020: chip found @ 0x20 (e6520000.i2c)
[    5.103904] Error: Driver 'adv7511' is already registered, aborting...
[    5.124207] rcar_jpu fe980000.jpeg-codec: encoder device registered as /dev/video0
[    5.146904] rcar_jpu fe980000.jpeg-codec: decoder device registered as /dev/video1
[    5.187461] rcar-vin e6ef1000.video: Device registered as video30
[    5.208286] rcar_thermal e61f0000.thermal: 1 sensor probed
[    5.231122] sh_mobile_sdhi ee100000.sd: Got CD GPIO
[    5.246348] sh_mobile_sdhi ee140000.sd: Got CD GPIO
[    5.312823] sh_mmcif ee220000.mmc: Chip version 0x0003, clock rate 12MHz
[    5.333650] usbcore: registered new interface driver usbhid
[    5.350359] usbhid: USB HID core driver
[    5.368753] rcar_sound ec500000.sound: probed
[    5.382162] NET: Registered protocol family 10
[    5.396109] Segment Routing with IPv6
[    5.407135] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    5.425429] NET: Registered protocol family 17
[    5.438748] can: controller area network core (rev 20120528 abi 9)
[    5.457308] NET: Registered protocol family 29
[    5.470620] can: raw protocol (rev 20120528)
[    5.483409] can: broadcast manager protocol (rev 20161123 t)
[    5.500368] can: netlink gateway (rev 20130117) max_hops=1
[    5.516874] Key type dns_resolver registered
[    5.529746] Registering SWP/SWPB emulation handler
[    5.546688] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.566518] [drm] No driver support for vblank timestamp query.
[    5.610413] Console: switching to colour frame buffer device 128x48
[    5.635695] rcar-du feb00000.display: fb0:  frame buffer device
[    5.653782] [drm] Device feb00000.display probed
[    5.668183] sh_mobile_sdhi ee100000.sd: Got CD GPIO
[    5.892971] sh_mobile_sdhi ee100000.sd: mmc1 base at 0xee100000 max clock rate 195 MHz
[    5.917214] sh_mobile_sdhi ee140000.sd: Got CD GPIO
[    5.917785] mmc0: new high speed MMC card at address 0001
[    5.918205] mmcblk0: mmc0:0001 MMC08G 7.33 GiB 
[    5.918379] mmcblk0boot0: mmc0:0001 MMC08G partition 1 2.00 MiB
[    5.918549] mmcblk0boot1: mmc0:0001 MMC08G partition 2 2.00 MiB
[    5.920285]  mmcblk0: p1 p2
[    6.212966] sh_mobile_sdhi ee140000.sd: mmc2 base at 0xee140000 max clock rate 97 MHz
[    6.238040] asoc-simple-card sound: ak4642-hifi <-> ec500000.sound mapping ok
[    6.260981] input: keyboard as /devices/platform/keyboard/input/input0
[    6.282473] da9063-rtc da9063-rtc: setting system clock to 2000-01-01 00:00:01 UTC (946684801)
[    6.405044] Micrel KSZ8041RNLI ee700000.etherne:01: attached PHY driver [Micrel KSZ8041RNLI] (mii_bus:phy_addr=ee700000.etherne:01, irq=340)
[    6.442929] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
[    8.398541] sh-eth ee700000.ethernet eth0: Link is Up - 100Mbps/Full - flow control off
[    8.402811] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
[    8.432798] Sending DHCP requests ..., OK
[   16.362792] IP-Config: Got DHCP answer from 192.168.1.225, my address is 192.168.1.235
[   16.386532] IP-Config: Complete:
[   16.396204]      device=eth0, hwaddr=2e:09:0a:00:3d:c1, ipaddr=192.168.1.235, mask=255.255.255.0, gw=192.168.1.225
[   16.427225]      host=192.168.1.235, domain=, nis-domain=(none)
[   16.444966]      bootserver=192.168.1.225, rootserver=192.168.1.225, rootpath=     nameserver0=192.168.1.225, nameserver1=192.168.1.235, nameserver2=8.8.8.8
[   16.487222] SDHI0 Vcc: disabling
[   16.496902] SDHI2 Vcc: disabling
[   16.506573] SDHI0 VccQ: disabling
[   16.516498] SDHI2 VccQ: disabling
[   16.526422] ALSA device list:
[   16.535303]   #0: rsnd-dai.0-ak4642-hifi
[   16.551899] VFS: Mounted root (nfs filesystem) on device 0:13.
[   16.569815] devtmpfs: mounted
[   16.579399] Freeing unused kernel memory: 1024K
[   17.101590] init: ureadahead main process (1009) terminated with status 5
[   18.433171] udevd[1084]: starting version 175
[   18.703993] random: crng init done
[   19.609093] init: plymouth main process (1011) killed by ABRT signal
[   19.629795] init: plymouth-splash main process (1798) terminated with status 2
[   19.723897] init: failsafe main process (1774) killed by TERM signal
[ OK ]ting sensors limits        
[   21.080560] init: alsa-restore main process (1890) terminated with status 99
Last login: Sat Jan  1 00:00:15 UTC 2000 on tty1
[   21.254228] init: plymouth-stop pre-start process (1930) terminated with status 1
[   21.280761] init: tty1 main process (1933) killed by TERM signal
Welcome to Linaro 13.04 (GNU/Linux 4.10.0-rc2-dirty armv7l)
 * Documentation:  https://wiki.linaro.org/
root@linaro-naro:~# 
root@linaro-naro:~# 
root@linaro-naro:~# 
root@linaro-naro:~# uname -a
Linux linaro-naro 4.10.0-rc2-dirty #327 SMP Fri Jan 20 11:30:16 JST 2017 armv7l armv7l armv7l GNU/Linux
root@linaro-naro:~# 
root@linaro-naro:~# 
root@linaro-naro:~# modetest -M rcar-du
Encoders:
id      crtc    type    possible crtcs  possible clones
61      59      DAC     0x00000007      0x00000003
63      58      TMDS    0x00000001      0x00000003

Connectors:
id      encoder status          name            size (mm)       modes   encoders
62      61      connected       VGA-1           0x0             5       61
  modes:
        name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  1024x768 60 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  800x600 60 800 840 968 1056 600 601 605 628 40000 flags: phsync, pvsync; type: driver
  800x600 56 800 824 896 1024 600 601 603 625 36000 flags: phsync, pvsync; type: driver
  848x480 60 848 864 976 1088 480 486 494 517 33750 flags: phsync, pvsync; type: driver
  640x480 60 640 656 752 800 480 490 492 525 25175 flags: nhsync, nvsync; type: driver
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
        2 DPMS:
                flags: enum
                enums: On=0 Standby=1 Suspend=2 Off=3
                value: 0
64      63      connected       HDMI-A-1        480x270         25      63
  modes:
        name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  1920x1080 60 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: preferred, driver
  1920x1080 60 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  1920x1080 50 1920 2448 2492 2640 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver
  1680x1050 60 1680 1728 1760 1840 1050 1053 1059 1080 119000 flags: phsync, nvsync; type: driver
  1400x1050 60 1400 1448 1480 1560 1050 1053 1057 1080 101000 flags: phsync, nvsync; type: driver
  1600x900 60 1600 1624 1704 1800 900 901 904 1000 108000 flags: phsync, pvsync; type: driver
  1280x1024 75 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags: phsync, pvsync; type: driver
  1280x1024 60 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, pvsync; type: driver
  1440x900 60 1440 1488 1520 1600 900 903 909 926 88750 flags: phsync, nvsync; type: driver
  1280x800 60 1280 1328 1360 1440 800 803 809 823 71000 flags: phsync, nvsync; type: driver
  1152x864 75 1152 1216 1344 1600 864 865 868 900 108000 flags: phsync, pvsync; type: driver
  1280x720 60 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  1280x720 60 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
  1280x720 50 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  1024x768 75 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, pvsync; type: driver
  1024x768 60 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  800x600 75 800 816 896 1056 600 601 604 625 49500 flags: phsync, pvsync; type: driver
  800x600 60 800 840 968 1056 600 601 605 628 40000 flags: phsync, pvsync; type: driver
  720x576 50 720 732 796 864 576 581 586 625 27000 flags: nhsync, nvsync; type: driver
  720x480 60 720 736 798 858 480 489 495 525 27027 flags: nhsync, nvsync; type: driver
  720x480 60 720 736 798 858 480 489 495 525 27000 flags: nhsync, nvsync; type: driver
  640x480 75 640 656 720 840 480 481 484 500 31500 flags: nhsync, nvsync; type: driver
  640x480 60 640 656 752 800 480 490 492 525 25200 flags: nhsync, nvsync; type: driver
  640x480 60 640 656 752 800 480 490 492 525 25175 flags: nhsync, nvsync; type: driver
  720x400 70 720 738 846 900 400 412 414 449 28320 flags: nhsync, pvsync; type: driver
  props:
        1 EDID:
                flags: immutable blob
                blobs:

                value:
                        00ffffffffffff001e6db85a01010101
                        0118010380301b78ea3135a5554ea126
                        0c5054a54b00714f81809500b300a9c0
                        810081c09040023a801871382d40582c
                        4500e00e1100001e000000fd00384b1e
                        530f000a202020202020000000fc004c
                        47204950532046554c4c4844000000ff
                        000a2020202020202020202020200164
                        02031df14a900403011412051f101323
                        0907078301000065030c001000023a80
                        1871382d40582c4500e00e1100001e01
                        1d8018711c1620582c2500e00e110000
                        9e011d007251d01e206e285500e00e11
                        00001e8c0ad08a20e02d10103e9600e0
                        0e110000180000000000000000000000
                        000000000000000000000000000000ae
        2 DPMS:
                flags: enum
                enums: On=0 Standby=1 Suspend=2 Off=3
                value: 0

CRTCs:
id      fb      pos     size
58      71      (0,0)   (1024x768)
  1024x768 75 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, pvsync; type: driver
  props:
59      71      (0,0)   (1024x768)
  1024x768 60 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  props:
60      0       (0,0)   (0x0)
   0 0 0 0 0 0 0 0 0 0 flags: ; type: 
  props:

Planes:
id      crtc    fb      CRTC x,y        x,y     gamma size      possible crtcs
27      58      71      0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1
28      59      71      0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1
29      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        30 zpos:
                flags: range
                values: 1 7
                value: 1
31      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        32 zpos:
                flags: range
                values: 1 7
                value: 1
33      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        34 zpos:
                flags: range
                values: 1 7
                value: 1
35      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        36 zpos:
                flags: range
                values: 1 7
                value: 1
37      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        38 zpos:
                flags: range
                values: 1 7
                value: 1
39      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        40 zpos:
                flags: range
                values: 1 7
                value: 1
41      0       0       0,0             0,0     0               0x00000003
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        42 zpos:
                flags: range
                values: 1 7
                value: 1
43      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 1
44      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        45 zpos:
                flags: range
                values: 1 7
                value: 1
46      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        47 zpos:
                flags: range
                values: 1 7
                value: 1
48      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        49 zpos:
                flags: range
                values: 1 7
                value: 1
50      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        51 zpos:
                flags: range
                values: 1 7
                value: 1
52      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        53 zpos:
                flags: range
                values: 1 7
                value: 1
54      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        55 zpos:
                flags: range
                values: 1 7
                value: 1
56      0       0       0,0             0,0     0               0x00000004
  formats: RG16 AR15 XR15 XR24 AR24 UYVY YUYV NV12 NV21 NV16
  props:
        5 type:
                flags: immutable enum
                enums: Overlay=0 Primary=1 Cursor=2
                value: 0
        25 alpha:
                flags: range
                values: 0 255
                value: 255
        26 colorkey:
                flags: range
                values: 0 33554431
                value: 0
        57 zpos:
                flags: range
                values: 1 7
                value: 1

Frame buffers:
id      size    pitch

root@linaro-naro:~# 
root@linaro-naro:~#

--------------E7E926AE3B89A3ED064238AC--
