Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:32858 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966394AbeCHTMu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Mar 2018 14:12:50 -0500
Received: by mail-lf0-f65.google.com with SMTP id o145-v6so9889037lff.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Mar 2018 11:12:49 -0800 (PST)
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_25() helper macro
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Message-ID: <b00253dc-b398-56fa-635e-e25f0c9a1609@cogentembedded.com>
Date: Thu, 8 Mar 2018 22:12:47 +0300
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

They follow the style of the existing PORT_GP_CFG_<n>() macros and
will be used by a follow-up patch for the R8A77980 SoC.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
Changes in version 2:
- added Geert's tag.

 drivers/pinctrl/sh-pfc/sh_pfc.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -471,9 +471,13 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 23, fn, sfx, cfg)
 #define PORT_GP_24(bank, fn, sfx)	PORT_GP_CFG_24(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_25(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_24(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg)
+#define PORT_GP_25(bank, fn, sfx)	PORT_GP_CFG_25(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_25(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
 
