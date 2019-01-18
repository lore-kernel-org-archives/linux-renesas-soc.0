Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FA2C5ACD3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87A7721473
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 18:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547836742;
	bh=Dsd5VlQbgj3hjolcaN2rTg1ICmUmCkDATC3MbE0zlvs=;
	h=From:To:Cc:Subject:In-Reply-To:Date:List-ID:From;
	b=VazZntTk5fW6ZcdUKjVN2aSAOt5fsi1GZema5R/vK5vpEqKWjxkV3tX2OUdeE/J18
	 Ej0+R/n+qeKKuPge1AFeM5dZf6Ui0Uqnm1RmLSg1qKHqJwOY+Qi+jVa/rEfaqBrHEd
	 sgi2VPpsPYCwxZlS2eiPpg45uYHHI0a/enmmi/+Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfARSjC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:39:02 -0500
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:58146 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728892AbfARSjC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 13:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=Z3hJZ+IOkR1cxxt3gpAqecLw8jPFyXFqU94MWwVYO9c=; b=oK5VDafM+Zfe
        wfMfglF6rf8H1G7uyMxLoh5unhCzF95nYtK2i2CDjt4cCiez9pvD+9kBvg3s93AHER4L4BD/1W/+e
        wtGXk8VUj33TxIoRn8jMoc4idV1vFotjGugSQadYrqUA7rMEiVTONLjGk8veWj+CmT8yROdog2Bmr
        5jGn0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1gkZ2d-0005NL-Sy; Fri, 18 Jan 2019 18:38:55 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 73BB211276E7; Fri, 18 Jan 2019 18:38:55 +0000 (GMT)
From:   Mark Brown <broonie@kernel.org>
To:     Hoan Nguyen An <na-hoan@jinso.co.jp>
Cc:     Mark Brown <broonie@kernel.org>, linux-renesas-soc@vger.kernel.org,
        broonie@kernel.org, geert+renesas@glider.be,
        linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp, linux-spi@vger.kernel.org
Subject: Applied "spi: sh-msiof: fix *info pointer in request_dma()" to the spi tree
In-Reply-To:  <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
X-Patchwork-Hint: ignore
Message-Id: <20190118183855.73BB211276E7@debutante.sirena.org.uk>
Date:   Fri, 18 Jan 2019 18:38:55 +0000 (GMT)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The patch

   spi: sh-msiof: fix *info pointer in request_dma()

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

From f70351ae06af0ccb1f7f91b86395ae5eba9c3c8c Mon Sep 17 00:00:00 2001
From: Hoan Nguyen An <na-hoan@jinso.co.jp>
Date: Fri, 18 Jan 2019 18:29:30 +0900
Subject: [PATCH] spi: sh-msiof: fix *info pointer in request_dma()

sh_msiof_spi_info *info struct pointer was initialized in the probe() function
no need to get back and keep consistency.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index d14b407cc800..351470bc020d 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -1206,7 +1206,7 @@ static int sh_msiof_request_dma(struct sh_msiof_spi_priv *p)
 {
 	struct platform_device *pdev = p->pdev;
 	struct device *dev = &pdev->dev;
-	const struct sh_msiof_spi_info *info = dev_get_platdata(dev);
+	const struct sh_msiof_spi_info *info = p->info;
 	unsigned int dma_tx_id, dma_rx_id;
 	const struct resource *res;
 	struct spi_master *master;
-- 
2.20.1

