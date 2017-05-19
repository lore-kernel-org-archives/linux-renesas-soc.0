Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33863 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752816AbdESNID (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2017 09:08:03 -0400
Received: by mail-wr0-f194.google.com with SMTP id 6so2953249wrb.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2017 06:08:02 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7792: Add SCIF1 pin groups
Date: Fri, 19 May 2017 15:07:58 +0200
Message-Id: <1495199278-16432-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add SCIF1 pin groups to the R8A7792 PFC driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---

These are the pins the MAX9260 deserializers are connected to on Blanche.

CU
Uli


 drivers/pinctrl/sh-pfc/pfc-r8a7792.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
index 21badb6..2f9ee3f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7792.c
@@ -1137,6 +1137,21 @@ static const unsigned int scif0_ctrl_pins[] = {
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
 /* - SCIF3 ------------------------------------------------------------------ */
 static const unsigned int scif3_data_pins[] = {
 	/* RX, TX */
@@ -1680,6 +1695,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
+	SH_PFC_PIN_GROUP(scif1_data),
+	SH_PFC_PIN_GROUP(scif1_clk),
 	SH_PFC_PIN_GROUP(scif3_data),
 	SH_PFC_PIN_GROUP(scif3_clk),
 	SH_PFC_PIN_GROUP(sdhi0_data1),
@@ -1826,6 +1843,11 @@ static const char * const scif0_groups[] = {
 	"scif0_ctrl",
 };
 
+static const char * const scif1_groups[] = {
+	"scif1_data",
+	"scif1_clk",
+};
+
 static const char * const scif3_groups[] = {
 	"scif3_data",
 	"scif3_clk",
@@ -1924,6 +1946,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof1),
 	SH_PFC_FUNCTION(qspi),
 	SH_PFC_FUNCTION(scif0),
+	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(sdhi0),
 	SH_PFC_FUNCTION(vin0),
-- 
2.7.4
