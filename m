Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41452 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763466AbdAITch (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 14:32:37 -0500
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com,
        geert+renesas@glider.be, chris.brandt@renesas.com,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: sh-pfc: r7s72100: Enable DIO mode
Date: Mon,  9 Jan 2017 20:32:24 +0100
Message-Id: <1483990346-26998-2-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When selecting alternative function for one pin, set the PIPCn.PIPCnm
bit to 1 to enable direct IO mode control (the alternative function
decides the pin direction) and disable input buffer and bidirection
control functionalities (PIBCn.PIBCnm = 0 and PBDCn.PDBCnm = 0) intially
enabled when configuring the pin in PORT mode

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
index 72e1dff..8c0ae13 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
@@ -58,9 +58,12 @@ enum {
 	PINMUX_DATA(name##_DATA, name##_PMC_0,		\
 		    name##_PIBC_1, name##_PBDC_1)
 
-#define _P_FN(n, fn, pfcae, pfce, pfc)					\
+#define _P_FN(n, fn, pfcae, pfce, pfc)			\
 	PINMUX_DATA(n##_MARK_FN##fn, n##_PMC_1,		\
-		    n##_PFCAE_##pfcae, n##_PFCE_##pfce, n##_PFC_##pfc)
+		    n##_PFCAE_##pfcae,			\
+		    n##_PFCE_##pfce,			\
+		    n##_PFC_##pfc,			\
+		    n##_PIPC_1, n##_PIBC_0, n##_PBDC_0)
 
 #define _P_MARK_FN1(bank, pin, name, sfx, cfg) _P_FN(name, 1, 0, 0, 0)
 #define _P_MARK_FN2(bank, pin, name, sfx, cfg) _P_FN(name, 2, 0, 0, 1)
-- 
2.7.4
