Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46111 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387700AbeKGEsv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 23:48:51 -0500
Received: by mail-lf1-f66.google.com with SMTP id f23so5168732lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Nov 2018 11:22:06 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: add QSPI pins, groups, and
 functions
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Message-ID: <38b17a18-59d6-3fbf-8413-915005b274f6@cogentembedded.com>
Date: Tue, 6 Nov 2018 21:52:55 +0300
MIME-Version: 1.0
In-Reply-To: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>

Add the QSPI{0|1} pins/groups/functions to the R8A77970 PFC driver.

[Sergei: ported to the upstream driver, fixed up the swapped QSPI0 SPCLK/
SSL pins, fixed up the comments, moved the QSPI pins/groups/functions to
be in the alphanumeric order, removed unneeded empty lines, renamed the
patch.]

Signed-off-by: Dmitry Shifrin <dmitry.shifrin@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c |   70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

Index: renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
===================================================================
--- renesas-drivers.orig/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ renesas-drivers/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -1382,6 +1382,56 @@ static const unsigned int pwm4_b_mux[] =
 	PWM4_B_MARK,
 };
 
+/* - QSPI0 ------------------------------------------------------------------ */
+static const unsigned int qspi0_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(5, 0), RCAR_GP_PIN(5, 5),
+};
+static const unsigned int qspi0_ctrl_mux[] = {
+	QSPI0_SPCLK_MARK, QSPI0_SSL_MARK,
+};
+static const unsigned int qspi0_data2_pins[] = {
+	/* MOSI_IO0, MISO_IO1 */
+	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
+};
+static const unsigned int qspi0_data2_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+};
+static const unsigned int qspi0_data4_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(5, 1), RCAR_GP_PIN(5, 2),
+	RCAR_GP_PIN(5, 3), RCAR_GP_PIN(5, 4),
+};
+static const unsigned int qspi0_data4_mux[] = {
+	QSPI0_MOSI_IO0_MARK, QSPI0_MISO_IO1_MARK,
+	QSPI0_IO2_MARK, QSPI0_IO3_MARK
+};
+
+/* - QSPI1 ------------------------------------------------------------------ */
+static const unsigned int qspi1_ctrl_pins[] = {
+	/* SPCLK, SSL */
+	RCAR_GP_PIN(5, 6), RCAR_GP_PIN(5, 11),
+};
+static const unsigned int qspi1_ctrl_mux[] = {
+	QSPI1_SPCLK_MARK, QSPI1_SSL_MARK,
+};
+static const unsigned int qspi1_data2_pins[] = {
+	/* MOSI_IO0, MISO_IO1 */
+	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
+};
+static const unsigned int qspi1_data2_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+};
+static const unsigned int qspi1_data4_pins[] = {
+	/* MOSI_IO0, MISO_IO1, IO2, IO3 */
+	RCAR_GP_PIN(5, 7), RCAR_GP_PIN(5, 8),
+	RCAR_GP_PIN(5, 9), RCAR_GP_PIN(5, 10),
+};
+static const unsigned int qspi1_data4_mux[] = {
+	QSPI1_MOSI_IO0_MARK, QSPI1_MISO_IO1_MARK,
+	QSPI1_IO2_MARK, QSPI1_IO3_MARK
+};
+
 /* - SCIF Clock ------------------------------------------------------------- */
 static const unsigned int scif_clk_a_pins[] = {
 	/* SCIF_CLK */
@@ -1756,6 +1806,12 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(pwm3_b),
 	SH_PFC_PIN_GROUP(pwm4_a),
 	SH_PFC_PIN_GROUP(pwm4_b),
+	SH_PFC_PIN_GROUP(qspi0_ctrl),
+	SH_PFC_PIN_GROUP(qspi0_data2),
+	SH_PFC_PIN_GROUP(qspi0_data4),
+	SH_PFC_PIN_GROUP(qspi1_ctrl),
+	SH_PFC_PIN_GROUP(qspi1_data2),
+	SH_PFC_PIN_GROUP(qspi1_data4),
 	SH_PFC_PIN_GROUP(scif_clk_a),
 	SH_PFC_PIN_GROUP(scif_clk_b),
 	SH_PFC_PIN_GROUP(scif0_data),
@@ -1950,6 +2006,18 @@ static const char * const pwm4_groups[]
 	"pwm4_b",
 };
 
+static const char * const qspi0_groups[] = {
+	"qspi0_ctrl",
+	"qspi0_data2",
+	"qspi0_data4",
+};
+
+static const char * const qspi1_groups[] = {
+	"qspi1_ctrl",
+	"qspi1_data2",
+	"qspi1_data4",
+};
+
 static const char * const scif_clk_groups[] = {
 	"scif_clk_a",
 	"scif_clk_b",
@@ -2033,6 +2101,8 @@ static const struct sh_pfc_function pinm
 	SH_PFC_FUNCTION(pwm2),
 	SH_PFC_FUNCTION(pwm3),
 	SH_PFC_FUNCTION(pwm4),
+	SH_PFC_FUNCTION(qspi0),
+	SH_PFC_FUNCTION(qspi1),
 	SH_PFC_FUNCTION(scif_clk),
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
