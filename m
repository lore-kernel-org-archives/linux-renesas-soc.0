Return-Path: <SRS0=gRf3=OW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232FDC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6DC42087F
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 13 Dec 2018 16:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6DC42087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729473AbeLMQ3H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 13 Dec 2018 11:29:07 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:44590 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729596AbeLMQ3G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Dec 2018 11:29:06 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id BUV31z0043XaVaC01UV3N9; Thu, 13 Dec 2018 17:29:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0006KW-V9; Thu, 13 Dec 2018 17:29:02 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gXTrC-0003i5-U7; Thu, 13 Dec 2018 17:29:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] pinctrl: sh-pfc: Validate pins/marks in pin group at build time
Date:   Thu, 13 Dec 2018 17:28:55 +0100
Message-Id: <20181213162855.14190-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213162855.14190-1-geert+renesas@glider.be>
References: <20181213162855.14190-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a build-time check, to ensure the number of pins and pin marks in a
pin group matches.  This helps catching bugs early.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 78dc342d7b390e02..a2c5d530aaa1c0b3 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -41,7 +41,8 @@ struct sh_pfc_pin {
 		.name = #alias,				\
 		.pins = n##_pins,			\
 		.mux = n##_mux,				\
-		.nr_pins = ARRAY_SIZE(n##_pins),	\
+		.nr_pins = ARRAY_SIZE(n##_pins) +	\
+		BUILD_BUG_ON_ZERO(!(sizeof(n##_pins) == sizeof(n##_mux))), \
 	}
 #define SH_PFC_PIN_GROUP(n)	SH_PFC_PIN_GROUP_ALIAS(n, n)
 
-- 
2.17.1

