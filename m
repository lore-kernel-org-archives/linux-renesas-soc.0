Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57638 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727653AbeJ2GLD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Oct 2018 02:11:03 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a7794: initialize TDSEL register
Date: Sun, 28 Oct 2018 21:24:57 +0000
Message-Id: <20181028212457.1017-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
References: <20181028212457.1017-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Documentation says that some bits in TDSEL must be set (ch 5.3.35 in
R-Car E2 v0.5). However, the reset value of the register is 0, so
software has to do it. Add this to the kernel driver to ensure this is
really done independent of firmware versions. This is needed for some SD
cards supporting SDR104 transfer mode.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index 6d1e5fdc03f8..8a16053d2bec 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -5560,7 +5560,16 @@ static int r8a7794_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *poc
 	return -EINVAL;
 }
 
+static int r8a7794_pinmux_soc_init(struct sh_pfc *pfc)
+{
+	/* Initialize TDSEL according to datasheet */
+	sh_pfc_write(pfc, 0xe6060068, 0x55555500);
+
+	return 0;
+}
+
 static const struct sh_pfc_soc_operations r8a7794_pinmux_ops = {
+	.init = r8a7794_pinmux_soc_init,
 	.pin_to_pocctrl = r8a7794_pin_to_pocctrl,
 };
 
-- 
2.19.0
