Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBEFCC67874
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A0E352087F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E352087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729596AbeLMQ3I (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:29:08 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:44594 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729601AbeLMQ3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 11:29:06 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id BUV21z00d3XaVaC01UV2N6; Thu, 13 Dec 2018 17:29:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0006KJ-QC; Thu, 13 Dec 2018 17:29:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0003ht-P6; Thu, 13 Dec 2018 17:29:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/6] pinctrl: sh-pfc: r8a7740: Add missing LCD0 marks to lcd0_data24_1 group
Date:   Thu, 13 Dec 2018 17:28:51 +0100
Message-Id: <20181213162855.14190-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213162855.14190-1-geert+renesas@glider.be>
References: <20181213162855.14190-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The lcd0_data24_1_pins[] array contains the LCD0 D1[2-5] pin numbers,
but the lcd0_data24_1_mux[] array lacks the corresponding pin marks.

Fixes: 06c7dd866da70f6c ("sh-pfc: r8a7740: Add LCDC0 and LCDC1 pin groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
index de3393e20c4a17d5..6d761e62c6c8a362 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7740.c
@@ -2141,6 +2141,7 @@ static const unsigned int lcd0_data24_1_mux[] = {
 	LCD0_D0_MARK, LCD0_D1_MARK, LCD0_D2_MARK, LCD0_D3_MARK,
 	LCD0_D4_MARK, LCD0_D5_MARK, LCD0_D6_MARK, LCD0_D7_MARK,
 	LCD0_D8_MARK, LCD0_D9_MARK, LCD0_D10_MARK, LCD0_D11_MARK,
+	LCD0_D12_MARK, LCD0_D13_MARK, LCD0_D14_MARK, LCD0_D15_MARK,
 	LCD0_D16_MARK, LCD0_D17_MARK, LCD0_D18_PORT163_MARK,
 	LCD0_D19_PORT162_MARK, LCD0_D20_PORT161_MARK, LCD0_D21_PORT158_MARK,
 	LCD0_D22_PORT160_MARK, LCD0_D23_PORT159_MARK,
-- 
2.17.1

