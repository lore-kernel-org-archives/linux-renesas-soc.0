Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC028C2D0E4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Nov 2020 12:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89D9C20738
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Nov 2020 12:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgKSMxX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 07:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727270AbgKSMxX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 07:53:23 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92255C0613CF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 04:53:22 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id uCtL2300B4C55Sk06CtLs6; Thu, 19 Nov 2020 13:53:20 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjRA-003pry-4m; Thu, 19 Nov 2020 13:53:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kfjR9-00H3nI-FO; Thu, 19 Nov 2020 13:53:19 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
Date:   Thu, 19 Nov 2020 13:53:18 +0100
Message-Id: <20201119125318.4066097-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no reason to keep on using the __raw_{read,write}l() I/O
accessors in Renesas ARM or SuperH driver code.  Switch to using the
plain {read,write}l() I/O accessors, to have a chance that this works on
big-endian.

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Assembler output difference on SuperH checked.
---
 sound/soc/sh/fsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 3c574792231bc5c3..518d4b0c4b8b99fa 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -313,12 +313,12 @@ static void __fsi_reg_write(u32 __iomem *reg, u32 data)
 	/* valid data area is 24bit */
 	data &= 0x00ffffff;
 
-	__raw_writel(data, reg);
+	writel(data, reg);
 }
 
 static u32 __fsi_reg_read(u32 __iomem *reg)
 {
-	return __raw_readl(reg);
+	return readl(reg);
 }
 
 static void __fsi_reg_mask_set(u32 __iomem *reg, u32 mask, u32 data)
-- 
2.25.1

