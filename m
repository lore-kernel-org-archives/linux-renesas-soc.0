Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7ED5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B13D52147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729631AbfAGQX0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 11:23:26 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:59598 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730168AbfAGQXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 11:23:25 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id MUPM1z00V3XaVaC06UPM92; Mon, 07 Jan 2019 17:23:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-0008G1-FT; Mon, 07 Jan 2019 17:23:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-00043R-E7; Mon, 07 Jan 2019 17:23:21 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 3/4] serial: sh-sci: Fix fallback to PIO in sci_dma_rx_complete()
Date:   Mon,  7 Jan 2019 17:23:19 +0100
Message-Id: <20190107162320.15530-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107162320.15530-1-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When submitting a DMA request fails in sci_dma_rx_complete(), the driver
tries to fall back to PIO, but that does not work: no more data will be
received, or the kernel will even crash.

Fix this similar as in (but not identical to) sci_submit_rx():
  - On SCIF, PIO cannot take over if any DMA transactions are pending,
    hence they must be terminated first.
  - All active cookies must be invalidated, else rx_timer_fn() may
    trigger a NULL pointer dereference.
  - Restarting the port is not needed, as it is already running, but
    serial port interrupts must be directed back from the DMA engine to
    the CPU.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Call new helpers sci_dma_rx_chan_invalidate() and
    sci_dma_rx_reenable_irq() instead of open-coding,

v4:
  - No changes,

v3:
  - Add missing definition of "u16 scr",
  - Move call to dmaengine_terminate_async() inside the spinlock, for
    symmetry with sci_submit_rx(),
  - Split in multiple patches.
---
 drivers/tty/serial/sh-sci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4d814c30c4189b56..891833315698b953 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1337,8 +1337,9 @@ static void sci_dma_rx_complete(void *arg)
 	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
 	/* Switch to PIO */
 	spin_lock_irqsave(&port->lock, flags);
-	s->chan_rx = NULL;
-	sci_start_rx(port);
+	dmaengine_terminate_async(chan);
+	sci_dma_rx_chan_invalidate(s);
+	sci_dma_rx_reenable_irq(s);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
-- 
2.17.1

