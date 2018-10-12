Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:13739 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727556AbeJLVUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Oct 2018 17:20:34 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa@the-dreams.de, geert@linux-m68k.org,
        linux-serial@vger.kernel.org, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] serial: sh-sci: do not warn if DMA transfers are not supported
Date: Fri, 12 Oct 2018 15:47:49 +0200
Message-Id: <1539352069-1028-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Not all (H)SCIF devices support DMA, and failure to set it up is not
normally a cause for concern. This patch demotes the associated warning to
debug output.

Inspired by BSP patch "sci: sh-sci: Fix transfer sequence of unsupport DMA
transfer" (6beb1f98d3bd30) by Hiromitsu Yamasaki.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/tty/serial/sh-sci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 426241d..ff6ba6d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1516,7 +1516,7 @@ static struct dma_chan *sci_request_dma_chan(struct uart_port *port,
 	chan = dma_request_slave_channel(port->dev,
 					 dir == DMA_MEM_TO_DEV ? "tx" : "rx");
 	if (!chan) {
-		dev_warn(port->dev, "dma_request_slave_channel failed\n");
+		dev_dbg(port->dev, "dma_request_slave_channel failed\n");
 		return NULL;
 	}
 
-- 
2.7.4
