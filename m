Return-Path: <SRS0=Zu5O=OT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E60ABC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5EB32084C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 10 Dec 2018 18:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5EB32084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728166AbeLJSWB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 10 Dec 2018 13:22:01 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40778 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbeLJSV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:21:59 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id AJMv1z00Z3XaVaC01JMvop; Mon, 10 Dec 2018 19:21:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-00021L-Qm; Mon, 10 Dec 2018 19:21:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gWQBn-0005JB-Pl; Mon, 10 Dec 2018 19:21:55 +0100
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
Subject: [PATCH v3 1/4] serial: sh-sci: Fix locking in sci_submit_rx()
Date:   Mon, 10 Dec 2018 19:21:51 +0100
Message-Id: <20181210182154.20357-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181210182154.20357-1-geert+renesas@glider.be>
References: <20181210182154.20357-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
Message-ID: <20181210182151.dHSGL8IlSmuVrSIxdE6DQOjJX33MayYtPlS9uxQJYu8@z>

Some callers of sci_submit_rx() hold the port spinlock, others don't.
During fallback to PIO, the driver needs to obtain the port spinlock.
If the lock was already held, spinlock recursion is detected, causing a
deadlock: BUG: spinlock recursion on CPU#0.

Fix this by adding a flag parameter to sci_submit_rx() for the caller to
indicate the port spinlock is already held, so spinlock recursion can be
avoided.

Move the spin_lock_irqsave() up, so all DMA disable steps are protected,
which is safe as the recently introduced dmaengine_terminate_async() can
be called in atomic context.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Split in multiple patches.
---
 drivers/tty/serial/sh-sci.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 8146d9cef0cbe2d0..2a08039f792235e5 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1331,7 +1331,7 @@ static void sci_tx_dma_release(struct sci_port *s)
 	dma_release_channel(chan);
 }
 
-static void sci_submit_rx(struct sci_port *s)
+static void sci_submit_rx(struct sci_port *s, bool port_lock_held)
 {
 	struct dma_chan *chan = s->chan_rx;
 	struct uart_port *port = &s->port;
@@ -1362,16 +1362,18 @@ static void sci_submit_rx(struct sci_port *s)
 	return;
 
 fail:
+	/* Switch to PIO */
+	if (!port_lock_held)
+		spin_lock_irqsave(&port->lock, flags);
 	if (i)
 		dmaengine_terminate_async(chan);
 	for (i = 0; i < 2; i++)
 		s->cookie_rx[i] = -EINVAL;
 	s->active_rx = -EINVAL;
-	/* Switch to PIO */
-	spin_lock_irqsave(&port->lock, flags);
 	s->chan_rx = NULL;
 	sci_start_rx(port);
-	spin_unlock_irqrestore(&port->lock, flags);
+	if (!port_lock_held)
+		spin_unlock_irqrestore(&port->lock, flags);
 }
 
 static void work_fn_tx(struct work_struct *work)
@@ -1491,7 +1493,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
 	}
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-		sci_submit_rx(s);
+		sci_submit_rx(s, true);
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = serial_port_in(port, SCSCR);
@@ -1617,7 +1619,7 @@ static void sci_request_dma(struct uart_port *port)
 		s->chan_rx_saved = s->chan_rx = chan;
 
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-			sci_submit_rx(s);
+			sci_submit_rx(s, false);
 	}
 }
 
@@ -1667,7 +1669,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 			scr |= SCSCR_RDRQE;
 		} else {
 			scr &= ~SCSCR_RIE;
-			sci_submit_rx(s);
+			sci_submit_rx(s, false);
 		}
 		serial_port_out(port, SCSCR, scr);
 		/* Clear current interrupt */
-- 
2.17.1

