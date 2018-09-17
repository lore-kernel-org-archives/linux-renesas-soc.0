Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:61660 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727329AbeIQXzV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 19:55:21 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] serial: sh-sci: Add earlycon for R7S9210
Date: Mon, 17 Sep 2018 13:26:23 -0500
Message-Id: <20180917182623.29221-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since the register offsets are different for RZ/A2 SCIF, we need
to declare a separate string for it.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
To be applied on top of Geert's patches:
 *  [PATCH 1/2] Revert "serial: sh-sci: Remove SCIx_RZ_SCIFA_REGTYPE"
 *  [PATCH 2/2] Revert "serial: sh-sci: Allow for compressed SCIF address"
---
 drivers/tty/serial/sh-sci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ab3f6e91853d..426241da2e44 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3414,6 +3414,12 @@ static int __init scif_early_console_setup(struct earlycon_device *device,
 {
 	return early_console_setup(device, PORT_SCIF);
 }
+static int __init rzscifa_early_console_setup(struct earlycon_device *device,
+					  const char *opt)
+{
+	port_cfg.regtype = SCIx_RZ_SCIFA_REGTYPE;
+	return early_console_setup(device, PORT_SCIF);
+}
 static int __init scifa_early_console_setup(struct earlycon_device *device,
 					  const char *opt)
 {
@@ -3432,6 +3438,7 @@ static int __init hscif_early_console_setup(struct earlycon_device *device,
 
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
+OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
 OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);
-- 
2.16.1
