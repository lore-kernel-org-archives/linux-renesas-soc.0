Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:48993 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751398AbdJJKIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 06:08:05 -0400
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Oct 2017 12:08:03 +0200
Message-ID: <CAMuHMdUGwTRsJdfkG90hY6kvCr6qknRGv5V66qBPfUY1x+MciQ@mail.gmail.com>
Subject: mmc: exceeding card's volts
To: Linux MMC List <linux-mmc@vger.kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

For the first time ever, I saw a dangerous looking "exceeding card's volts"
on Salvator-X with R-Car M3-W ES1.0:

 NET: Registered protocol family 15
 can: controller area network core (rev 20170425 abi 9)
 NET: Registered protocol family 29
+renesas_sdhi_internal_dmac ee140000.sd: Tuning procedure failed
+mmc0: tuning execution failed: -5
+mmc0: error -5 whilst initialising MMC card
 can: raw protocol (rev 20170425)
 can: broadcast manager protocol (rev 20170425 t)
 can: netlink gateway (rev 20170425) max_hops=1
+renesas_sdhi_internal_dmac ee140000.sd: exceeding card's volts
 renesas_irqc e61c0000.interrupt-controller: adding to PM domain always-on
+mmc0: error -110 whilst initialising MMC card
 renesas_irqc e61c0000.interrupt-controller: driving 6 irqs

During next boot, everything was back to normal again...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
