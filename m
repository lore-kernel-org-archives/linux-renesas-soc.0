Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:36817 "EHLO
	mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753871AbcGDTw1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 4 Jul 2016 15:52:27 -0400
Received: by mail-lf0-f52.google.com with SMTP id q132so122494125lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Jul 2016 12:52:26 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org,
	geert+renesas@glider.be
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: add EtherAVB pin groups
Date: Mon, 04 Jul 2016 22:52:20 +0300
Message-ID: <1734030.FmmGtJt7OA@wasted.cogentembedded.com>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the EtherAVB pin groups to the R8A7792 PFC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'devel' branch of Linus Walleij's 'linux-pinctrl.git'
repo plus my 2 PFC patches posted last week...

 drivers/pinctrl/sh-pfc/pfc-r8a7792.c |   91 +++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -728,6 +728,81 @@ static const struct sh_pfc_pin pinmux_pi
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - AVB -------------------------------------------------------------------- */
+static const unsigned int avb_link_pins[] = {
+	RCAR_GP_PIN(7, 9),
+};
+static const unsigned int avb_link_mux[] = {
+	AVB_LINK_MARK,
+};
+static const unsigned int avb_magic_pins[] = {
+	RCAR_GP_PIN(7, 10),
+};
+static const unsigned int avb_magic_mux[] = {
+	AVB_MAGIC_MARK,
+};
+static const unsigned int avb_phy_int_pins[] = {
+	RCAR_GP_PIN(7, 11),
+};
+static const unsigned int avb_phy_int_mux[] = {
+	AVB_PHY_INT_MARK,
+};
+static const unsigned int avb_mdio_pins[] = {
+	RCAR_GP_PIN(7, 7), RCAR_GP_PIN(7, 8),
+};
+static const unsigned int avb_mdio_mux[] = {
+	AVB_MDC_MARK, AVB_MDIO_MARK,
+};
+static const unsigned int avb_mii_pins[] = {
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15), RCAR_GP_PIN(6, 16),
+	RCAR_GP_PIN(6, 12),
+
+	RCAR_GP_PIN(6, 2),  RCAR_GP_PIN(6, 3),  RCAR_GP_PIN(6, 4),
+	RCAR_GP_PIN(6, 5),
+
+	RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 0),  RCAR_GP_PIN(6, 1),
+	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(6, 13), RCAR_GP_PIN(7, 5),
+	RCAR_GP_PIN(7, 0),  RCAR_GP_PIN(6, 11),
+};
+static const unsigned int avb_mii_mux[] = {
+	AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
+	AVB_TXD3_MARK,
+
+	AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
+	AVB_RXD3_MARK,
+
+	AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
+	AVB_CRS_MARK, AVB_TX_EN_MARK, AVB_TX_ER_MARK,
+	AVB_TX_CLK_MARK, AVB_COL_MARK,
+};
+static const unsigned int avb_gmii_pins[] = {
+	RCAR_GP_PIN(6, 14), RCAR_GP_PIN(6, 15), RCAR_GP_PIN(6, 16),
+	RCAR_GP_PIN(6, 12), RCAR_GP_PIN(7, 1),  RCAR_GP_PIN(7, 2),
+	RCAR_GP_PIN(7, 3),  RCAR_GP_PIN(7, 4),
+
+	RCAR_GP_PIN(6, 2),  RCAR_GP_PIN(6, 3), RCAR_GP_PIN(6, 4),
+	RCAR_GP_PIN(6, 5),  RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
+	RCAR_GP_PIN(6, 8),  RCAR_GP_PIN(6, 9),
+
+	RCAR_GP_PIN(6, 10), RCAR_GP_PIN(6, 0), RCAR_GP_PIN(6, 1),
+	RCAR_GP_PIN(7, 12), RCAR_GP_PIN(7, 6), RCAR_GP_PIN(7, 13),
+	RCAR_GP_PIN(6, 13), RCAR_GP_PIN(7, 5), RCAR_GP_PIN(7, 0),
+	RCAR_GP_PIN(6, 11),
+};
+static const unsigned int avb_gmii_mux[] = {
+	AVB_TXD0_MARK, AVB_TXD1_MARK, AVB_TXD2_MARK,
+	AVB_TXD3_MARK, AVB_TXD4_MARK, AVB_TXD5_MARK,
+	AVB_TXD6_MARK, AVB_TXD7_MARK,
+
+	AVB_RXD0_MARK, AVB_RXD1_MARK, AVB_RXD2_MARK,
+	AVB_RXD3_MARK, AVB_RXD4_MARK, AVB_RXD5_MARK,
+	AVB_RXD6_MARK, AVB_RXD7_MARK,
+
+	AVB_RX_ER_MARK, AVB_RX_CLK_MARK, AVB_RX_DV_MARK,
+	AVB_CRS_MARK, AVB_GTX_CLK_MARK, AVB_GTXREFCLK_MARK,
+	AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,
+	AVB_COL_MARK,
+};
 /* - INTC ------------------------------------------------------------------- */
 static const unsigned int intc_irq0_pins[] = {
 	/* IRQ0 */
@@ -853,6 +928,12 @@ static const unsigned int scif3_clk_mux[
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb_link),
+	SH_PFC_PIN_GROUP(avb_magic),
+	SH_PFC_PIN_GROUP(avb_phy_int),
+	SH_PFC_PIN_GROUP(avb_mdio),
+	SH_PFC_PIN_GROUP(avb_mii),
+	SH_PFC_PIN_GROUP(avb_gmii),
 	SH_PFC_PIN_GROUP(intc_irq0),
 	SH_PFC_PIN_GROUP(intc_irq1),
 	SH_PFC_PIN_GROUP(intc_irq2),
@@ -872,6 +953,15 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(scif3_clk),
 };
 
+static const char * const avb_groups[] = {
+	"avb_link",
+	"avb_magic",
+	"avb_phy_int",
+	"avb_mdio",
+	"avb_mii",
+	"avb_gmii",
+};
+
 static const char * const intc_groups[] = {
 	"intc_irq0",
 	"intc_irq1",
@@ -902,6 +992,7 @@ static const char * const scif3_groups[]
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(intc),
 	SH_PFC_FUNCTION(lbsc),
 	SH_PFC_FUNCTION(scif0),
