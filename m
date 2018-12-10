Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF0E5C04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:21:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8D9452082F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9452082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbeLJSV7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:21:59 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:41616 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728341AbeLJSV6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:21:58 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id AJMv1z00e3XaVaC01JMvKo; Mon, 10 Dec 2018 19:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-00021Q-SI; Mon, 10 Dec 2018 19:21:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-0005JI-R6; Mon, 10 Dec 2018 19:21:55 +0100
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
Subject: [PATCH v3 3/4] serial: sh-sci: Resume PIO in sci_rx_interrupt() on DMA failure
Date:   Mon, 10 Dec 2018 19:21:53 +0100
Message-Id: <20181210182154.20357-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181210182154.20357-1-geert+renesas@glider.be>
References: <20181210182154.20357-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210182153.1N_QGTutH5aZ4h4XaF_ayDGHqHLe2uH1QdLrMyIkMyY@z>

On (H)SCIF, sci_submit_rx() is called in the receive interrupt handler.
Hence if DMA submission fails, the interrupt handler should resume
handling reception using PIO, else no more data is received.

Make sci_submit_rx() return an error indicator, so the receive interrupt
handler can act appropriately.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Move label handle_pio inside #ifdef to kill defined but not used
    compiler warning when CONFIG_SERIAL_SH_SCI_DMA=n,
  - Move the call sci_submit_rx() in sci_rx_interrupt() up, as it may
    fail, rendering the modification of scr unused,
  - Split in multiple patches.
---
 drivers/tty/serial/sh-sci.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index e353e03ce2602559..d8672336d4ff9b65 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1331,7 +1331,7 @@ static void sci_tx_dma_release(struct sci_port *s)
 	dma_release_channel(chan);
 }
 
-static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
+static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
 {
 	struct dma_chan *chan = s->chan_rx;
 	struct uart_port *port = &s->port;
@@ -1359,7 +1359,7 @@ static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
 	s->active_rx = s->cookie_rx[0];
 
 	dma_async_issue_pending(chan);
-	return;
+	return 0;
 
 fail:
 	/* Switch to PIO */
@@ -1374,6 +1374,7 @@ static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
 	sci_start_rx(port);
 	if (!port_lock_held)
 		spin_unlock_irqrestore(&port->lock, flags);
+	return -1;
 }
 
 static void work_fn_tx(struct work_struct *work)
@@ -1668,8 +1669,10 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 			disable_irq_nosync(irq);
 			scr |= SCSCR_RDRQE;
 		} else {
+			if (sci_submit_rx(s, false))
+				goto handle_pio;
+
 			scr &= ~SCSCR_RIE;
-			sci_submit_rx(s, false);
 		}
 		serial_port_out(port, SCSCR, scr);
 		/* Clear current interrupt */
@@ -1681,6 +1684,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 
 		return IRQ_HANDLED;
 	}
+
+handle_pio:
 #endif
 
 	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0) {
-- 
2.17.1

