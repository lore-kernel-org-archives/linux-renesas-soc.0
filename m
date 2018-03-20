Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33876 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751328AbeCTIUZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 04:20:25 -0400
Received: by mail-pf0-f194.google.com with SMTP id j20so363648pfi.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 01:20:25 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 17:20:39 +0900
Message-Id: <152153403990.8610.2910800250912629335.sendpatchset@little-apple>
In-Reply-To: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
References: <152153402203.8610.10666108438721508284.sendpatchset@little-apple>
Subject: [PATCH 2/2] arm: dts: sh73a0 KZM9 as unhandled IRQs on boot
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Booting sh73a0 KZM9G results in the following on the console:

[    0.030000] renesas_intc_irqpin e6900000.interrupt-controller: driving 8 irqs
[    0.040000] random: crng init done
[    0.120000] irq 35: nobody cared (try booting with the "irqpoll" option)
[    0.120000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc5 #4
[    0.120000] Hardware name: Generic SH73A0 (Flattened Device Tree)
...
[    0.120000] Disabling IRQ #35
[    0.120000] renesas_intc_irqpin e6900004.interrupt-controller: driving 8 irqs

Judging by the friendly board documentation there is nothing hooked up to
that IRQ line. I wish we had proper schematics and not a less detailed
board manual.

With this patch I've tried to extend the irqpin driver to mask all interrupts
on boot but it does not seem to help. Perhaps the PFC hardware needs to be
configured somehow. More effort is needed to solve this issue.

Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2018-03-13-v4.16-rc5
 
 drivers/irqchip/irq-renesas-intc-irqpin.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- 0001/drivers/irqchip/irq-renesas-intc-irqpin.c
+++ work/drivers/irqchip/irq-renesas-intc-irqpin.c	2018-03-20 14:31:02.420607110 +0900
@@ -558,11 +558,11 @@ static int intc_irqpin_probe(struct plat
 			}
 		}
 	}
-
+#if 0
 	/* unmask all interrupts on prio level */
 	for (k = 0; k < nirqs; k++)
 		intc_irqpin_mask_unmask_prio(p, k, 0);
-
+#endif
 	dev_info(dev, "driving %d irqs\n", nirqs);
 
 	return 0;
