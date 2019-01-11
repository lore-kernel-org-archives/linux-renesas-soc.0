Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792C3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:12:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51FFF206B6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbfAKMM1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:12:27 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:40548 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730542AbfAKMM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:12:27 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id P0CS1z0073XaVaC060CS9Q; Fri, 11 Jan 2019 13:12:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvfm-0005te-69; Fri, 11 Jan 2019 13:12:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvfm-00084w-3r; Fri, 11 Jan 2019 13:12:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit2 when using RX2, TX2 and SCK2
Date:   Fri, 11 Jan 2019 13:12:24 +0100
Message-Id: <20190111121224.31007-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
Aug 24, 2018, the MOD_SEL0 bit2 is set when RX2_{A,B}, TX2_{A,B} and
SCK2_A pin functions are selected.

Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.1.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index 967b3fec45f516d1..db8e1f1e91551b93 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1112,7 +1112,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP12_3_0,		SSI_WS9_B,	SEL_SSI9_1),
 	PINMUX_IPSR_GPSR(IP12_3_0,		AUDIO_CLKOUT3_B),
 
-	PINMUX_IPSR_GPSR(IP12_7_4,		SCK2_A),
+	PINMUX_IPSR_MSEL(IP12_7_4,		SCK2_A,		SEL_SCIF2_0),
 	PINMUX_IPSR_MSEL(IP12_7_4,		HSCK0_A,	SEL_HSCIF0_0),
 	PINMUX_IPSR_MSEL(IP12_7_4,		AUDIO_CLKB_A,	SEL_ADGB_0),
 	PINMUX_IPSR_GPSR(IP12_7_4,		CTS1_N),
@@ -1120,14 +1120,14 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP12_7_4,		REMOCON_A,	SEL_REMOCON_0),
 	PINMUX_IPSR_MSEL(IP12_7_4,		SCIF_CLK_B,	SEL_SCIF_1),
 
-	PINMUX_IPSR_GPSR(IP12_11_8,		TX2_A),
+	PINMUX_IPSR_MSEL(IP12_11_8,		TX2_A,		SEL_SCIF2_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,		HRX0_A,		SEL_HSCIF0_0),
 	PINMUX_IPSR_GPSR(IP12_11_8,		AUDIO_CLKOUT2_A),
 	PINMUX_IPSR_MSEL(IP12_11_8,		SCL1_A,		SEL_I2C1_0),
 	PINMUX_IPSR_MSEL(IP12_11_8,		FSO_CFE_0_N_A,	SEL_FSO_0),
 	PINMUX_IPSR_GPSR(IP12_11_8,		TS_SDEN1),
 
-	PINMUX_IPSR_GPSR(IP12_15_12,		RX2_A),
+	PINMUX_IPSR_MSEL(IP12_15_12,		RX2_A,		SEL_SCIF2_0),
 	PINMUX_IPSR_GPSR(IP12_15_12,		HTX0_A),
 	PINMUX_IPSR_GPSR(IP12_15_12,		AUDIO_CLKOUT3_A),
 	PINMUX_IPSR_MSEL(IP12_15_12,		SDA1_A,		SEL_I2C1_0),
@@ -1139,11 +1139,11 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP12_23_20,		MSIOF0_RXD),
 	PINMUX_IPSR_GPSR(IP12_23_20,		SSI_WS78),
-	PINMUX_IPSR_GPSR(IP12_23_20,		TX2_B),
+	PINMUX_IPSR_MSEL(IP12_23_20,		TX2_B,		SEL_SCIF2_1),
 
 	PINMUX_IPSR_GPSR(IP12_27_24,		MSIOF0_TXD),
 	PINMUX_IPSR_GPSR(IP12_27_24,		SSI_SDATA7),
-	PINMUX_IPSR_GPSR(IP12_27_24,		RX2_B),
+	PINMUX_IPSR_MSEL(IP12_27_24,		RX2_B,		SEL_SCIF2_1),
 
 	PINMUX_IPSR_GPSR(IP12_31_28,		MSIOF0_SYNC),
 	PINMUX_IPSR_GPSR(IP12_31_28,		AUDIO_CLKOUT_B),
-- 
2.17.1

