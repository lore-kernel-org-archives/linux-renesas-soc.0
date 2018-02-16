Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35930 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034273AbeBPO0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:26:21 -0500
Received: by mail-wm0-f65.google.com with SMTP id f3so3471718wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:26:20 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r8a7796: Add TMU pins, groups and functions
Date: Fri, 16 Feb 2018 15:26:11 +0100
Message-Id: <1518791171-14162-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518791171-14162-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791171-14162-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds TMU TCLK{1,2} pins, groups and functions to
the R8A7796 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index e5807d1..f32483c 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -3827,6 +3827,36 @@ static const unsigned int ssi9_ctrl_b_mux[] = {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
 };
 
+/* - TMU -------------------------------------------------------------------- */
+static const unsigned int tmu_tclk1_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 23),
+};
+static const unsigned int tmu_tclk1_a_mux[] = {
+	TCLK1_A_MARK,
+};
+static const unsigned int tmu_tclk1_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(5, 19),
+};
+static const unsigned int tmu_tclk1_b_mux[] = {
+	TCLK1_B_MARK,
+};
+static const unsigned int tmu_tclk2_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 19),
+};
+static const unsigned int tmu_tclk2_a_mux[] = {
+	TCLK2_A_MARK,
+};
+static const unsigned int tmu_tclk2_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 28),
+};
+static const unsigned int tmu_tclk2_b_mux[] = {
+	TCLK2_B_MARK,
+};
+
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
 	/* PWEN, OVC */
@@ -4159,6 +4189,10 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(ssi9_data_b),
 	SH_PFC_PIN_GROUP(ssi9_ctrl_a),
 	SH_PFC_PIN_GROUP(ssi9_ctrl_b),
+	SH_PFC_PIN_GROUP(tmu_tclk1_a),
+	SH_PFC_PIN_GROUP(tmu_tclk1_b),
+	SH_PFC_PIN_GROUP(tmu_tclk2_a),
+	SH_PFC_PIN_GROUP(tmu_tclk2_b),
 	SH_PFC_PIN_GROUP(usb0),
 	SH_PFC_PIN_GROUP(usb1),
 	SH_PFC_PIN_GROUP(usb30),
@@ -4601,6 +4635,13 @@ static const char * const ssi_groups[] = {
 	"ssi9_ctrl_b",
 };
 
+static const char * const tmu_groups[] = {
+	"tmu_tclk1_a",
+	"tmu_tclk1_b",
+	"tmu_tclk2_a",
+	"tmu_tclk2_b",
+};
+
 static const char * const usb0_groups[] = {
 	"usb0",
 };
@@ -4658,6 +4699,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(sdhi2),
 	SH_PFC_FUNCTION(sdhi3),
 	SH_PFC_FUNCTION(ssi),
+	SH_PFC_FUNCTION(tmu),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb30),
-- 
2.7.4
