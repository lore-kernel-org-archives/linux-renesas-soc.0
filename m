Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B717BC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 891C82082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 891C82082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbeLJSWB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:22:01 -0500
Received: from albert.telenet-ops.be ([195.130.137.90]:39356 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728503AbeLJSV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:21:59 -0500
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id AJMw1z0013XaVaC06JMwnt; Mon, 10 Dec 2018 19:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-00021W-U6; Mon, 10 Dec 2018 19:21:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-0005JL-Rw; Mon, 10 Dec 2018 19:21:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 4/4] serial: sh-sci: Fix fallback to PIO in sci_dma_rx_complete()
Date:   Mon, 10 Dec 2018 19:21:54 +0100
Message-Id: <20181210182154.20357-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181210182154.20357-1-geert+renesas@glider.be>
References: <20181210182154.20357-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210182154.F7VFa2gh-TY8YBQCGgg24fnldwL4x6WJLWBWuB-CSio@z>

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
v3:
  - Add missing definition of "u16 scr",
  - Move call to dmaengine_terminate_async() inside the spinlock, for
    symmetry with sci_submit_rx(),
  - Split in multiple patches.
---
 drivers/tty/serial/sh-sci.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index d8672336d4ff9b65..946cdb0c7250955f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1272,6 +1272,8 @@ static void sci_dma_rx_complete(void *arg)
 	struct dma_async_tx_descriptor *desc;
 	unsigned long flags;
 	int active, count = 0;
+	unsigned int i;
+	u16 scr;
 
 	dev_dbg(port->dev, "%s(%d) active cookie %d\n", __func__, port->line,
 		s->active_rx);
@@ -1313,8 +1315,18 @@ static void sci_dma_rx_complete(void *arg)
 	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
 	/* Switch to PIO */
 	spin_lock_irqsave(&port->lock, flags);
+	dmaengine_terminate_async(chan);
+	for (i = 0; i < 2; i++)
+		s->cookie_rx[i] = -EINVAL;
+	s->active_rx = 0;
 	s->chan_rx = NULL;
-	sci_start_rx(port);
+	/* Direct new serial port interrupts back to CPU */
+	scr = serial_port_in(port, SCSCR);
+	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		scr &= ~SCSCR_RDRQE;
+		enable_irq(s->irqs[SCIx_RXI_IRQ]);
+	}
+	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
 	spin_unlock_irqrestore(&port->lock, flags);
 }
 
-- 
2.17.1

