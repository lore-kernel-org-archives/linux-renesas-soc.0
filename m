Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ABCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:13:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB110206B6
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730542AbfAKMNo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:13:44 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:46246 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731454AbfAKMNo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:13:44 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id P0Di1z0073XaVaC010Di9G; Fri, 11 Jan 2019 13:13:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvh0-0005v4-5m; Fri, 11 Jan 2019 13:13:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ghvh0-00089x-4G; Fri, 11 Jan 2019 13:13:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a77990: Fix MOD_SEL0 bit3 when using TX0
Date:   Fri, 11 Jan 2019 13:13:40 +0100
Message-Id: <20190111121340.31321-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
Aug 24, 2018, the MOD_SEL0 bit3 is set to 0 when TX0_A pin function is
selected, and the MOD_SEL0 bit3 is set to 1 when TX0_B pin function is
selected.

Fixes: 6d4036a1e3b3ac0f ("pinctrl: sh-pfc: Initial R8A77990 PFC support")
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.1.

 drivers/pinctrl/sh-pfc/pfc-r8a77990.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
index db8e1f1e91551b93..3ce1b24a9d6e95f2 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
@@ -1073,7 +1073,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_GPSR(IP11_11_8,		RIF1_SYNC),
 	PINMUX_IPSR_GPSR(IP11_11_8,		TS_SCK1),
 
-	PINMUX_IPSR_GPSR(IP11_15_12,		TX0_A),
+	PINMUX_IPSR_MSEL(IP11_15_12,		TX0_A,		SEL_SCIF0_0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		HTX1_A),
 	PINMUX_IPSR_MSEL(IP11_15_12,		SSI_WS2_A,	SEL_SSI2_0),
 	PINMUX_IPSR_GPSR(IP11_15_12,		RIF1_D0),
@@ -1183,7 +1183,7 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP13_19_16,		SIM0_D_A,	SEL_SIMCARD_0),
 
 	PINMUX_IPSR_GPSR(IP13_23_20,		MLB_DAT),
-	PINMUX_IPSR_GPSR(IP13_23_20,		TX0_B),
+	PINMUX_IPSR_MSEL(IP13_23_20,		TX0_B,		SEL_SCIF0_1),
 	PINMUX_IPSR_MSEL(IP13_23_20,		RIF0_SYNC_A,	SEL_DRIF0_0),
 	PINMUX_IPSR_GPSR(IP13_23_20,		SIM0_CLK_A),
 
-- 
2.17.1

