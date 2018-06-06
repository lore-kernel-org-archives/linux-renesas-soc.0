Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:15216 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932116AbeFFGnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 02:43:55 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a77990: Add USB2.0 pins, groups and functions
Date: Wed,  6 Jun 2018 15:43:05 +0900
Message-Id: <1528267385-19017-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1528267385-19017-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1528267385-19017-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB0_{PWEN,OVC}_{A,B} and USB0_ID pins, groups and
functions to the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index dc4a957..edefcc3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1784,6 +1784,34 @@ enum {
 	SCIF_CLK_B_MARK,
 };
 
+/* - USB0 ------------------------------------------------------------------- */
+static const unsigned int usb0_a_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 9),
+};
+
+static const unsigned int usb0_a_mux[] = {
+	USB0_PWEN_A_MARK, USB0_OVC_A_MARK,
+};
+
+static const unsigned int usb0_b_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 11), RCAR_GP_PIN(6, 12),
+};
+
+static const unsigned int usb0_b_mux[] = {
+	USB0_PWEN_B_MARK, USB0_OVC_B_MARK,
+};
+
+static const unsigned int usb0_id_pins[] = {
+	/* ID */
+	RCAR_GP_PIN(5, 0)
+};
+
+static const unsigned int usb0_id_mux[] = {
+	USB0_ID_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -1837,6 +1865,9 @@ enum {
 	SH_PFC_PIN_GROUP(scif5_data_c),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
+	SH_PFC_PIN_GROUP(usb0_a),
+	SH_PFC_PIN_GROUP(usb0_b),
+	SH_PFC_PIN_GROUP(usb0_id),
 };
 
 static const char * const avb_groups[] = {
@@ -1933,6 +1964,12 @@ enum {
 	"scif_clk_b",
 };
 
+static const char * const usb0_groups[] = {
+	"usb0_a",
+	"usb0_b",
+	"usb0_id",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(i2c1),
@@ -1948,6 +1985,7 @@ enum {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(usb0),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
