Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35129 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034273AbeBPOZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:25:50 -0500
Received: by mail-wm0-f67.google.com with SMTP id x21so3455512wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:25:49 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 2/3] pinctrl: sh-pfc: r8a7795-es1: Add HDMI pins, groups and functions
Date: Fri, 16 Feb 2018 15:25:41 +0100
Message-Id: <1518791142-14054-3-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1518791142-14054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1518791142-14054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds HDMI0 CEC pin, group and function to
the R8A7795 ES1.x SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[uli: fixed typo in comment]
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 292e35d..81bfcaf 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -1,7 +1,7 @@
 /*
  * R8A7795 ES1.x processor support - PFC hardware block.
  *
- * Copyright (C) 2015  Renesas Electronics Corporation
+ * Copyright (C) 2015-2017  Renesas Electronics Corporation
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -2067,6 +2067,22 @@ static const unsigned int du_disp_pins[] = {
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
@@ -3865,6 +3881,8 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_oddf),
 	SH_PFC_PIN_GROUP(du_cde),
 	SH_PFC_PIN_GROUP(du_disp),
+	SH_PFC_PIN_GROUP(hdmi0_cec),
+	SH_PFC_PIN_GROUP(hdmi1_cec),
 	SH_PFC_PIN_GROUP(hscif0_data),
 	SH_PFC_PIN_GROUP(hscif0_clk),
 	SH_PFC_PIN_GROUP(hscif0_ctrl),
@@ -4210,6 +4228,14 @@ static const char * const du_groups[] = {
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
@@ -4578,6 +4604,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
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
