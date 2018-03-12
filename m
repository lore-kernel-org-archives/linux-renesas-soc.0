Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:58062 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbeCLO0t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 10:26:49 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7790: Add missing TX_ER pin to avb_mii group
Date: Mon, 12 Mar 2018 15:26:42 +0100
Message-Id: <1520864802-10948-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The pin controller drivers for all R-Car Gen2 SoCs have entries for the
EtherAVB TX_ER pins in their EtherAVB MII groups, except on R-Car H2.

Add the missing pin to restore consistency.

Note that technically TX_ER is an optional signal in the MII bus, and
thus could have its own group, but this is currently not supported by
any R-Car Gen2 pin controller driver.

Fixes: 19ef697d1eb7be06 ("sh-pfc: r8a7790: add EtherAVB pin groups")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
There are no upstream users of EtherAVB MII.

To be queued im sh-pfc-for-v4.17.
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index b769c05480da681e..f6332f247368fcb8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -1835,8 +1835,8 @@ static const unsigned int avb_mii_pins[] = {
 	RCAR_GP_PIN(2, 2),
 
 	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
-	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 10),
-	RCAR_GP_PIN(3, 12),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(3, 8), RCAR_GP_PIN(3, 9),
+	RCAR_GP_PIN(3, 10), RCAR_GP_PIN(3, 12),
 };
 static const unsigned int avb_mii_mux[] = {
 	AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
@@ -1846,8 +1846,8 @@ static const unsigned int avb_mii_mux[] = {
 	AVB_RXD3_MARK,
 
 	AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
-	AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_CLK_MARK,
-	AVB_COL_MARK,
+	AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_ER_MARK,
+	AVB_TX_CLK_MARK, AVB_COL_MARK,
 };
 static const unsigned int avb_gmii_pins[] = {
 	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9), RCAR_GP_PIN(0, 10),
-- 
2.7.4
