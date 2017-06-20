Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34285 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751937AbdFTNb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2017 09:31:28 -0400
Received: by mail-wm0-f66.google.com with SMTP id f134so5607438wme.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2017 06:31:28 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: Add SCIF1 and SCIF2 pin groups
Date: Tue, 20 Jun 2017 15:31:22 +0200
Message-Id: <1497965482-10785-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add SCIF1 and SCIF2 pin groups to the R8A7792 PFC driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---

Superseding "[PATCH] pinctrl: sh-pfc: r8a7792: Add SCIF1 pin groups", this
adds the missing SCIF1 control pins as well as SCIF2, as suggested by Geert.

CU
Uli


 drivers/pinctrl/sh-pfc/pfc-r8a7792.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index 21badb6..cc3597f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1137,6 +1137,43 @@ static const unsigned int scif0_ctrl_pins[] = {
 static const unsigned int scif0_ctrl_mux[] = {
 	RTS0_N_MARK, CTS0_N_MARK,
 };
+/* - SCIF1 ------------------------------------------------------------------ */
+static const unsigned int scif1_data_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(10, 19), RCAR_GP_PIN(10, 18),
+};
+static const unsigned int scif1_data_mux[] = {
+	RX1_MARK, TX1_MARK,
+};
+static const unsigned int scif1_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(10, 15),
+};
+static const unsigned int scif1_clk_mux[] = {
+	SCK1_MARK,
+};
+static const unsigned int scif1_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(10, 17), RCAR_GP_PIN(10, 16),
+};
+static const unsigned int scif1_ctrl_mux[] = {
+	RTS1_N_MARK, CTS1_N_MARK,
+};
+/* - SCIF2 ------------------------------------------------------------------ */
+static const unsigned int scif2_data_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(10, 22), RCAR_GP_PIN(10, 21),
+};
+static const unsigned int scif2_data_mux[] = {
+	RX2_MARK, TX2_MARK,
+};
+static const unsigned int scif2_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(10, 20),
+};
+static const unsigned int scif2_clk_mux[] = {
+	SCK2_MARK,
+};
 /* - SCIF3 ------------------------------------------------------------------ */
 static const unsigned int scif3_data_pins[] = {
 	/* RX, TX */
@@ -1680,6 +1717,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data),
+	SH_PFC_PIN_GROUP(scif1_clk),
+	SH_PFC_PIN_GROUP(scif1_ctrl),
+	SH_PFC_PIN_GROUP(scif2_data),
+	SH_PFC_PIN_GROUP(scif2_clk),
 	SH_PFC_PIN_GROUP(scif3_data),
 	SH_PFC_PIN_GROUP(scif3_clk),
 	SH_PFC_PIN_GROUP(sdhi0_data1),
@@ -1826,6 +1868,17 @@ static const char * const scif0_groups[] = {
 	"scif0_ctrl",
 };
 
+static const char * const scif1_groups[] = {
+	"scif1_data",
+	"scif1_clk",
+	"scif1_ctrl",
+};
+
+static const char * const scif2_groups[] = {
+	"scif2_data",
+	"scif2_clk",
+};
+
 static const char * const scif3_groups[] = {
 	"scif3_data",
 	"scif3_clk",
@@ -1924,6 +1977,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(qspi),
 	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
+	SH_PFC_FUNCTION(scif2),
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(sdhi0),
 	SH_PFC_FUNCTION(vin0),
-- 
2.7.4
