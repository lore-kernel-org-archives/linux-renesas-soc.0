Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46197 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753554AbdKJSPx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 13:15:53 -0500
Received: by mail-lf0-f67.google.com with SMTP id e102so7732630lfi.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Nov 2017 10:15:52 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171110181547.933934369@cogentembedded.com>
Date: Fri, 10 Nov 2017 20:59:00 +0300
To: Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: devicetree@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_{6|22}() helper macros
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=pinctrl-sh-pfc-add-PORT_GP_CFG_-6-22-helper-macros.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

They follow the style of the existing PORT_GP_CFG_<n>() macros and
will be used by a follow-up  patch for the R8A77970 SoC.

Based on the original (and large) patch by Daisuke Matsushita
<daisuke.matsushita.ns@hitachi.com>.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/sh_pfc.h |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ renesas-drivers/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -389,10 +389,14 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 3,  fn, sfx, cfg)
 #define PORT_GP_4(bank, fn, sfx)	PORT_GP_CFG_4(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_6(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_4(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 4,  fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 5,  fn, sfx, cfg)
+#define PORT_GP_6(bank, fn, sfx)	PORT_GP_CFG_6(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_8(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_6(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 6,  fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 7,  fn, sfx, cfg)
 #define PORT_GP_8(bank, fn, sfx)	PORT_GP_CFG_8(bank, fn, sfx, 0)
@@ -450,9 +454,13 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg)
 #define PORT_GP_21(bank, fn, sfx)	PORT_GP_CFG_21(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_22(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_21(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg)
+#define PORT_GP_22(bank, fn, sfx)	PORT_GP_CFG_22(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_22(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg)
 #define PORT_GP_23(bank, fn, sfx)	PORT_GP_CFG_23(bank, fn, sfx, 0)
 
