Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:53510 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566AbcFJJ6Y (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 05:58:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: sh7757: Fix duplicate initializer in GPIO pinmux data
Date: Fri, 10 Jun 2016 11:58:19 +0200
Message-Id: <1465552699-5990-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

With C=1:

    drivers/pinctrl/sh-pfc/pfc-sh7757.c:1613:9: warning: Initializer entry defined twice
    drivers/pinctrl/sh-pfc/pfc-sh7757.c:1628:9:   also defined here

Remove the duplicate initializer to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Based on the comment near the definition of A16_MARK, which states A16
belongs to the "PTV" section.

I do not have a sh7757 datasheet.
---
 drivers/pinctrl/sh-pfc/pfc-sh7757.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh7757.c b/drivers/pinctrl/sh-pfc/pfc-sh7757.c
index 0555a1fe076ed353..6d8c31caefc105e0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh7757.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh7757.c
@@ -1625,7 +1625,6 @@ static const struct pinmux_func pinmux_func_gpios[] = {
 	GPIO_FN(VBIOS_CS),
 
 	/* PTW (mobule: LBSC, EVC, SCIF) */
-	GPIO_FN(A16),
 	GPIO_FN(A15),
 	GPIO_FN(A14),
 	GPIO_FN(A13),
-- 
1.9.1
