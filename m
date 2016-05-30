Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:36028 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QBJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:09 -0400
Received: by mail-lf0-f65.google.com with SMTP id h68so7204272lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:08 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 16/21] pinctrl: sh-pfc: r8a7795: Add HDMI CEC support
Date: Mon, 30 May 2016 18:00:15 +0200
Message-Id: <1464624020-27709-17-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Adds DU pinmux support to r8a7795 SoC.
Based on work by Takeshi Kihara.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 66cee18..515b88f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -1721,6 +1721,21 @@ static const unsigned int du_disp_pins[] = {
 static const unsigned int du_disp_mux[] = {
 	DU_DISP_MARK,
 };
+/* - HDMI ------------------------------------------------------------------- */
+static const unsigned int hdmi0_cec_pins[] = {
+	/* HDMI0_CEC */
+	RCAR_GP_PIN(7, 2),
+};
+static const unsigned int hdmi0_cec_mux[] = {
+	HDMI0_CEC_MARK,
+};
+static const unsigned int hdmi1_cec_pins[] = {
+	/* HDMI0_CEC */
+	RCAR_GP_PIN(7, 3),
+};
+static const unsigned int hdmi1_cec_mux[] = {
+	HDMI1_CEC_MARK,
+};
 
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
@@ -3421,6 +3436,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(hdmi0_cec),
+	SH_PFC_PIN_GROUP(hdmi1_cec),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -3660,6 +3677,14 @@ static const char * const du_groups[] = {
 	"du_disp",
 };
 
+static const char * const hdmi0_groups[] = {
+	"hdmi0_cec",
+};
+
+static const char * const hdmi1_groups[] = {
+	"hdmi1_cec",
+};
+
 static const char * const audio_clk_groups[] = {
 	"audio_clk_a_a",
 	"audio_clk_a_b",
@@ -4058,6 +4083,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(canfd0),
 	SH_PFC_FUNCTION(canfd1),
 	SH_PFC_FUNCTION(du),
+	SH_PFC_FUNCTION(hdmi0),
+	SH_PFC_FUNCTION(hdmi1),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
-- 
2.7.4
