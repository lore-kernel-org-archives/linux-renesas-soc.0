Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:34284 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752083AbeB0IM4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 03:12:56 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be,
        linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] pinctrl: sh-pfc: r8a77965: Add USB3.0 host pins, groups and functions
Date: Tue, 27 Feb 2018 17:08:02 +0900
Message-Id: <1519718882-27636-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1519718882-27636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1519718882-27636-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds USB30 (USB3.0 host) pin, group and function to
the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 270dfc2..70190b5 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1892,6 +1892,16 @@ enum {
 	USB1_PWEN_MARK, USB1_OVC_MARK,
 };
 
+/* - USB30 ------------------------------------------------------------------ */
+static const unsigned int usb30_pins[] = {
+	/* PWEN, OVC */
+	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
+};
+
+static const unsigned int usb30_mux[] = {
+	USB30_PWEN_MARK, USB30_OVC_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -1934,6 +1944,7 @@ enum {
 	SH_PFC_PIN_GROUP(scif_clk_b),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
+	SH_PFC_PIN_GROUP(usb30),
 };
 
 static const char * const avb_groups[] = {
@@ -2006,6 +2017,10 @@ enum {
 	"usb1",
 };
 
+static const char * const usb30_groups[] = {
+	"usb30",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(scif0),
@@ -2017,6 +2032,7 @@ enum {
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
+	SH_PFC_FUNCTION(usb30),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
1.9.1
