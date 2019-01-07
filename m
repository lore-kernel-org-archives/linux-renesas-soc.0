Return-Path: <SRS0=nqfF=PP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F65C43444
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 13E182147C
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Jan 2019 16:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730168AbfAGQX0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Jan 2019 11:23:26 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:48182 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730150AbfAGQXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Jan 2019 11:23:25 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id MUPM1z00i3XaVaC01UPMvX; Mon, 07 Jan 2019 17:23:24 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-0008Fy-ER; Mon, 07 Jan 2019 17:23:21 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ggXgP-00043N-DL; Mon, 07 Jan 2019 17:23:21 +0100
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
Subject: [PATCH v5 2/4] serial: sh-sci: Extract sci_dma_rx_reenable_irq()
Date:   Mon,  7 Jan 2019 17:23:18 +0100
Message-Id: <20190107162320.15530-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107162320.15530-1-geert+renesas@glider.be>
References: <20190107162320.15530-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extract the functionality to direct new serial port interrupts back to
the CPU into its own helper, to prepare for using it from a second
callsite.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - New.
---
 drivers/tty/serial/sh-sci.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4c75468680cb547d..4d814c30c4189b56 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1274,6 +1274,20 @@ static void start_hrtimer_us(struct hrtimer *hrt, unsigned long usec)
 	hrtimer_start(hrt, t, HRTIMER_MODE_REL);
 }
 
+static void sci_dma_rx_reenable_irq(struct sci_port *s)
+{
+	struct uart_port *port = &s->port;
+	u16 scr;
+
+	/* Direct new serial port interrupts back to CPU */
+	scr = serial_port_in(port, SCSCR);
+	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+		scr &= ~SCSCR_RDRQE;
+		enable_irq(s->irqs[SCIx_RXI_IRQ]);
+	}
+	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
+}
+
 static void sci_dma_rx_complete(void *arg)
 {
 	struct sci_port *s = arg;
@@ -1453,7 +1467,6 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
 	unsigned long flags;
 	unsigned int read;
 	int active, count;
-	u16 scr;
 
 	dev_dbg(port->dev, "DMA Rx timed out\n");
 
@@ -1503,13 +1516,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
 		sci_submit_rx(s, true);
 
-	/* Direct new serial port interrupts back to CPU */
-	scr = serial_port_in(port, SCSCR);
-	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
-		scr &= ~SCSCR_RDRQE;
-		enable_irq(s->irqs[SCIx_RXI_IRQ]);
-	}
-	serial_port_out(port, SCSCR, scr | SCSCR_RIE);
+	sci_dma_rx_reenable_irq(s);
 
 	spin_unlock_irqrestore(&port->lock, flags);
 
-- 
2.17.1

