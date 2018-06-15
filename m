Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964778AbeFOO4R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 10:56:17 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH] [HACK] serial: sh-sci: Hard code SCIF clocks
Date: Fri, 15 Jun 2018 15:56:09 +0100
Message-Id: <20180615145609.22617-1-kieran.bingham+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hard code the clock rates for the SCI_FCK clock to allow
development of serial passthrough within virtualisation environments
without clock support.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/tty/serial/sh-sci.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index b46b146524ce..729326d25056 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -510,8 +510,27 @@ static void sci_port_enable(struct sci_port *sci_port)
 	for (i = 0; i < SCI_NUM_CLKS; i++) {
 		clk_prepare_enable(sci_port->clks[i]);
 		sci_port->clk_rates[i] = clk_get_rate(sci_port->clks[i]);
+
+		pr_err("sci_port->clk_rates[%u] = %lu\n", i , sci_port->clk_rates[i]);
 	}
-	sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK];
+
+	/*
+[   62.482432] sh-sci e6e68000.serial: BRG: 9600+0 bps using DL 96 SR 32
+[   62.491553] sh-sci e6e68000.serial: Using clk scif for 9600+0 bps
+[   62.500304] sci_port->clk_rates[0] = 66560000
+[   62.507276] sci_port->clk_rates[1] = 0
+[   62.513596] sci_port->clk_rates[2] = 266240000
+[   62.520570] sci_port->clk_rates[3] = 14745600
+[   62.527720] sh-sci e6e68000.serial: BRG: 115200+0 bps using DL 8 SR 32
+[   62.536802] sh-sci e6e68000.serial: Using clk scif for 115200+0 bps
+[   62.545613] sci_port->clk_rates[0] = 66560000
+[   62.552463] sci_port->clk_rates[1] = 0
+[   62.558689] sci_port->clk_rates[2] = 266240000
+[   62.565594] sci_port->clk_rates[3] = 14745600
+	 */
+
+	// Temporary Hardcode
+	sci_port->port.uartclk = sci_port->clk_rates[SCI_FCK] = 66560000;
 }
 
 static void sci_port_disable(struct sci_port *sci_port)
-- 
2.17.1
