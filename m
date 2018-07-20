Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:33410 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728409AbeGTNGb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 09:06:31 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc: Simon Horman <horms@verge.net.au>, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] serial: sh-sci: Drop superfluous assignment in sci_request_dma()
Date: Fri, 20 Jul 2018 14:18:26 +0200
Message-Id: <20180720121826.29446-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

No later code uses the assigned value, so it can be dropped.

Reported-by: Simon Horman <horms@verge.net.au>
Fixes: 2c4ee23530ffc022 ("serial: sh-sci: Postpone DMA release when falling back to PIO")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/tty/serial/sh-sci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index f8e53ac5c17dfb94..6ff6f2bf3b9b749f 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1574,7 +1574,6 @@ static void sci_request_dma(struct uart_port *port)
 		if (dma_mapping_error(chan->device->dev, s->tx_dma_addr)) {
 			dev_warn(port->dev, "Failed mapping Tx DMA descriptor\n");
 			dma_release_channel(chan);
-			chan = NULL;
 		} else {
 			dev_dbg(port->dev, "%s: mapped %lu@%p to %pad\n",
 				__func__, UART_XMIT_SIZE,
-- 
2.17.1
