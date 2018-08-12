Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33536 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHLQLK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 Aug 2018 12:11:10 -0400
Received: by mail-wm0-f66.google.com with SMTP id r24-v6so5392838wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Aug 2018 06:33:05 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
To: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Cc: Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: [PATCH v2 3/7] pinctrl: sh-pfc: r8a77965: Add HSCIF0 pins, groups, and functions
Date: Sun, 12 Aug 2018 15:31:45 +0200
Message-Id: <20180812133149.7710-3-erosca@de.adit-jv.com>
In-Reply-To: <20180812133149.7710-1-erosca@de.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to R-Car Gen3 HW manual Rev.1.00 Apr 2018, M3-N SoC implements
five (0..4) HSCIF channels, similar to H3, M3-W and E3.

The story behind this patch is tackling below dmesg warnings, which pop
up when booting M3NULCB Kingfisher board:

$ dmesg | grep sh-pfc
sh-pfc e6060000.pin-controller: r8a77965_pfc support registered
sh-pfc e6060000.pin-controller: function 'hscif0' not supported
sh-pfc e6060000.pin-controller: invalid function hscif0 in map table
sh-pfc e6060000.pin-controller: function 'hscif0' not supported
sh-pfc e6060000.pin-controller: invalid function hscif0 in map table

To fix them, extract the HSCIF0 part from below v4.15-rc1 commits:
 - commit 7a362e3488cb ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
 - commit 0e4e4999aac1 ("pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions")

Note that `checkpatch --strict` throws several "CHECK: Please use a
blank line after function/struct/union/enum declarations", which are
ignored for the sake of staying in sync with the aforementioned commits.

Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
Changes in v2:
 - Newly added.
 - IMHO mirroring the mentioned H3 and M3-W sh-pfc commits *entirely* is
   a better option to avoid work fragmentation, but I leave this
   decision to the maintainer.
---
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 32 +++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index d2bbee656381..fe16d194f69b 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -1758,6 +1758,28 @@ static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
 
+/* - HSCIF0 ----------------------------------------------------------------- */
+static const unsigned int hscif0_data_pins[] = {
+	/* RX, TX */
+	RCAR_GP_PIN(5, 13), RCAR_GP_PIN(5, 14),
+};
+static const unsigned int hscif0_data_mux[] = {
+	HRX0_MARK, HTX0_MARK,
+};
+static const unsigned int hscif0_clk_pins[] = {
+	/* SCK */
+	RCAR_GP_PIN(5, 12),
+};
+static const unsigned int hscif0_clk_mux[] = {
+	HSCK0_MARK,
+};
+static const unsigned int hscif0_ctrl_pins[] = {
+	/* RTS, CTS */
+	RCAR_GP_PIN(5, 16), RCAR_GP_PIN(5, 15),
+};
+static const unsigned int hscif0_ctrl_mux[] = {
+	HRTS0_N_MARK, HCTS0_N_MARK,
+};
 /* - I2C -------------------------------------------------------------------- */
 static const unsigned int i2c1_a_pins[] = {
 	/* SDA, SCL */
@@ -3169,6 +3191,9 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(hscif0_data),
+	SH_PFC_PIN_GROUP(hscif0_clk),
+	SH_PFC_PIN_GROUP(hscif0_ctrl),
 	SH_PFC_PIN_GROUP(i2c1_a),
 	SH_PFC_PIN_GROUP(i2c1_b),
 	SH_PFC_PIN_GROUP(i2c2_a),
@@ -3379,6 +3404,12 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
+static const char * const hscif0_groups[] = {
+	"hscif0_data",
+	"hscif0_clk",
+	"hscif0_ctrl",
+};
+
 static const char * const i2c1_groups[] = {
 	"i2c1_a",
 	"i2c1_b",
@@ -3651,6 +3682,7 @@ static const char * const usb30_groups[] = {
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(du),
+	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
 	SH_PFC_FUNCTION(i2c6),
-- 
2.18.0
