Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFD9C07EBF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F20A621473
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547836742;
	bh=LB14gRaT4I2nbY7A6p2PhE7z7LkdS9qWda81F1Sr/ng=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=R5lBGiH2wn5JIze5mlnj0Xs9HsT65/3B5oVyAH5dZuabwfDKJxZ9cCuvsUEGdW4hD
	 2Gu3nzHsOYZjwZLM6g9pgkI1ZeGXZYpFUUxku1B+fnFTJKRkx/r9YyygwqT+QCHKTv
	 h1BeBu2FC83oO0yl/EYcyunKPpI4K3A8eBYHqL2U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729090AbfARSjB (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:39:01 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58114 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728457AbfARSjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 13:39:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=fw/Z3DQXcZ74SMhiPR4aOsbQ/qI2gw0zl6OL+cDH/m4=; b=Mw5JIQY3nhid
        Ka7TJ424sndAwvNCgQ4IRL5rYb6tVHEBCNAdQGqARMzvoXErMr0f/MiXx4TivAe/1yNXwooBKNFYI
        RpdzI+KFt8nw/mxsrIS33OCgJHQdynW/lKZPh+eep4WY9zinML/3zPXmJl8OvtL3qQsfIc9bR5VB2
        hAFPA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gkZ2f-0005NW-OC; Fri, 18 Jan 2019 18:38:57 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 4C57411276E7; Fri, 18 Jan 2019 18:38:57 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Brown <broonie@kernel.org>, Mark Brown <broonie@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: Applied "spi: sh-hspi: Remove error messages on out-of-memory conditions" to the spi tree
In-Reply-To:  <20190118141105.29910-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Message-Id: <20190118183857.4C57411276E7@debutante.sirena.org.uk>
Date:   Fri, 18 Jan 2019 18:38:57 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-hspi: Remove error messages on out-of-memory conditions

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

From 88e7e0a8df1ff1ceac0a4b487e25860446bdbfb2 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Fri, 18 Jan 2019 15:11:05 +0100
Subject: [PATCH] spi: sh-hspi: Remove error messages on out-of-memory
 conditions

There is no need to print an error message when memory allocations or
related operations fail, as the core will take care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-hspi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index dc0926e43665..7159cb99dbe9 100644
--- a/drivers/spi/spi-sh-hspi.c
+++ b/drivers/spi/spi-sh-hspi.c
@@ -226,10 +226,8 @@ static int hspi_probe(struct platform_device *pdev)
 	}
 
 	master = spi_alloc_master(&pdev->dev, sizeof(*hspi));
-	if (!master) {
-		dev_err(&pdev->dev, "spi_alloc_master error.\n");
+	if (!master)
 		return -ENOMEM;
-	}
 
 	clk = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
@@ -248,7 +246,6 @@ static int hspi_probe(struct platform_device *pdev)
 	hspi->addr	= devm_ioremap(hspi->dev,
 				       res->start, resource_size(res));
 	if (!hspi->addr) {
-		dev_err(&pdev->dev, "ioremap error.\n");
 		ret = -ENOMEM;
 		goto error1;
 	}
-- 
2.20.1

