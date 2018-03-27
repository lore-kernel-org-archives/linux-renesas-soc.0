Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51136 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751980AbeC0OvI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 10:51:08 -0400
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: USB2 crash on renesas-drivers
To: linux-renesas-soc@vger.kernel.org
Message-ID: <95be06b8-5ed5-e369-bfc9-b35fed0f81f7@ideasonboard.com>
Date: Tue, 27 Mar 2018 15:51:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

While playing around with cameras (as I do...) I am finding that I am hitting
some faults on the USB2 stack on Salvator-XS (H3)

Test: Connect USB 2.0 web cam (UVC) (appears as /dev/video23)


gst-launch-1.0 v4l2src device=/dev/video23 '!' image/jpeg, width=640, height=480
'!' progressreport '!' rtpjpegpay '!' udpsink host=192.168.0.20 port=5000

Result: Almost immediately, and quite repeatably the following page fault - but
only on the USB2 ports:

A USB3 camera works fine on the USB3 port, and the USB2 camera works fine in the
USB3 port.

--
Kieran



[   78.297440] Unable to handle kernel paging request at virtual address
ffffc006fc37bcac
[   78.305478] Mem abort info:
[   78.308284]   ESR = 0x96000004
[   78.311352]   Exception class = DABT (current EL), IL = 32 bits
[   78.317296]   SET = 0, FnV = 0
[   78.320362]   EA = 0, S1PTW = 0
[   78.323515] Data abort info:
[   78.326407]   ISV = 0, ISS = 0x00000004
[   78.330258]   CM = 0, WnR = 0
[   78.333240] swapper pgtable: 4k pages, 48-bit VAs, pgdp = 00000000edff4481
[   78.340143] [ffffc006fc37bcac] pgd=0000000000000000
[   78.345111] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[   78.350701] Modules linked in:
[   78.353771] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
4.16.0-rc7-arm64-renesas #484
[   78.361450] Hardware name: Renesas Salvator-X 2nd version board based on
r8a7795 ES2.0+ (DT)
[   78.369914] pstate: 40000085 (nZcv daIf -PAN -UAO)
[   78.374730] pc : ehci_work.part.34+0x640/0x8e8
[   78.379186] lr : ehci_work.part.34+0x71c/0x8e8
[   78.383640] sp : ffff000008003d20
[   78.386963] x29: ffff000008003d20 x28: ffff8006fa97f580
[   78.392294] x27: ffff00000a0050c0 x26: 0000000000000080
[   78.397626] x25: 00000000000000f3 x24: 00000000000000f6
[   78.402957] x23: ffff8006f92734c8 x22: ffff8006f9242798
[   78.408288] x21: 0000000000000000 x20: ffff8006f9273330
[   78.413619] x19: 0000000000000000 x18: 0000000000000500
[   78.418950] x17: 00000000000076e8 x16: 00000000000076e7
[   78.424281] x15: ffff0000098f7ac8 x14: 00000000000076e8
[   78.429612] x13: 0000000000000001 x12: 00000000000076ea
[   78.434943] x11: 00000000ffffffb9 x10: 00000000ffffffb5
[   78.440274] x9 : 00000000ffffffba x8 : 00000000ffffffc1
[   78.445605] x7 : 0000000000000005 x6 : 0000000096383fc8
[   78.450935] x5 : ffff00000a0050e4 x4 : 0000000086411f40
[   78.456266] x3 : ffff000009cf53cc x2 : 0000000000000005
[   78.461597] x1 : ffffc006fc37bc00 x0 : ffff00000a0050c4
[   78.466929] Process swapper/0 (pid: 0, stack limit = 0x00000000e653c8e9)
[   78.473648] Call trace:
[   78.476101]  ehci_work.part.34+0x640/0x8e8
[   78.480208]  ehci_irq+0x2d4/0x320
[   78.483535]  usb_hcd_irq+0x3c/0x60
[   78.486951]  __handle_irq_event_percpu+0x98/0x468
[   78.491667]  handle_irq_event_percpu+0x28/0x60
[   78.496123]  handle_irq_event+0x50/0x80
[   78.499969]  handle_fasteoi_irq+0xa8/0x188
[   78.504077]  generic_handle_irq+0x34/0x50
[   78.508097]  __handle_domain_irq+0x68/0xc0
[   78.512206]  gic_handle_irq+0x60/0xb8
[   78.515878]  el1_irq+0xb4/0x130
[   78.519028]  arch_cpu_idle+0x34/0x228
[   78.522705]  default_idle_call+0x20/0x38
[   78.526640]  do_idle+0x16c/0x1e8
[   78.529876]  cpu_startup_entry+0x2c/0x30
[   78.533809]  rest_init+0x258/0x268
[   78.537223]  start_kernel+0x3b0/0x3c4
[   78.540897] Code: b9408c22 0b040044 b9008c24 17ffff31 (b940ac22)
[   78.547023] ---[ end trace cdaffda78bbfd46e ]---
[   78.551653] Kernel panic - not syncing: Fatal exception in interrupt
[   78.558031] SMP: stopping secondary CPUs
[   78.561969] Kernel Offset: disabled
[   78.565468] CPU features: 0x01802000
[   78.569051] Memory Limit: none
[   78.572125] ---[ end Kernel panic - not syncing: Fatal exception in interrupt
