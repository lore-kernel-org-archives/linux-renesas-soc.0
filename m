Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:56025 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753287AbcGSH3e (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 19 Jul 2016 03:29:34 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7795: Correct header from R-Car Gen3 to R8A7795
Date: Tue, 19 Jul 2016 09:29:34 +0200
Message-Id: <1468913374-32065-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This source file handles r8a7795 only, which is not the sole member of
the R-Car Gen3 family.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued up in sh-pfc-for-v4.9.

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 0f1a111447c30732..1b35ad9b538de544 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1,5 +1,5 @@
 /*
- * R-Car Gen3 processor support - PFC hardware block.
+ * R8A7795 processor support - PFC hardware block.
  *
  * Copyright (C) 2015  Renesas Electronics Corporation
  *
-- 
1.9.1
