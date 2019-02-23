Return-Path: <SRS0=cYIn=Q6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A73C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 22:40:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 16C8A20855
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 23 Feb 2019 22:40:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgCygwME"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfBWWkC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 23 Feb 2019 17:40:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54419 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbfBWWkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 Feb 2019 17:40:02 -0500
Received: by mail-wm1-f68.google.com with SMTP id a62so4917830wmh.4;
        Sat, 23 Feb 2019 14:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RZ4jrh0fHlh6vsStImXAEqNu49Edf9WqeiTDjBDjSbM=;
        b=lgCygwMEVnit4B9xtPrn7jP4gncLWj3T1BEET1fXxuck8svwgWnh57HB5Z1IK88MVJ
         nppQtYIMOBWFGn/lIDxnLbmR9GvidqMDwKSMuvHSp/UC1eMkGsrTlFYnCEjPrBi4s3TP
         kn7OQe78Qncl82cMTxd6YdcIGasdm5Rd556JThm9xGZ4V6aJp1DRfZmlw9s8ZGE+2bLK
         SNVvKnR4YBOSVxLIOSs5yPP91R9Ws8CiBQy/Dg9v/Q3mTZIek45ahBty9opU/cakaKDJ
         WkTyWiWYBruHvHI1/VyCZA9VilQQNya+2byg/10T/Olrb42GwjRIXjgIpUvaPPVBQIZY
         IfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RZ4jrh0fHlh6vsStImXAEqNu49Edf9WqeiTDjBDjSbM=;
        b=JJM3dLZ+GettSpv0m8RT2XehQFL38HEbudVE3sjXl+ekEM7gmu9sw7Ok8/qccpaf79
         aUgZG3Vx38SqH4K52eqmbCCmuBGb+QDKWdTZ4zYD+fcUvW9+iWi3MqBXl8FOkNa8sZvm
         gndyMOdIj3wMoUCXKuBFrPTxQKBtTzvlwBCExZAIwYTifT5H1j6AmOvlJ5YJjJkw9o6k
         E4Ri8AnE0G8whzaUE9CiHftxEYC6wTp4f2l282V59q5Y0GYisuY5ZfMipj4yhJBdskqi
         jfv3t/y6F8yUHmelBCc4u7otQO9EOSIgGa+FPtWn/sSAf1hvVvgJlaO8+6JuYVRLx4Dh
         IuEQ==
X-Gm-Message-State: AHQUAuZJG3wMv9YCXU3eSCCVILgc5ooy4DgJoIZgDV6+jXHHVH4W5jfV
        qDmN8vfVKL6XYTMG7jTrvqTa2oOE
X-Google-Smtp-Source: AHgI3IYCx3iTNIhH3MeuJ0WT6YyzBFUwKJKOBMm7PU40nOQ0ZJfhynkKXYoGqamrtxIwGKFzxrucDw==
X-Received: by 2002:a1c:2dd1:: with SMTP id t200mr6211480wmt.148.1550961598765;
        Sat, 23 Feb 2019 14:39:58 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id g10sm9608264wrq.61.2019.02.23.14.39.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Feb 2019 14:39:57 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-gpio@vger.kernel.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH V3] pinctrl: sh-pfc: Retain TDSELCTRL register across suspend/resume
Date:   Sat, 23 Feb 2019 23:39:55 +0100
Message-Id: <20190223223955.27823-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

The TDSELCTRL register is responsible for configuring the SDHI/MMC clock
return path delay and may be adjusted by the bootloader. Retain the value
across suspend/resume to prevent hardware instability after resume.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-gpio@vger.kernel.org
---
V2: Add D3 TDSELCTRL register
V3: Wrap tdsel register into ioctrl regs
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c    |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a77970.c    |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a77980.c    |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c    |  2 ++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c    | 10 ++++++++++
 8 files changed, 24 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
index 287cfbb7e992..0ef7ada08316 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
@@ -5547,10 +5547,12 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index db9add1405c5..1a987dfea46f 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -5897,10 +5897,12 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
index 72348a4f2ece..ef35f3add3a8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
@@ -5855,10 +5855,12 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
index 14c4b671cddf..820b74ca9d10 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77965.c
@@ -6012,10 +6012,12 @@ static const struct pinmux_drive_reg pinmux_drive_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index e2d1b49aaee6..f5868f5e4018 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -2409,12 +2409,14 @@ enum ioctrl_regs {
 	POCCTRL0,
 	POCCTRL1,
 	POCCTRL2,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL0] = { 0xe6060380 },
 	[POCCTRL1] = { 0xe6060384 },
 	[POCCTRL2] = { 0xe6060388 },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
index 1dcc508366b8..376e689c7378 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77980.c
@@ -2832,6 +2832,7 @@ enum ioctrl_regs {
 	POCCTRL1,
 	POCCTRL2,
 	POCCTRL3,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
@@ -2839,6 +2840,7 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL1] = { 0xe6060384, },
 	[POCCTRL2] = { 0xe6060388, },
 	[POCCTRL3] = { 0xe606038c, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 982b215fa072..a25594269250 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -4996,10 +4996,12 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 
 enum ioctrl_regs {
 	POCCTRL0,
+	TDSELCTRL,
 };
 
 static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
 	[POCCTRL0] = { 0xe6060380, },
+	[TDSELCTRL] = { 0xe60603c0, },
 	{ /* sentinel */ },
 };
 
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
index 9e377e3b9cb3..0acdfb8bf077 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77995.c
@@ -2833,6 +2833,15 @@ static int r8a77995_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *po
 	return bit;
 }
 
+enum ioctrl_regs {
+	TDSELCTRL,
+};
+
+static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
+	[TDSELCTRL] = { 0xe60603c0, },
+	{ /* sentinel */ },
+};
+
 static const struct sh_pfc_soc_operations r8a77995_pinmux_ops = {
 	.pin_to_pocctrl = r8a77995_pin_to_pocctrl,
 };
@@ -2852,6 +2861,7 @@ const struct sh_pfc_soc_info r8a77995_pinmux_info = {
 	.nr_functions = ARRAY_SIZE(pinmux_functions),
 
 	.cfg_regs = pinmux_config_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
-- 
2.19.2

