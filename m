Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:7130 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752491AbeGCKy3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 06:54:29 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Add USB3.0 pins, groups and functions
Date: Tue,  3 Jul 2018 19:53:28 +0900
Message-Id: <1530615208-7827-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB30_{PWEN,OVC} and USB3HS0_ID pins, groups and functions
to the R8A77990 SoC.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index edefcc3..b81c807 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1812,6 +1812,25 @@ enum {
 	USB0_ID_MARK,
 };
 
+/* - USB30 ------------------------------------------------------------------ */
+static const unsigned int usb30_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 17), RCAR_GP_PIN(6, 9),
+};
+
+static const unsigned int usb30_mux[] = {
+	USB30_PWEN_MARK, USB30_OVC_MARK,
+};
+
+static const unsigned int usb30_id_pins[] = {
+	/* ID */
+	RCAR_GP_PIN(5, 0),
+};
+
+static const unsigned int usb30_id_mux[] = {
+	USB3HS0_ID_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -1868,6 +1887,8 @@ enum {
 	SH_PFC_PIN_GROUP(usb0_a),
 	SH_PFC_PIN_GROUP(usb0_b),
 	SH_PFC_PIN_GROUP(usb0_id),
+	SH_PFC_PIN_GROUP(usb30),
+	SH_PFC_PIN_GROUP(usb30_id),
 };
 
 static const char * const avb_groups[] = {
@@ -1970,6 +1991,11 @@ enum {
 	"usb0_id",
 };
 
+static const char * const usb30_groups[] = {
+	"usb30",
+	"usb30_id",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(i2c1),
@@ -1986,6 +2012,7 @@ enum {
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(usb0),
+	SH_PFC_FUNCTION(usb30),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
