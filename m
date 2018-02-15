Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:38763 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967889AbeBOMBm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 07:01:42 -0500
Received: by mail-wr0-f194.google.com with SMTP id n7so3085685wrn.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 04:01:41 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/4] pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups and functions
Date: Thu, 15 Feb 2018 13:01:28 +0100
Message-Id: <1518696091-23561-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds VIN4 and VIN5 pins, groups and functions for the
R8A7796 SoC.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 454 +++++++++++++++++++++++++++++++++++
 1 file changed, 454 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index e5807d1..0ad8750 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3853,6 +3853,400 @@ static const unsigned int usb30_mux[] = {
 	USB30_PWEN_MARK, USB30_OVC_MARK,
 };
 
+/* - VIN4 ------------------------------------------------------------------- */
+static const unsigned int vin4_data8_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+};
+static const unsigned int vin4_data8_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+};
+static const unsigned int vin4_data8_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+};
+static const unsigned int vin4_data8_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+};
+static const unsigned int vin4_data10_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+};
+static const unsigned int vin4_data10_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+};
+static const unsigned int vin4_data10_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+};
+static const unsigned int vin4_data10_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+};
+static const unsigned int vin4_data12_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int vin4_data12_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+};
+static const unsigned int vin4_data12_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+};
+static const unsigned int vin4_data12_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+};
+static const unsigned int vin4_data16_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin4_data16_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+static const unsigned int vin4_data16_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin4_data16_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+};
+static const unsigned int vin4_data18_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+};
+static const unsigned int vin4_data18_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+};
+static const unsigned int vin4_data18_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+};
+static const unsigned int vin4_data18_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+};
+static const unsigned int vin4_data20_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+};
+static const unsigned int vin4_data20_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+};
+static const unsigned int vin4_data20_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+};
+static const unsigned int vin4_data20_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+};
+static const unsigned int vin4_data24_a_pins[] = {
+	RCAR_GP_PIN(0, 8), RCAR_GP_PIN(0, 9),
+	RCAR_GP_PIN(0, 10), RCAR_GP_PIN(0, 11),
+	RCAR_GP_PIN(0, 12), RCAR_GP_PIN(0, 13),
+	RCAR_GP_PIN(0, 14), RCAR_GP_PIN(0, 15),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data24_a_mux[] = {
+	VI4_DATA0_A_MARK, VI4_DATA1_A_MARK,
+	VI4_DATA2_A_MARK, VI4_DATA3_A_MARK,
+	VI4_DATA4_A_MARK, VI4_DATA5_A_MARK,
+	VI4_DATA6_A_MARK, VI4_DATA7_A_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_data24_b_pins[] = {
+	RCAR_GP_PIN(2, 0), RCAR_GP_PIN(2, 1),
+	RCAR_GP_PIN(2, 2), RCAR_GP_PIN(2, 3),
+	RCAR_GP_PIN(2, 4), RCAR_GP_PIN(2, 5),
+	RCAR_GP_PIN(2, 6), RCAR_GP_PIN(2, 7),
+	RCAR_GP_PIN(1, 0), RCAR_GP_PIN(1, 1),
+	RCAR_GP_PIN(1, 2), RCAR_GP_PIN(1, 3),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin4_data24_b_mux[] = {
+	VI4_DATA0_B_MARK, VI4_DATA1_B_MARK,
+	VI4_DATA2_B_MARK, VI4_DATA3_B_MARK,
+	VI4_DATA4_B_MARK, VI4_DATA5_B_MARK,
+	VI4_DATA6_B_MARK, VI4_DATA7_B_MARK,
+	VI4_DATA8_MARK,  VI4_DATA9_MARK,
+	VI4_DATA10_MARK, VI4_DATA11_MARK,
+	VI4_DATA12_MARK, VI4_DATA13_MARK,
+	VI4_DATA14_MARK, VI4_DATA15_MARK,
+	VI4_DATA16_MARK, VI4_DATA17_MARK,
+	VI4_DATA18_MARK, VI4_DATA19_MARK,
+	VI4_DATA20_MARK, VI4_DATA21_MARK,
+	VI4_DATA22_MARK, VI4_DATA23_MARK,
+};
+static const unsigned int vin4_sync_pins[] = {
+	/* HSYNC#, VSYNC# */
+	RCAR_GP_PIN(1, 18), RCAR_GP_PIN(1, 17),
+};
+static const unsigned int vin4_sync_mux[] = {
+	VI4_HSYNC_N_MARK, VI4_VSYNC_N_MARK,
+};
+static const unsigned int vin4_field_pins[] = {
+	/* FIELD */
+	RCAR_GP_PIN(1, 16),
+};
+static const unsigned int vin4_field_mux[] = {
+	VI4_FIELD_MARK,
+};
+static const unsigned int vin4_clkenb_pins[] = {
+	/* CLKENB */
+	RCAR_GP_PIN(1, 19),
+};
+static const unsigned int vin4_clkenb_mux[] = {
+	VI4_CLKENB_MARK,
+};
+static const unsigned int vin4_clk_pins[] = {
+	/* CLK */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int vin4_clk_mux[] = {
+	VI4_CLK_MARK,
+};
+
+/* - VIN5 ------------------------------------------------------------------- */
+static const unsigned int vin5_data8_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+};
+static const unsigned int vin5_data8_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+};
+static const unsigned int vin5_data10_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+};
+static const unsigned int vin5_data10_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+};
+static const unsigned int vin5_data12_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+};
+static const unsigned int vin5_data12_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+};
+static const unsigned int vin5_data16_pins[] = {
+	RCAR_GP_PIN(0, 0), RCAR_GP_PIN(0, 1),
+	RCAR_GP_PIN(0, 2), RCAR_GP_PIN(0, 3),
+	RCAR_GP_PIN(0, 4), RCAR_GP_PIN(0, 5),
+	RCAR_GP_PIN(0, 6), RCAR_GP_PIN(0, 7),
+	RCAR_GP_PIN(1, 12), RCAR_GP_PIN(1, 13),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 4), RCAR_GP_PIN(1, 5),
+	RCAR_GP_PIN(1, 6), RCAR_GP_PIN(1, 7),
+};
+static const unsigned int vin5_data16_mux[] = {
+	VI5_DATA0_MARK, VI5_DATA1_MARK,
+	VI5_DATA2_MARK, VI5_DATA3_MARK,
+	VI5_DATA4_MARK, VI5_DATA5_MARK,
+	VI5_DATA6_MARK, VI5_DATA7_MARK,
+	VI5_DATA8_MARK,  VI5_DATA9_MARK,
+	VI5_DATA10_MARK, VI5_DATA11_MARK,
+	VI5_DATA12_MARK, VI5_DATA13_MARK,
+	VI5_DATA14_MARK, VI5_DATA15_MARK,
+};
+static const unsigned int vin5_sync_pins[] = {
+	/* HSYNC#, VSYNC# */
+	RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
+};
+static const unsigned int vin5_sync_mux[] = {
+	VI5_HSYNC_N_MARK, VI5_VSYNC_N_MARK,
+};
+static const unsigned int vin5_field_pins[] = {
+	RCAR_GP_PIN(1, 11),
+};
+static const unsigned int vin5_field_mux[] = {
+	/* FIELD */
+	VI5_FIELD_MARK,
+};
+static const unsigned int vin5_clkenb_pins[] = {
+	RCAR_GP_PIN(1, 20),
+};
+static const unsigned int vin5_clkenb_mux[] = {
+	/* CLKENB */
+	VI5_CLKENB_MARK,
+};
+static const unsigned int vin5_clk_pins[] = {
+	RCAR_GP_PIN(1, 21),
+};
+static const unsigned int vin5_clk_mux[] = {
+	/* CLK */
+	VI5_CLK_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(audio_clk_a_a),
 	SH_PFC_PIN_GROUP(audio_clk_a_b),
@@ -4162,6 +4556,32 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb30),
+	SH_PFC_PIN_GROUP(vin4_data8_a),
+	SH_PFC_PIN_GROUP(vin4_data10_a),
+	SH_PFC_PIN_GROUP(vin4_data12_a),
+	SH_PFC_PIN_GROUP(vin4_data16_a),
+	SH_PFC_PIN_GROUP(vin4_data18_a),
+	SH_PFC_PIN_GROUP(vin4_data20_a),
+	SH_PFC_PIN_GROUP(vin4_data24_a),
+	SH_PFC_PIN_GROUP(vin4_data8_b),
+	SH_PFC_PIN_GROUP(vin4_data10_b),
+	SH_PFC_PIN_GROUP(vin4_data12_b),
+	SH_PFC_PIN_GROUP(vin4_data16_b),
+	SH_PFC_PIN_GROUP(vin4_data18_b),
+	SH_PFC_PIN_GROUP(vin4_data20_b),
+	SH_PFC_PIN_GROUP(vin4_data24_b),
+	SH_PFC_PIN_GROUP(vin4_sync),
+	SH_PFC_PIN_GROUP(vin4_field),
+	SH_PFC_PIN_GROUP(vin4_clkenb),
+	SH_PFC_PIN_GROUP(vin4_clk),
+	SH_PFC_PIN_GROUP(vin5_data8),
+	SH_PFC_PIN_GROUP(vin5_data10),
+	SH_PFC_PIN_GROUP(vin5_data12),
+	SH_PFC_PIN_GROUP(vin5_data16),
+	SH_PFC_PIN_GROUP(vin5_sync),
+	SH_PFC_PIN_GROUP(vin5_field),
+	SH_PFC_PIN_GROUP(vin5_clkenb),
+	SH_PFC_PIN_GROUP(vin5_clk),
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4613,6 +5033,38 @@ static const char * const usb30_groups[] = {
 	"usb30",
 };
 
+static const char * const vin4_groups[] = {
+	"vin4_data8_a",
+	"vin4_data10_a",
+	"vin4_data12_a",
+	"vin4_data16_a",
+	"vin4_data18_a",
+	"vin4_data20_a",
+	"vin4_data24_a",
+	"vin4_data8_b",
+	"vin4_data10_b",
+	"vin4_data12_b",
+	"vin4_data16_b",
+	"vin4_data18_b",
+	"vin4_data20_b",
+	"vin4_data24_b",
+	"vin4_sync",
+	"vin4_field",
+	"vin4_clkenb",
+	"vin4_clk",
+};
+
+static const char * const vin5_groups[] = {
+	"vin5_data8",
+	"vin5_data10",
+	"vin5_data12",
+	"vin5_data16",
+	"vin5_sync",
+	"vin5_field",
+	"vin5_clkenb",
+	"vin5_clk",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -4661,6 +5113,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb30),
+	SH_PFC_FUNCTION(vin4),
+	SH_PFC_FUNCTION(vin5),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.7.4
