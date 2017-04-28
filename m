Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:33623 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756326AbdD1Ryd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 13:54:33 -0400
Received: by mail-lf0-f47.google.com with SMTP id 88so37904796lfr.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Apr 2017 10:54:32 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170428175428.588162131@cogentembedded.com>
Date: Fri, 28 Apr 2017 20:50:28 +0300
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7794: remove AVB_AVTP_* groups
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=pinctrl-sh-pfc-r8a7794-remove-AVB_AVTP_-groups.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ATA_AVTP_* signals are documented as reserved in the recent R-Car E2
user's manual (the only remaining mention is in the table 5.2 and I believe
it's a simple overlook).  Remove the AVB_AVTP_* pinmux groups -- we will
remove the signals themselves in the next patch, along with the other now
reserved bits...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |   32 --------------------------------
 1 file changed, 32 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -1660,30 +1660,6 @@ static const unsigned int avb_gmii_mux[]
 	AVB_TX_EN_MARK, AVB_TX_ER_MARK, AVB_TX_CLK_MARK,
 	AVB_COL_MARK,
 };
-static const unsigned int avb_avtp_capture_pins[] = {
-	RCAR_GP_PIN(5, 11),
-};
-static const unsigned int avb_avtp_capture_mux[] = {
-	AVB_AVTP_CAPTURE_MARK,
-};
-static const unsigned int avb_avtp_match_pins[] = {
-	RCAR_GP_PIN(5, 12),
-};
-static const unsigned int avb_avtp_match_mux[] = {
-	AVB_AVTP_MATCH_MARK,
-};
-static const unsigned int avb_avtp_capture_b_pins[] = {
-	RCAR_GP_PIN(1, 1),
-};
-static const unsigned int avb_avtp_capture_b_mux[] = {
-	AVB_AVTP_CAPTURE_B_MARK,
-};
-static const unsigned int avb_avtp_match_b_pins[] = {
-	RCAR_GP_PIN(1, 2),
-};
-static const unsigned int avb_avtp_match_b_mux[] = {
-	AVB_AVTP_MATCH_B_MARK,
-};
 /* - DU --------------------------------------------------------------------- */
 static const unsigned int du0_rgb666_pins[] = {
 	/* R[7:2], G[7:2], B[7:2] */
@@ -3535,10 +3511,6 @@ static const struct sh_pfc_pin_group pin
 	SH_PFC_PIN_GROUP(avb_mdio),
 	SH_PFC_PIN_GROUP(avb_mii),
 	SH_PFC_PIN_GROUP(avb_gmii),
-	SH_PFC_PIN_GROUP(avb_avtp_capture),
-	SH_PFC_PIN_GROUP(avb_avtp_match),
-	SH_PFC_PIN_GROUP(avb_avtp_capture_b),
-	SH_PFC_PIN_GROUP(avb_avtp_match_b),
 	SH_PFC_PIN_GROUP(du0_rgb666),
 	SH_PFC_PIN_GROUP(du0_rgb888),
 	SH_PFC_PIN_GROUP(du0_clk0_out),
@@ -3809,10 +3781,6 @@ static const char * const avb_groups[] =
 	"avb_mdio",
 	"avb_mii",
 	"avb_gmii",
-	"avb_avtp_capture",
-	"avb_avtp_match",
-	"avb_avtp_capture_b",
-	"avb_avtp_match_b",
 };
 
 static const char * const du0_groups[] = {
