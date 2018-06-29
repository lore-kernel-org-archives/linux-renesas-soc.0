Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:45036 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754566AbeF2OZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 10:25:22 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] serial: sh-sci: Stop TX DMA workqueue during port shutdown
Date: Fri, 29 Jun 2018 16:25:08 +0200
Message-Id: <20180629142513.20743-3-geert+renesas@glider.be>
In-Reply-To: <20180629142513.20743-1-geert+renesas@glider.be>
References: <20180629142513.20743-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The transmit DMA workqueue is never stopped, hence the work function may
be called after the port has been shut down.

Fix this race condition by cancelling queued work, if any, before DMA
release.  Don't initialize the work if DMA initialization failed, as it
won't be used anyway.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 0ed91692f53ad859..1e0b6fe6865dcff6 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1295,6 +1295,7 @@ static void sci_tx_dma_release(struct sci_port *s)
 	struct dma_chan *chan = s->chan_tx_saved;
 	struct uart_port *port = &s->port;
 
+	cancel_work_sync(&s->work_tx);
 	s->chan_tx_saved = s->chan_tx = NULL;
 	s->cookie_tx = -EINVAL;
 	dmaengine_terminate_all(chan);
@@ -1550,10 +1551,9 @@ static void sci_request_dma(struct uart_port *port)
 				__func__, UART_XMIT_SIZE,
 				port->state->xmit.buf, &s->tx_dma_addr);
 
+			INIT_WORK(&s->work_tx, work_fn_tx);
 			s->chan_tx_saved = s->chan_tx = chan;
 		}
-
-		INIT_WORK(&s->work_tx, work_fn_tx);
 	}
 
 	chan = sci_request_dma_chan(port, DMA_DEV_TO_MEM);
-- 
2.17.1
