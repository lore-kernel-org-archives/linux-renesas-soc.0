Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:39834 "EHLO
        smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751958AbdJKMXh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 08:23:37 -0400
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
        by imta23.fe.bosch.de (Postfix) with ESMTP id 6AD7F1580214
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 14:22:18 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw22.fe.internet.bosch.com [10.4.98.11])
        by vsmta11.fe.internet.bosch.com (Postfix) with ESMTP id 395BC23806E6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Oct 2017 14:23:35 +0200 (CEST)
To: <linux-renesas-soc@vger.kernel.org>
From: Dirk Behme <dirk.behme@de.bosch.com>
Subject: mainline 4.14-rc4: renesas_sdhi_internal_dmac ee100000.sd: swiotlb
 buffer is full?
Message-ID: <50d1a9ac-fe5f-d0a1-62bc-ff3e252e99da@de.bosch.com>
Date: Wed, 11 Oct 2017 14:23:34 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

trying to boot recent mainline v4.14-rc4 on a custom H3 ES2.0 board with 
rootfs on SD card I'm getting [1].

Last time I think I used v4.13 in the same environment and I think it 
worked fine, most probably because renesas_sdhi_internal_dmac wasn't 
there, yet ;)

I checked renesas-drivers-2017-10-03-v4.14-rc3 if there is anything 
newer regarding drivers/mmc/host/renesas_sdhi_internal_dmac.c but 
doesn't look so.

Any idea what I missed?

Best regards

Dirk


[1]

...
Freeing unused kernel memory: 512K
usb 3-1: new high-speed USB device number 2 using ehci-platform
usb 3-1: New USB device found, idVendor=0424, idProduct=2514
usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
hub 3-1:1.0: USB hub found
hub 3-1:1.0: 4 ports detected
systemd[1]: System time before build time, advancing clock.
renesas_sdhi_internal_dmac ee100000.sd: swiotlb buffer is full (sz: 
524288 bytes)
renesas_sdhi_internal_dmac ee100000.sd: DMA: Out of SW-IOMMU space for 
524288 bytes
Unable to handle kernel paging request at virtual address ffffffffc0000000
Mem abort info:
   Exception class = DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
Data abort info:
   ISV = 0, ISS = 0x00000144
   CM = 1, WnR = 1
swapper pgtable: 4k pages, 48-bit VAs, pgd = ffff000008aa5000
[ffffffffc0000000] *pgd=0000000000000000
Internal error: Oops: 96000144 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.14.0-rc4-dirty #1
Hardware name: Bosch board based on r8a7795 (DT)
task: ffff00000890e900 task.stack: ffff000008900000
PC is at __dma_inv_area+0x40/0x58
LR is at __swiotlb_unmap_sg_attrs+0xa8/0xb8
pc : [<ffff000008094414>] lr : [<ffff0000080929f0>] pstate: 400001c5
sp : ffff000008003df0
x29: ffff000008003df0 x28: ffff0000088e6000
x27: 000000000000000a x26: ffff000008811000
x25: 0000000000000000 x24: 0000000000000002
x23: 0000000000000001 x22: ffff8006f991f280
x21: 0000000000000001 x20: ffff8006faa56010
x19: ffff8006f991f280 x18: 000000000000000a
x17: 000000000000000e x16: 0000000000000007
x15: 000000000009d4ff x14: 00003d08e7ffed39
x13: 0000000000008235 x12: 0000000000000002
x11: 7fffffffffffffff x10: 0000000000000002
x9 : ffff000008926640 x8 : 000000000000006d
x7 : ffff000008926638 x6 : 0000000000000000
x5 : ffff000008092948 x4 : 0000000000000000
x3 : 000000000000003f x2 : 0000000000000040
x1 : ffffffffc0080000 x0 : ffffffffc0000000
Process swapper/0 (pid: 0, stack limit = 0xffff000008900000)
Call trace:
Exception stack(0xffff000008003cb0 to 0xffff000008003df0)
3ca0:                                   ffffffffc0000000 ffffffffc0080000
3cc0: 0000000000000040 000000000000003f 0000000000000000 ffff000008092948
3ce0: 0000000000000000 ffff000008926638 000000000000006d ffff000008926640
3d00: 0000000000000002 7fffffffffffffff 0000000000000002 0000000000008235
3d20: 00003d08e7ffed39 000000000009d4ff 0000000000000007 000000000000000e
3d40: 000000000000000a ffff8006f991f280 ffff8006faa56010 0000000000000001
3d60: ffff8006f991f280 0000000000000001 0000000000000002 0000000000000000
3d80: ffff000008811000 000000000000000a ffff0000088e6000 ffff000008003df0
3da0: ffff0000080929f0 ffff000008003df0 ffff000008094414 00000000400001c5
3dc0: 0000000000000000 0000000000000000 0001000000000000 0000000000000000
3de0: ffff000008003df0 ffff000008094414
[<ffff000008094414>] __dma_inv_area+0x40/0x58
[<ffff0000084c8fcc>] 
renesas_sdhi_internal_dmac_complete_tasklet_fn+0x7c/0xa8
[<ffff00000809f270>] tasklet_action+0xd8/0x144
[<ffff0000080810e4>] __do_softirq+0x2d4/0x394
[<ffff00000809eb18>] irq_exit+0x60/0xac
[<ffff0000080e1ccc>] __handle_domain_irq+0xa0/0xec
[<ffff000008080c80>] gic_handle_irq+0x80/0xac
Exception stack(0xffff000008903dd0 to 0xffff000008903f10)
3dc0:                                   0000000000000000 ffff0000087a9ee0
3de0: 0000000000000001 ffff0000088e6000 ffff000008a57b70 0000000000000000
3e00: 0000000000000446 00000000000000c0 ffff00000890f3e0 ffff000008903e90
3e20: 0000000000000a80 ffff8006fff16fc0 0000000000000001 0000000000000000
3e40: 6620656361707320 000000000009d4ff 0000000000000007 000000000000000e
3e60: 000000000000000a 0000000000000000 0000000000000000 ffff0000088eee10
3e80: ffff000008908aa0 ffff8006fffffa00 ffff0000088d2028 0000000000000000
3ea0: 0000000000000000 0000000000000000 0000000049880018 ffff000008903f10
3ec0: ffff0000080849b0 ffff000008903f10 ffff0000080849b4 0000000000000045
3ee0: ffff0000088eee10 ffff000008908aa0 ffffffffffffffff ffff0000088d2028
3f00: ffff000008903f10 ffff0000080849b4
[<ffff0000080828f4>] el1_irq+0xb4/0x12c
[<ffff0000080849b4>] arch_cpu_idle+0x140/0x19c
[<ffff0000086583ec>] default_idle_call+0x2c/0x34
[<ffff0000080d297c>] do_idle+0xfc/0x19c
[<ffff0000080d2b78>] cpu_startup_entry+0x20/0x24
[<ffff0000086534a8>] rest_init+0xc8/0xd4
[<ffff000008880b70>] start_kernel+0x38c/0x3a0
Code: 8a230000 54000060 d50b7e20 14000002 (d5087620)
---[ end trace 6a04242e7e1f35dd ]---
Kernel panic - not syncing: Fatal exception in interrupt
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x002004
Memory Limit: 4096 MB
---[ end Kernel panic - not syncing: Fatal exception in interrupt
