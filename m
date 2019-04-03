Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE903C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 04:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FD4A2148E
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 04:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1554266546;
	bh=dtth1s+1ecdDSq8w+FDfedPPSOjp/qo77w0np0K+NDc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=l7gadBK060XPxMzZcXAReDlXLaNARatQDiAdcmUKjJ2REWnRzF2RvZ/80YhCJFgy5
	 X/Q/aDEoCxolwKNiS+3A9nLhjT6Wll981TG+9n40NN95gQh6+B1N2mZezNB7b2YLaf
	 atvV3cvdCAoxL28qjjJKNXxYk3GvQrL/UP43u9c4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbfDCEm0 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 00:42:26 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:40492 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfDCEmZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 00:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=L0seSYUFvMmfd2DiaUQrQNSVSTVkXAVofKv5oq2unzg=; b=RJbvPl/pK/oZ
        02YHpoIiM8aewaIkTya7xnASNnmRzbWOshI28wJcNpXU5L9VQY3Vz6BFJfkSbx9KyJNClZcIVfDrN
        wbiGsJgPJKelOrdAY+10sXlACGDvZtZJXxtg9eLIkQlcodOdP28fbbeIpEd46p4f0jslinmvg35wF
        655n4=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hBXjB-00040Q-Rq; Wed, 03 Apr 2019 04:42:22 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
        id 41630440082; Wed,  3 Apr 2019 05:42:19 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: Use readl_poll_timeout_atomic() instead of open-coding" to the spi tree
In-Reply-To:  <20190402144023.27422-3-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190403044219.41630440082@finisterre.ee.mobilebroadband>
Date:   Wed,  3 Apr 2019 05:42:19 +0100 (BST)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: Use readl_poll_timeout_atomic() instead of open-coding

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9115b4d89b213dc73fd35844e0199b1763f751d6 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 2 Apr 2019 16:40:22 +0200
Subject: [PATCH] spi: sh-msiof: Use readl_poll_timeout_atomic() instead of
 open-coding

Replace the open-coded loop in sh_msiof_modify_ctr_wait() by a call to
the readl_poll_timeout_atomic() helper macro.

Suggested-by: Wolfram Sang <wsa@the-dreams.de>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 6edc76636e81..3243ff258896 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -18,6 +18,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -219,21 +220,14 @@ static int sh_msiof_modify_ctr_wait(struct sh_msiof_spi_priv *p,
 {
 	u32 mask = clr | set;
 	u32 data;
-	int k;
 
 	data = sh_msiof_read(p, CTR);
 	data &= ~clr;
 	data |= set;
 	sh_msiof_write(p, CTR, data);
 
-	for (k = 100; k > 0; k--) {
-		if ((sh_msiof_read(p, CTR) & mask) == set)
-			break;
-
-		udelay(10);
-	}
-
-	return k > 0 ? 0 : -ETIMEDOUT;
+	return readl_poll_timeout_atomic(p->mapbase + CTR, data,
+					 (data & mask) == set, 10, 1000);
 }
 
 static irqreturn_t sh_msiof_spi_irq(int irq, void *data)
-- 
2.20.1

