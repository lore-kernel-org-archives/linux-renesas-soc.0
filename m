Return-Path: <SRS0=l30p=SD=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1096CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 11:29:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D79172084B
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  1 Apr 2019 11:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725882AbfDAL3m (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 1 Apr 2019 07:29:42 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:53342 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbfDAL3m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Apr 2019 07:29:42 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id uzVe1z00F3XaVaC01zVeVj; Mon, 01 Apr 2019 13:29:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAv8E-0003Zl-EU; Mon, 01 Apr 2019 13:29:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hAv8E-0006Bz-Cv; Mon, 01 Apr 2019 13:29:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77970: Fix spacing
Date:   Mon,  1 Apr 2019 13:29:37 +0200
Message-Id: <20190401112937.23762-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Replace "F_(0,0)" by "F_(0, 0)".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.2.

 drivers/pinctrl/sh-pfc/pfc-r8a77970.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
index 6aa8f321a4b648bd..2d76b548b9421378 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77970.c
@@ -199,12 +199,12 @@
 #define IP5_27_24	FM(VI1_DATA2)			FM(CANFD0_TX_B)		F_(0, 0)	FM(D5)		FM(MMC_D0)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP5_31_28	FM(VI1_DATA3)			FM(CANFD0_RX_B)		F_(0, 0)	FM(D6)		FM(MMC_D1)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_3_0		FM(VI1_DATA4)			FM(CANFD_CLK_B)		F_(0, 0)	FM(D7)		FM(MMC_D2)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_7_4		FM(VI1_DATA5)			F_(0,0)			FM(SCK4)	FM(D8)		FM(MMC_D3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_11_8	FM(VI1_DATA6)			F_(0,0)			FM(RX4)		FM(D9)		FM(MMC_CLK)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_15_12	FM(VI1_DATA7)			F_(0,0)			FM(TX4)		FM(D10)		FM(MMC_D4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_19_16	FM(VI1_DATA8)			F_(0,0)			FM(CTS4_N)	FM(D11)		FM(MMC_D5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_23_20	FM(VI1_DATA9)			F_(0,0)			FM(RTS4_N)	FM(D12)		FM(MMC_D6)		FM(SCL3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP6_27_24	FM(VI1_DATA10)			F_(0,0)			F_(0, 0)	FM(D13)		FM(MMC_D7)		FM(SDA3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_7_4		FM(VI1_DATA5)			F_(0, 0)		FM(SCK4)	FM(D8)		FM(MMC_D3)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_11_8	FM(VI1_DATA6)			F_(0, 0)		FM(RX4)		FM(D9)		FM(MMC_CLK)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_15_12	FM(VI1_DATA7)			F_(0, 0)		FM(TX4)		FM(D10)		FM(MMC_D4)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_19_16	FM(VI1_DATA8)			F_(0, 0)		FM(CTS4_N)	FM(D11)		FM(MMC_D5)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_23_20	FM(VI1_DATA9)			F_(0, 0)		FM(RTS4_N)	FM(D12)		FM(MMC_D6)		FM(SCL3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP6_27_24	FM(VI1_DATA10)			F_(0, 0)		F_(0, 0)	FM(D13)		FM(MMC_D7)		FM(SDA3_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP6_31_28	FM(VI1_DATA11)			FM(SCL4)		FM(IRQ4)	FM(D14)		FM(MMC_WP)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_3_0		FM(VI1_FIELD)			FM(SDA4)		FM(IRQ5)	FM(D15)		FM(MMC_CD)		F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_7_4		FM(SCL0)			FM(DU_DR0)		FM(TPU0TO0)	FM(CLKOUT)	F_(0, 0)		FM(MSIOF0_RXD)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-- 
2.17.1

