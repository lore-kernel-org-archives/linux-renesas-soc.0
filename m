Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:51500 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751789AbcJDJZd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2016 05:25:33 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/4] pinctrl: sh-pfc: r8a7795: Add PoC support for R-Car H3 ES2.0
Date: Tue,  4 Oct 2016 11:25:27 +0200
Message-Id: <1475573127-30054-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
References: <1475573127-30054-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Pin Function Controller module in R-Car H3 ES2.0 differs from
ES1.x.

Add a Proof-of-Concept for detecting the SoC revision at the runtime
using the new soc_device_match() API, and skeleton code for selecting
the pinctrl tables for the actual SoC revision.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 2e8cc2adbed7e251..3f58bfd676ce94c2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include "core.h"
 #include "sh_pfc.h"
@@ -5401,7 +5402,25 @@ static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
 	sh_pfc_write_reg(pfc, PUEN + reg, 32, enable);
 }
 
+static const struct soc_device_attribute r8a7795es1[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
+static int r8a7795_pinmux_init(struct sh_pfc *pfc)
+{
+	if (soc_device_match(r8a7795es1)) {
+		pr_info("%s: R-Car H3 ES1.x detected\n", __func__);
+		// FIXME Fixup r8a7795_pinmux_info for ES1.x
+	} else {
+		pr_info("%s: R-Car H3 >= ES2.0\n", __func__);
+		// FIXME Fixup r8a7795_pinmux_info for ES2.0
+	}
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7795_pinmux_ops = {
+	.init = r8a7795_pinmux_init,
 	.pin_to_pocctrl = r8a7795_pin_to_pocctrl,
 	.get_bias = r8a7795_pinmux_get_bias,
 	.set_bias = r8a7795_pinmux_set_bias,
-- 
1.9.1
