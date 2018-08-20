Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:43585 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbeHTNcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 09:32:16 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [RFT 5/8] pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
Date: Mon, 20 Aug 2018 12:16:39 +0200
Message-Id: <1534760202-20114-6-git-send-email-jacopo+renesas@jmondi.org>
In-Reply-To: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
References: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds VIN{4,5} pins, groups and functions to the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 504 ++++++++++++++++++++++++++++++++++
 1 file changed, 504 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 5ea63e5..46c0b06 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1982,6 +1982,446 @@ static const unsigned int usb30_id_mux[] = {
 	USB3HS0_ID_MARK,
 };
 
+/* - VIN4 ------------------------------------------------------------------- */
+static const unsigned int vin4_data8_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+};
+
+static const unsigned int vin4_data8_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+};
+
+static const unsigned int vin4_data10_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+};
+
+static const unsigned int vin4_data10_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+};
+
+static const unsigned int vin4_data12_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int vin4_data12_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+};
+
+static const unsigned int vin4_data16_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_data16_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+};
+
+static const unsigned int vin4_data20_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+};
+
+static const unsigned int vin4_data20_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+};
+
+static const unsigned int vin4_data24_a_pins[] = {
+	RCAR_GP_PIN(2, 6),  RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(2, 8),  RCAR_GP_PIN(2, 9),
+	RCAR_GP_PIN(2, 10), RCAR_GP_PIN(2, 11),
+	RCAR_GP_PIN(2, 12), RCAR_GP_PIN(2, 13),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
+};
+
+static const unsigned int vin4_data24_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
+};
+
+static const unsigned int vin4_data8_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+};
+
+static const unsigned int vin4_data8_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+};
+
+static const unsigned int vin4_data10_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+};
+
+static const unsigned int vin4_data10_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+};
+
+static const unsigned int vin4_data12_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+};
+
+static const unsigned int vin4_data12_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+};
+
+static const unsigned int vin4_data16_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_data16_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+};
+
+static const unsigned int vin4_data20_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+};
+
+static const unsigned int vin4_data20_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+};
+
+static const unsigned int vin4_data24_b_pins[] = {
+	RCAR_GP_PIN(1, 8),  RCAR_GP_PIN(1, 11),
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+	RCAR_GP_PIN(0, 5),  RCAR_GP_PIN(0, 6),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+	RCAR_GP_PIN(1, 9),  RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(0, 1),
+};
+
+static const unsigned int vin4_data24_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,   VI4_DATA9_MARK,
+	VI4_DATA10_MARK,  VI4_DATA11_MARK,
+	VI4_DATA12_MARK,  VI4_DATA13_MARK,
+	VI4_DATA14_MARK,  VI4_DATA15_MARK,
+	VI4_DATA16_MARK,  VI4_DATA17_MARK,
+	VI4_DATA18_MARK,  VI4_DATA19_MARK,
+	VI4_DATA20_MARK,  VI4_DATA21_MARK,
+	VI4_DATA22_MARK,  VI4_DATA23_MARK,
+};
+
+static const unsigned int vin4_data8_sft8_pins[] = {
+	RCAR_GP_PIN(1, 4),  RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6),  RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(1, 3),  RCAR_GP_PIN(1, 10),
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 14),
+};
+
+static const unsigned int vin4_data8_sft8_mux[] = {
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+
+static const unsigned int vin4_sync_pins[] = {
+	/* HSYNC, VSYNC */
+	RCAR_GP_PIN(2, 25), RCAR_GP_PIN(2, 24),
+};
+
+static const unsigned int vin4_sync_mux[] = {
+	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
+};
+
+static const unsigned int vin4_field_pins[] = {
+	RCAR_GP_PIN(2, 23),
+};
+
+static const unsigned int vin4_field_mux[] = {
+	VI4_FIELD_MARK,
+};
+
+static const unsigned int vin4_clkenb_pins[] = {
+	RCAR_GP_PIN(1, 2),
+};
+
+static const unsigned int vin4_clkenb_mux[] = {
+	VI4_CLKENB_MARK,
+};
+
+static const unsigned int vin4_clk_pins[] = {
+	RCAR_GP_PIN(2, 22),
+};
+
+static const unsigned int vin4_clk_mux[] = {
+	VI4_CLK_MARK,
+};
+
+/* - VIN5 ------------------------------------------------------------------- */
+static const unsigned int vin5_data8_a_pins[] = {
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+};
+
+static const unsigned int vin5_data8_a_mux[] = {
+	VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
+	VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
+	VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
+	VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
+};
+
+static const unsigned int vin5_data8_sft8_a_pins[] = {
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int vin5_data8_sft8_a_mux[] = {
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+	VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
+	VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
+};
+
+static const unsigned int vin5_data10_a_pins[] = {
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+};
+
+static const unsigned int vin5_data10_a_mux[] = {
+	VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
+	VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
+	VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
+	VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+};
+
+static const unsigned int vin5_data12_a_pins[] = {
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+};
+
+static const unsigned int vin5_data12_a_mux[] = {
+	VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
+	VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
+	VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
+	VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+};
+
+static const unsigned int vin5_data16_a_pins[] = {
+	RCAR_GP_PIN(1, 1),  RCAR_GP_PIN(1, 2),
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 18),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 9),  RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 8),  RCAR_GP_PIN(0, 10),
+	RCAR_GP_PIN(0, 2),  RCAR_GP_PIN(0, 3),
+};
+
+static const unsigned int vin5_data16_a_mux[] = {
+	VI5_DATA0_A_MARK,  VI5_DATA1_A_MARK,
+	VI5_DATA2_A_MARK,  VI5_DATA3_A_MARK,
+	VI5_DATA4_A_MARK,  VI5_DATA5_A_MARK,
+	VI5_DATA6_A_MARK,  VI5_DATA7_A_MARK,
+	VI5_DATA8_A_MARK,  VI5_DATA9_A_MARK,
+	VI5_DATA10_A_MARK, VI5_DATA11_A_MARK,
+	VI5_DATA12_A_MARK, VI5_DATA13_A_MARK,
+	VI5_DATA14_A_MARK, VI5_DATA15_A_MARK,
+};
+
+static const unsigned int vin5_data8_b_pins[] = {
+	RCAR_GP_PIN(2, 23), RCAR_GP_PIN(0, 4),
+	RCAR_GP_PIN(0, 7),  RCAR_GP_PIN(0, 12),
+	RCAR_GP_PIN(0, 13), RCAR_GP_PIN(0, 14),
+	RCAR_GP_PIN(0, 16), RCAR_GP_PIN(0, 17),
+};
+
+static const unsigned int vin5_data8_b_mux[] = {
+	VI5_DATA0_B_MARK,  VI5_DATA1_B_MARK,
+	VI5_DATA2_B_MARK,  VI5_DATA3_B_MARK,
+	VI5_DATA4_B_MARK,  VI5_DATA5_B_MARK,
+	VI5_DATA6_B_MARK,  VI5_DATA7_B_MARK,
+};
+
+static const unsigned int vin5_sync_a_pins[] = {
+	/* HSYNC_N, VSYNC_N */
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 9),
+};
+
+static const unsigned int vin5_sync_a_mux[] = {
+	VI5_HSYNC_N_A_MARK, VI5_VSYNC_N_A_MARK,
+};
+
+static const unsigned int vin5_field_a_pins[] = {
+	RCAR_GP_PIN(1, 10),
+};
+
+static const unsigned int vin5_field_a_mux[] = {
+	VI5_FIELD_A_MARK,
+};
+
+static const unsigned int vin5_clkenb_a_pins[] = {
+	RCAR_GP_PIN(0, 1),
+};
+
+static const unsigned int vin5_clkenb_a_mux[] = {
+	VI5_CLKENB_A_MARK,
+};
+
+static const unsigned int vin5_clk_a_pins[] = {
+	RCAR_GP_PIN(1, 0),
+};
+
+static const unsigned int vin5_clk_a_mux[] = {
+	VI5_CLK_A_MARK,
+};
+
+static const unsigned int vin5_clk_b_pins[] = {
+	RCAR_GP_PIN(2, 22),
+};
+
+static const unsigned int vin5_clk_b_mux[] = {
+	VI5_CLK_B_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb_link),
 	SH_PFC_PIN_GROUP(avb_magic),
@@ -2056,6 +2496,34 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb0_id),
 	SH_PFC_PIN_GROUP(usb30),
 	SH_PFC_PIN_GROUP(usb30_id),
+	SH_PFC_PIN_GROUP(vin4_data8_a),
+	SH_PFC_PIN_GROUP(vin4_data10_a),
+	SH_PFC_PIN_GROUP(vin4_data12_a),
+	SH_PFC_PIN_GROUP(vin4_data16_a),
+	SH_PFC_PIN_GROUP(vin4_data20_a),
+	SH_PFC_PIN_GROUP(vin4_data24_a),
+	SH_PFC_PIN_GROUP(vin4_data8_b),
+	SH_PFC_PIN_GROUP(vin4_data10_b),
+	SH_PFC_PIN_GROUP(vin4_data12_b),
+	SH_PFC_PIN_GROUP(vin4_data16_b),
+	SH_PFC_PIN_GROUP(vin4_data20_b),
+	SH_PFC_PIN_GROUP(vin4_data24_b),
+	SH_PFC_PIN_GROUP(vin4_data8_sft8),
+	SH_PFC_PIN_GROUP(vin4_sync),
+	SH_PFC_PIN_GROUP(vin4_field),
+	SH_PFC_PIN_GROUP(vin4_clkenb),
+	SH_PFC_PIN_GROUP(vin4_clk),
+	SH_PFC_PIN_GROUP(vin5_data8_a),
+	SH_PFC_PIN_GROUP(vin5_data8_sft8_a),
+	SH_PFC_PIN_GROUP(vin5_data10_a),
+	SH_PFC_PIN_GROUP(vin5_data12_a),
+	SH_PFC_PIN_GROUP(vin5_data16_a),
+	SH_PFC_PIN_GROUP(vin5_data8_b),
+	SH_PFC_PIN_GROUP(vin5_sync_a),
+	SH_PFC_PIN_GROUP(vin5_field_a),
+	SH_PFC_PIN_GROUP(vin5_clkenb_a),
+	SH_PFC_PIN_GROUP(vin5_clk_a),
+	SH_PFC_PIN_GROUP(vin5_clk_b),
 };
 
 static const char * const avb_groups[] = {
@@ -2200,6 +2668,40 @@ static const char * const usb30_groups[] = {
 	"usb30_id",
 };
 
+static const char * const vin4_groups[] = {
+	"vin4_data8_a",
+	"vin4_data10_a",
+	"vin4_data12_a",
+	"vin4_data16_a",
+	"vin4_data20_a",
+	"vin4_data24_a",
+	"vin4_data8_b",
+	"vin4_data10_b",
+	"vin4_data12_b",
+	"vin4_data16_b",
+	"vin4_data20_b",
+	"vin4_data24_b",
+	"vin4_data8_sft8",
+	"vin4_sync",
+	"vin4_field",
+	"vin4_clkenb",
+	"vin4_clk",
+};
+
+static const char * const vin5_groups[] = {
+	"vin5_data8_a",
+	"vin5_data8_sft8_a",
+	"vin5_data10_a",
+	"vin5_data12_a",
+	"vin5_data16_a",
+	"vin5_data8_b",
+	"vin5_sync_a",
+	"vin5_field_a",
+	"vin5_clkenb_a",
+	"vin5_clk_a",
+	"vin5_clk_b",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(i2c1),
@@ -2224,6 +2726,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb30),
+	SH_PFC_FUNCTION(vin4),
+	SH_PFC_FUNCTION(vin5),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
