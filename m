Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33191 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751534AbeCMTyq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 15:54:46 -0400
Received: by mail-lf0-f66.google.com with SMTP id x205-v6so1278241lfa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Mar 2018 12:54:45 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: add EtherAVB pin groups
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Message-ID: <c3e88882-8e77-66e7-fd00-4d5f1a732fc1@cogentembedded.com>
Date: Tue, 13 Mar 2018 22:54:42 +0300
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the EtherAVB pin groups to the R8A77970 PFC driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c |   98 ++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -728,6 +728,82 @@ static const struct sh_pfc_pin pinmux_pi
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - AVB0 ------------------------------------------------------------------- */
+static const unsigned int avb0_link_pins[] = {
+	/* AVB0_LINK */
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int avb0_link_mux[] = {
+	AVB0_LINK_MARK,
+};
+static const unsigned int avb0_magic_pins[] = {
+	/* AVB0_MAGIC */
+	RCAR_GP_PIN(1, 16),
+};
+static const unsigned int avb0_magic_mux[] = {
+	AVB0_MAGIC_MARK,
+};
+static const unsigned int avb0_phy_int_pins[] = {
+	/* AVB0_PHY_INT */
+	RCAR_GP_PIN(1, 17),
+};
+static const unsigned int avb0_phy_int_mux[] = {
+	AVB0_PHY_INT_MARK,
+};
+static const unsigned int avb0_mdio_pins[] = {
+	/* AVB0_MDC, AVB0_MDIO */
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
+};
+static const unsigned int avb0_mdio_mux[] = {
+	AVB0_MDC_MARK, AVB0_MDIO_MARK,
+};
+static const unsigned int avb0_rgmii_pins[] = {
+	/*
+	 * AVB0_TX_CTL, AVB0_TXC, AVB0_TD0, AVB0_TD1, AVB0_TD2, AVB0_TD3,
+	 * AVB0_RX_CTL, AVB0_RXC, AVB0_RD0, AVB0_RD1, AVB0_RD2, AVB0_RD3
+	 */
+	RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 8),
+	RCAR_GP_PIN(1, 9), RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 4),
+	RCAR_GP_PIN(1, 5), RCAR_GP_PIN(1, 6),
+};
+static const unsigned int avb0_rgmii_mux[] = {
+	AVB0_TX_CTL_MARK, AVB0_TXC_MARK,
+	AVB0_TD0_MARK, AVB0_TD1_MARK, AVB0_TD2_MARK, AVB0_TD3_MARK,
+	AVB0_RX_CTL_MARK, AVB0_RXC_MARK,
+	AVB0_RD0_MARK, AVB0_RD1_MARK, AVB0_RD2_MARK, AVB0_RD3_MARK,
+};
+static const unsigned int avb0_txcrefclk_pins[] = {
+	/* AVB0_TXCREFCLK */
+	RCAR_GP_PIN(1, 13),
+};
+static const unsigned int avb0_txcrefclk_mux[] = {
+	AVB0_TXCREFCLK_MARK,
+};
+static const unsigned int avb0_avtp_pps_pins[] = {
+	/* AVB0_AVTP_PPS */
+	RCAR_GP_PIN(2, 6),
+};
+static const unsigned int avb0_avtp_pps_mux[] = {
+	AVB0_AVTP_PPS_MARK,
+};
+static const unsigned int avb0_avtp_capture_pins[] = {
+	/* AVB0_AVTP_CAPTURE */
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int avb0_avtp_capture_mux[] = {
+	AVB0_AVTP_CAPTURE_MARK,
+};
+static const unsigned int avb0_avtp_match_pins[] = {
+	/* AVB0_AVTP_MATCH */
+	RCAR_GP_PIN(1, 19),
+};
+static const unsigned int avb0_avtp_match_mux[] = {
+	AVB0_AVTP_MATCH_MARK,
+};
+
 /* - CANFD Clock ------------------------------------------------------------ */
 static const unsigned int canfd_clk_a_pins[] = {
 	/* CANFD_CLK */
@@ -1599,6 +1675,15 @@ static const unsigned int vin1_clk_mux[]
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(avb0_link),
+	SH_PFC_PIN_GROUP(avb0_magic),
+	SH_PFC_PIN_GROUP(avb0_phy_int),
+	SH_PFC_PIN_GROUP(avb0_mdio),
+	SH_PFC_PIN_GROUP(avb0_rgmii),
+	SH_PFC_PIN_GROUP(avb0_txcrefclk),
+	SH_PFC_PIN_GROUP(avb0_avtp_pps),
+	SH_PFC_PIN_GROUP(avb0_avtp_capture),
+	SH_PFC_PIN_GROUP(avb0_avtp_match),
 	SH_PFC_PIN_GROUP(canfd_clk_a),
 	SH_PFC_PIN_GROUP(canfd_clk_b),
 	SH_PFC_PIN_GROUP(canfd0_data_a),
@@ -1709,6 +1794,18 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(vin1_clk),
 };
 
+static const char * const avb0_groups[] = {
+	"avb0_link",
+	"avb0_magic",
+	"avb0_phy_int",
+	"avb0_mdio",
+	"avb0_rgmii",
+	"avb0_txcrefclk",
+	"avb0_avtp_pps",
+	"avb0_avtp_capture",
+	"avb0_avtp_match",
+};
+
 static const char * const canfd_clk_groups[] = {
 	"canfd_clk_a",
 	"canfd_clk_b",
@@ -1914,6 +2011,7 @@ static const char * const vin1_groups[]
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(canfd_clk),
 	SH_PFC_FUNCTION(canfd0),
 	SH_PFC_FUNCTION(canfd1),
