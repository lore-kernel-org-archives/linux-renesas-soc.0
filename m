Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:59418 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751419AbeCLOk1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 10:40:27 -0400
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
Subject: [PATCH 6/6] pinctrl: sh-pfc: r8a77995: Rename EtherAVB "mdc" pin group to "mdio"
Date: Mon, 12 Mar 2018 15:40:22 +0100
Message-Id: <1520865622-11774-7-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
References: <1520865622-11774-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On other Renesas SoCs, the pin group for the MDIO bus is named "mdio"
instead of "mdc".  Fix the inconsistency, while retaining backwards
compatibility with old DTBs using a pin group alias.

Fixes: 66abd968d0ef3eb1 ("pinctrl: sh-pfc: r8a77995: Add EthernetAVB pins, groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 27b9417be59b0b0b..cc80dbe1841daca9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -988,11 +988,11 @@ static const unsigned int avb0_phy_int_pins[] = {
 static const unsigned int avb0_phy_int_mux[] = {
 	AVB0_PHY_INT_MARK,
 };
-static const unsigned int avb0_mdc_pins[] = {
+static const unsigned int avb0_mdio_pins[] = {
 	/* AVB0_MDC, AVB0_MDIO */
 	RCAR_GP_PIN(5, 17), RCAR_GP_PIN(5, 16),
 };
-static const unsigned int avb0_mdc_mux[] = {
+static const unsigned int avb0_mdio_mux[] = {
 	AVB0_MDC_MARK, AVB0_MDIO_MARK,
 };
 static const unsigned int avb0_mii_pins[] = {
@@ -1800,7 +1800,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
 	SH_PFC_PIN_GROUP(avb0_phy_int),
-	SH_PFC_PIN_GROUP(avb0_mdc),
+	SH_PFC_PIN_GROUP_ALIAS(avb0_mdc, avb0_mdio),	/* Deprecated */
+	SH_PFC_PIN_GROUP(avb0_mdio),
 	SH_PFC_PIN_GROUP(avb0_mii),
 	SH_PFC_PIN_GROUP(avb0_avtp_pps_a),
 	SH_PFC_PIN_GROUP(avb0_avtp_match_a),
@@ -1901,7 +1902,8 @@ static const char * const avb0_groups[] = {
 	"avb0_link",
 	"avb0_magic",
 	"avb0_phy_int",
-	"avb0_mdc",
+	"avb0_mdc",	/* Deprecated, please use "avb0_mdio" instead */
+	"avb0_mdio",
 	"avb0_mii",
 	"avb0_avtp_pps_a",
 	"avb0_avtp_match_a",
-- 
2.7.4
