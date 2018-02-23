Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:54598 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751913AbeBWNim (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 08:38:42 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Barry Song <baohua@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
        Jiri Slaby <jslaby@suse.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-serial@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 7/9] serial: sh-sci: Fix out-of-bounds access through DT alias
Date: Fri, 23 Feb 2018 14:38:35 +0100
Message-Id: <1519393117-31998-8-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
References: <1519393117-31998-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The sci_ports[] array is indexed using a value derived from the
"serialN" alias in DT, which may lead to an out-of-bounds access.

Fix this by adding a range check.

Note that the array size is defined by a Kconfig symbol
(CONFIG_SERIAL_SH_SCI_NR_UARTS), so this can even be triggered using a
legitimate DTB.

Fixes: 97ed9790c514066b ("serial: sh-sci: Remove unused platform data capabilities field")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Fix Fixes reference,
  - Use ARRAY_SIZE().
---
 drivers/tty/serial/sh-sci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index 4d14f321cbec95e0..f6a6610d434efc33 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3096,6 +3096,10 @@ static struct plat_sci_port *sci_parse_dt(struct platform_device *pdev,
 		dev_err(&pdev->dev, "failed to get alias id (%d)\n", id);
 		return NULL;
 	}
+	if (id >= ARRAY_SIZE(sci_ports)) {
+		dev_err(&pdev->dev, "serial%d out of range\n", id);
+		return NULL;
+	}
 
 	sp = &sci_ports[id];
 	*dev_id = id;
-- 
2.7.4
