Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f173.google.com ([209.85.217.173]:42414 "EHLO
        mail-ua0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937705AbeFSMkq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jun 2018 08:40:46 -0400
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jun 2018 14:40:33 +0200
Message-ID: <CAMuHMdWR0KuVyXu-Gg1JGNUu7xS1rT9Rg9siGXAjDGBm+O6G=w@mail.gmail.com>
Subject: renesas_sdhi: mapping sg segment longer than device claims to support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi all,

With the new CONFIG_DMA_API_DEBUG_SG option enabled, I get the following
warning (actual value of len varies) during boot on various R-Car Gen3
platforms:

 renesas_sdhi_internal_dmac ee140000.sd: DMA-API: mapping sg segment
longer than device claims to support [len=98304] [max=65536]
WARNING: CPU: 0 PID: 24 at lib/dma-debug.c:1301 debug_dma_map_sg+0x228/0x344
Modules linked in:
CPU: 0 PID: 24 Comm: kworker/0:2 Tainted: G        W
4.18.0-rc1-salvator-x-00669-g26e36f8e84173ce8-dirty #2
Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
Workqueue: events tmio_mmc_done_work
pstate: 60400005 (nZCv daif +PAN -UAO)
pc : debug_dma_map_sg+0x228/0x344
lr : debug_dma_map_sg+0x228/0x344
sp : ffffff8009db3c40
x29: ffffff8009db3c40 x28: ffffffc076ec5d00
x27: 0000000000000000 x26: 0000000087654321
x25: 0000000000000000 x24: 0000000000010000
x23: 00000000ffffffff x22: ffffff8008c9a626
x21: ffffff800900f000 x20: ffffffc079ad9100
x19: ffffffc0787d3010 x18: 000000000000000a
x17: 0000007f8b45ef28 x16: ffffff800808ec5c
x15: 0000000000010000 x14: 74207265676e6f6c
x13: 20746e656d676573 x12: 20677320676e6970
x11: 70616d203a495041 x10: 2d414d44203a6473
x9 : 2e30303030343165 x8 : 0000000000000000
x7 : ffffff800814a77c x6 : 0000000000000001
x5 : 0000000000000000 x4 : 0000000000000000
x3 : ffffffffffffffff x2 : ffffff8009036ae0
x1 : b2e67a700e93ba00 x0 : 0000000000000000
Call trace:
 debug_dma_map_sg+0x228/0x344
 renesas_sdhi_internal_dmac_start_dma+0x94/0x1a0
 tmio_process_mrq+0x134/0x308
 tmio_mmc_done_work+0xe0/0xf0
 process_one_work+0x394/0x62c
 worker_thread+0x21c/0x324
 kthread+0x118/0x128
 ret_from_fork+0x10/0x18
irq event stamp: 26570
hardirqs last  enabled at (26569): [<ffffff800814a840>] vprintk_emit+0x33c/0x3e4
hardirqs last disabled at (26570): [<ffffff80080818cc>]
do_debug_exception+0x5c/0x17c
softirqs last  enabled at (26562): [<ffffff8008081da8>] __do_softirq+0x160/0x4ec
softirqs last disabled at (26555): [<ffffff80080eb700>] irq_exit+0xa0/0xfc
---[ end trace ea01d01f16e4e27f ]---

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
