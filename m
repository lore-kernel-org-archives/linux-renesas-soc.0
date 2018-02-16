Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:37403 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034273AbeBPOZs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:25:48 -0500
Received: by mail-wm0-f66.google.com with SMTP id v71so3461851wmv.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:25:48 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 1/3] pinctrl: sh-pfc: r8a7795: Add HDMI pins, groups and functions
Date: Fri, 16 Feb 2018 15:25:40 +0100
Message-Id: <1518791142-14054-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518791142-14054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791142-14054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds HDMI0 CEC pin, group and function to the R8A7795 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: fixed typo in comment]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 18aeee5..7e7bf86 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2128,6 +2128,22 @@ static const unsigned int du_disp_mux[] = {
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
+	/* HDMI1_CEC */
+	RCAR_GP_PIN(7, 3),
+};
+static const unsigned int hdmi1_cec_mux[] = {
+	HDMI1_CEC_MARK,
+};
+
 /* - HSCIF0 ----------------------------------------------------------------- */
 static const unsigned int hscif0_data_pins[] = {
 	/* RX, TX */
@@ -3955,6 +3971,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(hdmi0_cec),
+	SH_PFC_PIN_GROUP(hdmi1_cec),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -4305,6 +4323,14 @@ static const char * const du_groups[] = {
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
 static const char * const hscif0_groups[] = {
 	"hscif0_data",
 	"hscif0_clk",
@@ -4672,6 +4698,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(drif2),
 	SH_PFC_FUNCTION(drif3),
 	SH_PFC_FUNCTION(du),
+	SH_PFC_FUNCTION(hdmi0),
+	SH_PFC_FUNCTION(hdmi1),
 	SH_PFC_FUNCTION(hscif0),
 	SH_PFC_FUNCTION(hscif1),
 	SH_PFC_FUNCTION(hscif2),
-- 
2.7.4
