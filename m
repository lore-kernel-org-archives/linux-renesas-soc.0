Return-Path: <SRS0=nIvG=PX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8978C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:01:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A696620657
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 15 Jan 2019 12:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJe/IF89"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728328AbfAOMBj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 15 Jan 2019 07:01:39 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:41730 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728151AbfAOMBj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Jan 2019 07:01:39 -0500
Received: by mail-pg1-f194.google.com with SMTP id m1so1165575pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Jan 2019 04:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yTOEQminwl16Q7lTtKzw7rtv7bjHkSFStgf/QGCsgYI=;
        b=fJe/IF89oDvtRayQjRD8QDlIO17oPwwTn5fdoqxqsDMJ9uMKptzyLkPMi6pent9o0C
         HKOwNzfjWktmsQtBH4R/gJLg80jD05AOD7x8hwnuSrMKkbgku0PrcSUY/8BgqAZilvNv
         qX5Au94wAkOeuojpVclzZPbo2g/HzFhx9K0KfswzHeImsNJDqTcxJCwjTmej+Yjg6sli
         ORs5IEbCwxgvpA+tXaL5fhVxTQRmxKvIvOoQDBoE9gNbZShRu8TFbgSq94xe1WqqjmQ3
         3DqQAnWENbzywaNCXxADYw99qBj5l7BM1IELCiCfUODZ04u6OazIP5vB6LwF+X+6Kmlj
         WcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yTOEQminwl16Q7lTtKzw7rtv7bjHkSFStgf/QGCsgYI=;
        b=fK8kAWqIoN8h3k5KdJ1ob261Qj78xgfXVvb1LdoYrE7cnDRcSDNh/bTBItuP9ZB6+Z
         SbaWeIbeT7oNyGBmwpWD8MAtZwVhj2R1iTh14Kx/aRr6OxyLcV0MiyONW4WdseER/dpI
         ayn/WvF7A0l/j6EIyCMgqhOO6uQFKVWPTmRCVbUe+DUQYC25xFupk6LWInSzlvbTnIH5
         mbUJAFHXpx6mvKQzri1kQht2dddMXblFbauFBzeGMmbzDf9kWL8wQ9ehVdbrVt0oD0tl
         NFg1xgpoQZPvAx3Xjdqe5xNr1teCbPOPGoqiTvzcGLQzH6LV9FD9KzfWJYh4e9iSaWb8
         gRog==
X-Gm-Message-State: AJcUukeYbS9IkYfoU/WnHGl7Z1DA67dsgztox9Q3RwvbA4AD0Fh1CaBI
        lv81psQaC7ssMgsMP1QzQPP1RzqG
X-Google-Smtp-Source: ALg8bN5FgJXsODDKDrVoYd4qhsxjNolQ/ZXImAxzKoOlCvA9wVlNU8QAATUzsGwTmovFsmP1aKicGA==
X-Received: by 2002:a63:e711:: with SMTP id b17mr3430511pgi.363.1547553697619;
        Tue, 15 Jan 2019 04:01:37 -0800 (PST)
Received: from localhost.localdomain (p7732116-ipngn36501marunouchi.tokyo.ocn.ne.jp. [114.158.79.116])
        by smtp.gmail.com with ESMTPSA id l19sm6089872pfi.71.2019.01.15.04.01.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 04:01:36 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add TMU pins, groups and functions
Date:   Tue, 15 Jan 2019 21:01:27 +0900
Message-Id: <1547553687-4407-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds TMU TCLK{1,2} pins, groups and functions to
the R8A77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the sh-pfc branch of Geert Uytterhoeven's
renesas-drivers tree.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 53 +++++++++++++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 5fc50f4..e69a7ef 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -3436,6 +3436,43 @@ enum {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
 };
 
+/* - TMU -------------------------------------------------------------------- */
+static const unsigned int tmu_tclk1_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(3, 12),
+};
+
+static const unsigned int tmu_tclk1_a_mux[] = {
+	TCLK1_A_MARK,
+};
+
+static const unsigned int tmu_tclk1_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(5, 17),
+};
+
+static const unsigned int tmu_tclk1_b_mux[] = {
+	TCLK1_B_MARK,
+};
+
+static const unsigned int tmu_tclk2_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(3, 13),
+};
+
+static const unsigned int tmu_tclk2_a_mux[] = {
+	TCLK2_A_MARK,
+};
+
+static const unsigned int tmu_tclk2_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(5, 18),
+};
+
+static const unsigned int tmu_tclk2_b_mux[] = {
+	TCLK2_B_MARK,
+};
+
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_a_pins[] = {
 	/* PWEN, OVC */
@@ -3716,7 +3753,7 @@ enum {
 };
 
 static const struct {
-	struct sh_pfc_pin_group common[262];
+	struct sh_pfc_pin_group common[266];
 	struct sh_pfc_pin_group automotive[2];
 } pinmux_groups = {
 	.common = {
@@ -3949,6 +3986,10 @@ enum {
 		SH_PFC_PIN_GROUP(ssi9_data),
 		SH_PFC_PIN_GROUP(ssi9_ctrl_a),
 		SH_PFC_PIN_GROUP(ssi9_ctrl_b),
+		SH_PFC_PIN_GROUP(tmu_tclk1_a),
+		SH_PFC_PIN_GROUP(tmu_tclk1_b),
+		SH_PFC_PIN_GROUP(tmu_tclk2_a),
+		SH_PFC_PIN_GROUP(tmu_tclk2_b),
 		SH_PFC_PIN_GROUP(usb0_a),
 		SH_PFC_PIN_GROUP(usb0_b),
 		SH_PFC_PIN_GROUP(usb0_id),
@@ -4358,6 +4399,13 @@ enum {
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
 	"usb0_a",
 	"usb0_b",
@@ -4404,7 +4452,7 @@ enum {
 };
 
 static const struct {
-	struct sh_pfc_function common[48];
+	struct sh_pfc_function common[49];
 	struct sh_pfc_function automotive[2];
 } pinmux_functions = {
 	.common = {
@@ -4452,6 +4500,7 @@ enum {
 		SH_PFC_FUNCTION(sdhi1),
 		SH_PFC_FUNCTION(sdhi3),
 		SH_PFC_FUNCTION(ssi),
+		SH_PFC_FUNCTION(tmu),
 		SH_PFC_FUNCTION(usb0),
 		SH_PFC_FUNCTION(usb30),
 		SH_PFC_FUNCTION(vin4),
-- 
1.9.1

