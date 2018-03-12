Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:34676 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751232AbeCLOk0 (ORCPT
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
Subject: [PATCH 3/6] pinctrl: sh-pfc: r8a7795-es1: Rename EtherAVB "mdc" pin group to "mdio"
Date: Mon, 12 Mar 2018 15:40:19 +0100
Message-Id: <1520865622-11774-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
References: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On other Renesas SoCs, the pin group for the MDIO bus is named "mdio"
instead of "mdc".  Fix the inconsistency, while retaining backwards
compatibility with old DTBs using a pin group alias.

Fixes: b25719eb938eb39a ("pinctrl: sh-pfc: r8a7795: Add group for AVB MDIO and MII pins")
Fixes: 819fd4bfcc84805c ("pinctrl: sh-pfc: r8a7795: add EtherAVB support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 0cf0b8512482548d..82a1c411c952a63e 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -1652,11 +1652,11 @@ static const unsigned int avb_phy_int_pins[] = {
 static const unsigned int avb_phy_int_mux[] = {
 	AVB_PHY_INT_MARK,
 };
-static const unsigned int avb_mdc_pins[] = {
+static const unsigned int avb_mdio_pins[] = {
 	/* AVB_MDC, AVB_MDIO */
 	RCAR_GP_PIN(2, 9), PIN_NUMBER('A', 9),
 };
-static const unsigned int avb_mdc_mux[] = {
+static const unsigned int avb_mdio_mux[] = {
 	AVB_MDC_MARK, AVB_MDIO_MARK,
 };
 static const unsigned int avb_mii_pins[] = {
@@ -3859,7 +3859,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
 	SH_PFC_PIN_GROUP(avb_phy_int),
-	SH_PFC_PIN_GROUP(avb_mdc),
+	SH_PFC_PIN_GROUP_ALIAS(avb_mdc, avb_mdio),	/* Deprecated */
+	SH_PFC_PIN_GROUP(avb_mdio),
 	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(avb_avtp_pps),
 	SH_PFC_PIN_GROUP(avb_avtp_match_a),
@@ -4178,7 +4179,8 @@ static const char * const avb_groups[] = {
 	"avb_link",
 	"avb_magic",
 	"avb_phy_int",
-	"avb_mdc",
+	"avb_mdc",	/* Deprecated, please use "avb_mdio" instead */
+	"avb_mdio",
 	"avb_mii",
 	"avb_avtp_pps",
 	"avb_avtp_match_a",
-- 
2.7.4
