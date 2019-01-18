Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6332C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 14:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 89A7B2087E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 14:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfAROiu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 09:38:50 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:54082 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfAROiu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 09:38:50 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id Rqen1z0073XaVaC01qentY; Fri, 18 Jan 2019 15:38:47 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gkVIF-0007kw-1s; Fri, 18 Jan 2019 15:38:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gkUrS-0007n9-BQ; Fri, 18 Jan 2019 15:11:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Mark Brown <broonie@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] spi: sh-hspi: Remove error messages on out-of-memory conditions
Date:   Fri, 18 Jan 2019 15:11:05 +0100
Message-Id: <20190118141105.29910-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is no need to print an error message when memory allocations or
related operations fail, as the core will take care of that.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/spi/spi-sh-hspi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index dc0926e4366548a5..7159cb99dbe977ee 100644
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
2.17.1

