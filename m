Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:19183 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752072AbeB0IM4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:12:56 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a77965: Add USB2.0 host pins, groups and functions
Date: Tue, 27 Feb 2018 17:08:01 +0900
Message-Id: <1519718882-27636-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1519718882-27636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1519718882-27636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB{0,1} (USB2.0 host) pins, groups and functions to
the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index acd57d5..270dfc2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1872,6 +1872,26 @@ enum {
 	SCIF_CLK_B_MARK,
 };
 
+/* - USB0 ------------------------------------------------------------------- */
+static const unsigned int usb0_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 24), RCAR_GP_PIN(6, 25),
+};
+
+static const unsigned int usb0_mux[] = {
+	USB0_PWEN_MARK, USB0_OVC_MARK,
+};
+
+/* - USB1 ------------------------------------------------------------------- */
+static const unsigned int usb1_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 26), RCAR_GP_PIN(6, 27),
+};
+
+static const unsigned int usb1_mux[] = {
+	USB1_PWEN_MARK, USB1_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -1912,6 +1932,8 @@ enum {
 	SH_PFC_PIN_GROUP(scif5_clk_b),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
+	SH_PFC_PIN_GROUP(usb0),
+	SH_PFC_PIN_GROUP(usb1),
 };
 
 static const char * const avb_groups[] = {
@@ -1976,6 +1998,14 @@ enum {
 	"scif_clk_b",
 };
 
+static const char * const usb0_groups[] = {
+	"usb0",
+};
+
+static const char * const usb1_groups[] = {
+	"usb1",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(scif0),
@@ -1985,6 +2015,8 @@ enum {
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif5),
 	SH_PFC_FUNCTION(scif_clk),
+	SH_PFC_FUNCTION(usb0),
+	SH_PFC_FUNCTION(usb1),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
