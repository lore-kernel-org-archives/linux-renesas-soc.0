Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE82DC67874
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D57E20811
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 18:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D57E20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbeLMS10 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 13:27:26 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:47312 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728417AbeLMS1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 13:27:20 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id BWTG1z00D3XaVaC06WTGnT; Thu, 13 Dec 2018 19:27:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0007f5-Lu; Thu, 13 Dec 2018 19:27:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXVhc-0006o4-Kj; Thu, 13 Dec 2018 19:27:16 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/15] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 SEL_I2C1 field width
Date:   Thu, 13 Dec 2018 19:27:04 +0100
Message-Id: <20181213182714.26094-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213182714.26094-1-geert+renesas@glider.be>
References: <20181213182714.26094-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The SEL_I2C1 (MOD_SEL0[21:20]) field in Module Select Register 0 has a
width of 2 bits, i.e. it allows programming one out of 4 different
configurations.
However, the MOD_SEL0_21_20 macro contains 8 values instead of 4,
overflowing into the subsequent fields in the register, and thus breaking
the configuration of the latter.

Fix this by dropping the bogus last 4 values, including the non-existent
SEL_I2C1_4 configuration.

Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index d5b7a83e8b614370..e40908dc37e06264 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -399,7 +399,7 @@ FM(IP12_31_28)	IP12_31_28	FM(IP13_31_28)	IP13_31_28	FM(IP14_31_28)	IP14_31_28	FM
 #define MOD_SEL0_24		FM(SEL_HSCIF0_0)		FM(SEL_HSCIF0_1)
 #define MOD_SEL0_23		FM(SEL_HSCIF1_0)		FM(SEL_HSCIF1_1)
 #define MOD_SEL0_22		FM(SEL_HSCIF2_0)		FM(SEL_HSCIF2_1)
-#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_1)			FM(SEL_I2C1_2)			FM(SEL_I2C1_3)		FM(SEL_I2C1_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
+#define MOD_SEL0_21_20		FM(SEL_I2C1_0)			FM(SEL_I2C1_1)			FM(SEL_I2C1_2)			FM(SEL_I2C1_3)
 #define MOD_SEL0_19_18_17	FM(SEL_I2C2_0)			FM(SEL_I2C2_1)			FM(SEL_I2C2_2)			FM(SEL_I2C2_3)		FM(SEL_I2C2_4)		F_(0, 0)	F_(0, 0)	F_(0, 0)
 #define MOD_SEL0_16		FM(SEL_NDFC_0)			FM(SEL_NDFC_1)
 #define MOD_SEL0_15		FM(SEL_PWM0_0)			FM(SEL_PWM0_1)
-- 
2.17.1

