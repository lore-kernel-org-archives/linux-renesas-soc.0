Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B3DC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6CB9C20675
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 15:37:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404985AbfAPPhz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 10:37:55 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:52672 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404992AbfAPPhy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 10:37:54 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id R3ds1z00n3XaVaC013dt4D; Wed, 16 Jan 2019 16:37:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjnGK-0007jf-SI; Wed, 16 Jan 2019 16:37:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gjl6K-0001iI-HI; Wed, 16 Jan 2019 14:19:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names
Date:   Wed, 16 Jan 2019 14:19:23 +0100
Message-Id: <20190116131923.6544-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When declaring the HSPI RX1_B and TX1_B pins, two mistakes were made:
  - the rows and columns in the BGA pin matrix, from which the pin
    numbers are derived, were exchanged,
  - it was not taken into account that BGA pin row labelling skips
    characters I, O, Q, and S.

Fix the order, and the corresponding pin names.

Notes:
  - The actual values of the pin numbers don't really matter (they just
    have to be unique), so the wrong order didn't have any impact,
  - Changing the names of the pins is user-visible, but there are no
    users in (upstream) DTS files.

Fixes: 4f82e3ee724f1712 ("sh-pfc: Support pins not associated with a GPIO port")
Fixes: 09cc76a95802e87d ("sh-pfc: r8a7778: add HSPI pin groups")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.1.

 drivers/pinctrl/sh-pfc/pfc-r8a7778.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
index 6bcdb4b5e69e7ff1..068b5e6334d148d4 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7778.c
@@ -1264,8 +1264,8 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 
 	/* Pins not associated with a GPIO port */
 	SH_PFC_PIN_NAMED(3, 20, C20),
-	SH_PFC_PIN_NAMED(20, 1, T1),
-	SH_PFC_PIN_NAMED(25, 2, Y2),
+	SH_PFC_PIN_NAMED(1, 20, A20),
+	SH_PFC_PIN_NAMED(2, 25, B25),
 };
 
 /* - macro */
@@ -1400,7 +1400,7 @@ HSPI_PFC_DAT(hspi1_a,	HSPI_CLK1_A,		HSPI_CS1_A,
 			HSPI_RX1_A,		HSPI_TX1_A);
 
 HSPI_PFC_PIN(hspi1_b,	RCAR_GP_PIN(0, 27),	RCAR_GP_PIN(0, 26),
-			PIN_NUMBER(20, 1),	PIN_NUMBER(25, 2));
+			PIN_NUMBER(1, 20),	PIN_NUMBER(2, 25));
 HSPI_PFC_DAT(hspi1_b,	HSPI_CLK1_B,		HSPI_CS1_B,
 			HSPI_RX1_B,		HSPI_TX1_B);
 
-- 
2.17.1

