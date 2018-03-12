Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:51212 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751361AbeCLOk0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 10:40:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/6] pinctrl: sh-pfc: Add SH_PFC_PIN_GROUP_ALIAS()
Date: Mon, 12 Mar 2018 15:40:17 +0100
Message-Id: <1520865622-11774-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
References: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a macro to refer to another pin group with a different name.

This will be used to rename wrongly-named pin groups, while retaining
backwards compatibility with old DTBs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 7253a8cbb0ead00e..d5b6e10cb9ca3328 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -39,13 +39,14 @@ struct sh_pfc_pin {
 	unsigned int configs;
 };
 
-#define SH_PFC_PIN_GROUP(n)				\
+#define SH_PFC_PIN_GROUP_ALIAS(alias, n)		\
 	{						\
-		.name = #n,				\
+		.name = #alias,				\
 		.pins = n##_pins,			\
 		.mux = n##_mux,				\
 		.nr_pins = ARRAY_SIZE(n##_pins),	\
 	}
+#define SH_PFC_PIN_GROUP(n)	SH_PFC_PIN_GROUP_ALIAS(n, n)
 
 struct sh_pfc_pin_group {
 	const char *name;
-- 
2.7.4
