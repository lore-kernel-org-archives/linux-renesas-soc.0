Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E87C67872
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 808852087F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 808852087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729612AbeLMQ3F (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:29:05 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:47942 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729583AbeLMQ3E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 11:29:04 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id BUV31z0033XaVaC01UV3lP; Thu, 13 Dec 2018 17:29:03 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0006KT-UK; Thu, 13 Dec 2018 17:29:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0003i2-T6; Thu, 13 Dec 2018 17:29:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/6] pinctrl: sh-pfc: sh73a0: Add missing TO pin to tpu4_to3 group
Date:   Thu, 13 Dec 2018 17:28:54 +0100
Message-Id: <20181213162855.14190-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213162855.14190-1-geert+renesas@glider.be>
References: <20181213162855.14190-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The tpu4_to3_mux[] array contains the TPU4TO3 pin mark, but the
tpu4_to3_pins[] array lacks the corresponding pin number.

Add the missing pin number, for non-GPIO pin F26.

Fixes: 5da4eb049de803c7 ("sh-pfc: sh73a0: Add TPU pin groups and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-sh73a0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
index 654029fc8d96ffcc..085770e66895680a 100644
--- a/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
+++ b/drivers/pinctrl/sh-pfc/pfc-sh73a0.c
@@ -3073,6 +3073,7 @@ static const unsigned int tpu4_to2_mux[] = {
 };
 static const unsigned int tpu4_to3_pins[] = {
 	/* TO */
+	PIN_NUMBER(6, 26),
 };
 static const unsigned int tpu4_to3_mux[] = {
 	TPU4TO3_MARK,
-- 
2.17.1

