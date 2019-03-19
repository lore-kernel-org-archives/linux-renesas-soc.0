Return-Path: <SRS0=zxXW=RW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA9DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:13:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84D1420857
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Mar 2019 10:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbfCSKNL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:13:11 -0400
Received: from sauhun.de ([88.99.104.3]:43528 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726896AbfCSKNL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Mar 2019 06:13:11 -0400
Received: from localhost (p5486CE21.dip0.t-ipconnect.de [84.134.206.33])
        by pokefinder.org (Postfix) with ESMTPSA id 180272C3F83;
        Tue, 19 Mar 2019 11:13:07 +0100 (CET)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-mmc@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT] mmc: renesas_sdhi: limit block count to 16 bit for old revisions
Date:   Tue, 19 Mar 2019 11:12:59 +0100
Message-Id: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car Gen2 has two different SDHI incarnations in the same chip. The
older one does not support the recently introduced 32 bit register
access to the block count register. Make sure we use this feature only
after the first known version.

Thanks to the Renesas Testing team for this bug report!

Fixes:5603731a15ef ("mmc: tmio: fix access width of Block Count Register")
Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I could reproduce the issue on my Renesas Lager board (R-Car H2) and this patch
fixes the issue for me. Still, if we could confirmation from the testing team,
this would be awesome to have before applying, I think.

 drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 71e13844df6c..8742e27e4e8b 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -641,6 +641,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct renesas_sdhi *priv;
 	struct resource *res;
 	int irq, ret, i;
+	u16 ver;
 
 	of_data = of_device_get_match_data(&pdev->dev);
 
@@ -773,12 +774,17 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	ver = sd_ctrl_read16(host, CTL_VERSION);
+	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
+	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
+		mmc_data->max_blk_count = U16_MAX;
+
 	ret = tmio_mmc_host_probe(host);
 	if (ret < 0)
 		goto edisclk;
 
 	/* One Gen2 SDHI incarnation does NOT have a CBSY bit */
-	if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN2_SDR50)
+	if (ver == SDHI_VER_GEN2_SDR50)
 		mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
 
 	/* Enable tuning iff we have an SCC and a supported mode */
-- 
2.11.0

