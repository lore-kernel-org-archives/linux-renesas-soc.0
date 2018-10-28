Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57636 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727653AbeJ2GLB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 02:11:01 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7790: initialize TDSEL register
Date: Sun, 28 Oct 2018 21:24:56 +0000
Message-Id: <20181028212457.1017-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Documentation says that some bits in TDSEL must be set (ch 5.3.39 in R-Car H2
v0.91). However, the reset value of the register is 0, so software has to do
it. Add this to the kernel driver to ensure this is really done independent of
firmware versions.

This is needed for some SD cards supporting SDR104 transfer mode. For
me, TDSEL was not initialized by the firmware and I had problems with
the card when re-inserting it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index ab7a35392cd8..c0e679105df9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 
+#include "core.h"
 #include "sh_pfc.h"
 
 /*
@@ -5691,7 +5692,16 @@ static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return 31 - (pin & 0x1f);
 }
 
+static int r8a7790_pinmux_soc_init(struct sh_pfc *pfc)
+{
+	/* Initialize TDSEL according to datasheet */
+	sh_pfc_write(pfc, 0xe6060088, 0x00155554);
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
+	.init = r8a7790_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 };
 
-- 
2.19.0
