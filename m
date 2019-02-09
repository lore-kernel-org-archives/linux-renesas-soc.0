Return-Path: <SRS0=bfNf=QQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D21EC282C4
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 11:02:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5495C21773
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 11:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/Jfwlr1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbfBILCX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Feb 2019 06:02:23 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:36571 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfBILCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Feb 2019 06:02:23 -0500
Received: by mail-pl1-f196.google.com with SMTP id g9so2945353plo.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Feb 2019 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=fONwpOUvy0j6a1G3YMzk7iMGROpkjeZk+cdXewpChKc=;
        b=Z/Jfwlr1iZ9x3T4rCrB72Y8a2ojYsX31tGgUB+/biWx5QGVjkIjU68lAyUcmgqMb8f
         yffHYmS+YkVCbzQFj5HiT780SQ6DzB2crjUN/UrY6+kRUvNWwOhoJoW4Qur8NYeyDMyT
         Yycj3RgrQHzHTDVd2U2U1zaWzc3xpLFn/N/xnW6t+JrlQvSoFEo73uOWuYNKUe/nLwzj
         r4YEb443sUGUT3awOma7CtCrmO1kipJ2Cqk7sAo9CkSbW1we9XOjgVd9QmbX5iSHQSVs
         OH4zaqrkRAgNf1ElK4OokJt/mr2sqe8haAZ09AxJOxGeAkxkEipGsZKZQVHUw1QPkAia
         +J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fONwpOUvy0j6a1G3YMzk7iMGROpkjeZk+cdXewpChKc=;
        b=qRV7f89SCWKlogtT6f/1SucIlH4mLgZL/Pc5rDNSvCyOkwi3noZxvd8KKj+d7+n5PX
         X9KJTJlN4fgG4VqhsVf4SWpZmoExhG2fhTLEBQg2h/N2DE9ZZAkNHf2nGwtq9OUOxpN2
         IAP/ZG3zybpG2qe0h2W4ABpbdZeNKqsCa1mPwB1eQlFIB+CLCQw8p2KcRdXbIogtUNhE
         QjAfF36RhpVYJow05zOLbaMFrOYP35yHgF8/QrPhwiAsBA3FP26k3vXIVMndrJdmP/kE
         9GjOaJ99noc5FJAThycozUpOzPzcgpSGo7HRC8wMt9v3GrkdmmzYr00ZCt1SjKFPb06t
         y1RQ==
X-Gm-Message-State: AHQUAuZEcj3q6QTbuqPo10XJowDQXTEZG6y8fWOeU79ndY5o94DSx6jB
        P4WnBUszX09qSuwd/ESpEdshRHNw
X-Google-Smtp-Source: AHgI3IaBQcNow/i3cFK1vKYfNdhTjfr0gsFhw4fVvmVzZeB3QMQdFyieybscRT5LgrwHtOjeM+y+0w==
X-Received: by 2002:a17:902:8643:: with SMTP id y3mr15309936plt.80.1549710142470;
        Sat, 09 Feb 2019 03:02:22 -0800 (PST)
Received: from localhost.localdomain (p6779223-ipngn28001marunouchi.tokyo.ocn.ne.jp. [114.162.71.223])
        by smtp.gmail.com with ESMTPSA id j21sm7464377pfn.175.2019.02.09.03.02.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 03:02:21 -0800 (PST)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH/RFT] pinctrl: sh-pfc: r8a77965: Add TMU pins, groups and functions
Date:   Sat,  9 Feb 2019 20:01:52 +0900
Message-Id: <1549710112-19714-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds TMU TCLK{1,2} pins, groups and functions to
the R8A77965 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

This patch is based on the sh-pfc branch of Geert Uytterhoeven's
renesas-drivers tree.

 drivers/pinctrl/sh-pfc/pfc-r8a77965.c | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index d937b1b..7899ffd 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -3760,6 +3760,42 @@ enum {
 	SSI_SCK9_B_MARK, SSI_WS9_B_MARK,
 };
 
+/* - TMU -------------------------------------------------------------------- */
+static const unsigned int tmu_tclk1_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 23),
+};
+
+static const unsigned int tmu_tclk1_a_mux[] = {
+	TCLK1_A_MARK,
+};
+
+static const unsigned int tmu_tclk1_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(5, 19),
+};
+
+static const unsigned int tmu_tclk1_b_mux[] = {
+	TCLK1_B_MARK,
+};
+
+static const unsigned int tmu_tclk2_a_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 19),
+};
+
+static const unsigned int tmu_tclk2_a_mux[] = {
+	TCLK2_A_MARK,
+};
+
+static const unsigned int tmu_tclk2_b_pins[] = {
+	/* TCLK */
+	RCAR_GP_PIN(6, 28),
+};
+
+static const unsigned int tmu_tclk2_b_mux[] = {
+	TCLK2_B_MARK,
+};
 
 /* - USB0 ------------------------------------------------------------------- */
 static const unsigned int usb0_pins[] = {
@@ -4280,6 +4316,10 @@ enum {
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
@@ -4711,6 +4751,13 @@ enum {
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
@@ -4797,6 +4844,7 @@ enum {
 	SH_PFC_FUNCTION(sdhi2),
 	SH_PFC_FUNCTION(sdhi3),
 	SH_PFC_FUNCTION(ssi),
+	SH_PFC_FUNCTION(tmu),
 	SH_PFC_FUNCTION(usb0),
 	SH_PFC_FUNCTION(usb1),
 	SH_PFC_FUNCTION(usb30),
-- 
1.9.1

