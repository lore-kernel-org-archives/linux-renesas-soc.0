Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:40602 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728996AbeJLXC5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 19:02:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC/WIP] serial: sh-sci: Fixes for DMA fallback to PIO
Date: Fri, 12 Oct 2018 17:29:52 +0200
Message-Id: <20181012152952.5360-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Fallback to PIO never really worked due to various reasons (sh-sci
driver issues and dmaengine framework limitations).

There are three places where DMA submission can fall, and the driver
should fall back to PIO:
  1. sci_submit_rx(),
  2. sci_dma_rx_complete(),
  3. work_fn_tx().

This RFC fixes some of them.  Unfortunatey not all, but I didn't want to
withhold this from you for the weekend ;-)

  A. Some callers of sci_submit_rx() hold the port spinlock, others
     don't.  When submission of receive DMA requests fails, the driver
     will fall back to PIO, and obtain the port spinlock.  If the lock
     was already held, spinlock recursion is detected, causing a
     deadlock: BUG: spinlock recursion on CPU#0.

     Fix this by adding a flag parameter to sci_submit_rx() for the
     caller to indicate the port spinlock is already held, so spinlock
     recursion can be avoided.

     Move the spin_lock_irqsave() up, so all DMA disable steps are
     protected, which is safe as the recently introduced
     dmaengine_terminate_async() can be called in atomic context.

After this, PIO fallback in sci_submit_rx() works on SCIFA (and
presumably SCIFB, which is very similar w.r.t. DMA).

  B. When falling back to PIO, active_rx must be set to a different
     value than cookie_rx[i], else sci_dma_rx_find_active() will
     incorrectly find a match, leading to a NULL pointer dereference in
     rx_timer_fn() later.

  C. On (H)SCIF, sci_submit_rx() is called in the receive interrupt
     handler.  Hence if DMA submission fails, the interrupt handler
     should handle reception using PIO.

After this, PIO fallback in sci_submit_rx() works on SCIF (and
presumably HSCIF, which is very similar w.r.t. DMA).

  D. When falling back to PIO in sci_dma_rx_complete(), the cookies must
     be invalidated, else rx_timer_fn() will trigger a NULL pointer
     dereference.

Note that this change is not sufficient to make PIO fallback in
sci_dma_rx_complete() work: serial input is still dead.

To do:
  - Fix case 2,
  - Try case 3, and fix it, if needed.

All testing was done on r8a7791/koelsch using SCIF1 on debug serial 1,
and SCIFA3 on EXIO-B, by introducing random failures in DMA submission
code.

Not-Yet-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against tty/next + "serial: sh-sci: Fix receive on SCIFA/SCIFB variants
with DMA".

 drivers/tty/serial/sh-sci.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 3aad48e64b9b71ff..9dc4309a600c9806 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1272,6 +1272,7 @@ static void sci_dma_rx_complete(void *arg)
 	struct dma_async_tx_descriptor *desc;
 	unsigned long flags;
 	int active, count = 0;
+	unsigned int i;
 
 	dev_dbg(port->dev, "%s(%d) active cookie %d\n", __func__, port->line,
 		s->active_rx);
@@ -1313,6 +1314,9 @@ static void sci_dma_rx_complete(void *arg)
 	dev_warn(port->dev, "Failed submitting Rx DMA descriptor\n");
 	/* Switch to PIO */
 	spin_lock_irqsave(&port->lock, flags);
+	for (i = 0; i < 2; i++)
+		s->cookie_rx[i] = -EINVAL;
+	s->active_rx = 0;
 	s->chan_rx = NULL;
 	sci_start_rx(port);
 	spin_unlock_irqrestore(&port->lock, flags);
@@ -1331,7 +1335,7 @@ static void sci_tx_dma_release(struct sci_port *s)
 	dma_release_channel(chan);
 }
 
-static void sci_submit_rx(struct sci_port *s)
+static int sci_submit_rx(struct sci_port *s, bool port_lock_held)
 {
 	struct dma_chan *chan = s->chan_rx;
 	struct uart_port *port = &s->port;
@@ -1359,19 +1363,22 @@ static void sci_submit_rx(struct sci_port *s)
 	s->active_rx = s->cookie_rx[0];
 
 	dma_async_issue_pending(chan);
-	return;
+	return 0;
 
 fail:
+	if (!port_lock_held)
+		spin_lock_irqsave(&port->lock, flags);
 	if (i)
 		dmaengine_terminate_async(chan);
 	for (i = 0; i < 2; i++)
 		s->cookie_rx[i] = -EINVAL;
-	s->active_rx = -EINVAL;
+	s->active_rx = 0;
 	/* Switch to PIO */
-	spin_lock_irqsave(&port->lock, flags);
 	s->chan_rx = NULL;
 	sci_start_rx(port);
-	spin_unlock_irqrestore(&port->lock, flags);
+	if (!port_lock_held)
+		spin_unlock_irqrestore(&port->lock, flags);
+	return -1;
 }
 
 static void work_fn_tx(struct work_struct *work)
@@ -1491,7 +1498,7 @@ static enum hrtimer_restart rx_timer_fn(struct hrtimer *t)
 	}
 
 	if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-		sci_submit_rx(s);
+		sci_submit_rx(s, true);
 
 	/* Direct new serial port interrupts back to CPU */
 	scr = serial_port_in(port, SCSCR);
@@ -1617,7 +1624,7 @@ static void sci_request_dma(struct uart_port *port)
 		s->chan_rx_saved = s->chan_rx = chan;
 
 		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB)
-			sci_submit_rx(s);
+			sci_submit_rx(s, false);
 	}
 }
 
@@ -1667,7 +1674,8 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 			scr |= SCSCR_RDRQE;
 		} else {
 			scr &= ~SCSCR_RIE;
-			sci_submit_rx(s);
+			if (sci_submit_rx(s, false))
+				goto handle_pio;
 		}
 		serial_port_out(port, SCSCR, scr);
 		/* Clear current interrupt */
@@ -1681,6 +1689,7 @@ static irqreturn_t sci_rx_interrupt(int irq, void *ptr)
 	}
 #endif
 
+handle_pio:
 	if (s->rx_trigger > 1 && s->rx_fifo_timeout > 0) {
 		if (!scif_rtrg_enabled(port))
 			scif_set_rtrg(port, s->rx_trigger);
-- 
2.17.1
