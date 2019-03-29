Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB436C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8BBBB218A2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 15:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:50750 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729625AbfC2P3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 11:29:47 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id trVk1z0083XaVaC01rVks9; Fri, 29 Mar 2019 16:29:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003Ri-3Q; Fri, 29 Mar 2019 16:29:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h9tRw-0003ee-1q; Fri, 29 Mar 2019 16:29:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/8] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit16 when using NFALE and NFRB_N
Date:   Fri, 29 Mar 2019 16:29:35 +0100
Message-Id: <20190329152942.13995-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190329152942.13995-1-geert+renesas@glider.be>
References: <20190329152942.13995-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of Aug
24, 2018, the MOD_SEL0 bit16 must be set to 0 when the NFALE_A and
NFRB_N_A pin functions are selected.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index ebf4d5e4d336f88b..2328fd25fa4f6cb0 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1038,7 +1038,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP10_23_20,		NFCLE),
 
 	PINMUX_IPSR_GPSR(IP10_27_24,		SD0_CD),
-	PINMUX_IPSR_GPSR(IP10_27_24,		NFALE_A),
+	PINMUX_IPSR_MSEL(IP10_27_24,		NFALE_A,	SEL_NDFC_0),
 	PINMUX_IPSR_GPSR(IP10_27_24,		SD3_CD),
 	PINMUX_IPSR_MSEL(IP10_27_24,		RIF0_CLK_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_27_24,		SCL2_B,		SEL_I2C2_1),
@@ -1047,7 +1047,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP10_27_24,		TS_SCK0),
 
 	PINMUX_IPSR_GPSR(IP10_31_28,		SD0_WP),
-	PINMUX_IPSR_GPSR(IP10_31_28,		NFRB_N_A),
+	PINMUX_IPSR_MSEL(IP10_31_28,		NFRB_N_A,	SEL_NDFC_0),
 	PINMUX_IPSR_GPSR(IP10_31_28,		SD3_WP),
 	PINMUX_IPSR_MSEL(IP10_31_28,		RIF0_D0_B,	SEL_DRIF0_1),
 	PINMUX_IPSR_MSEL(IP10_31_28,		SDA2_B,		SEL_I2C2_1),
-- 
2.17.1

