Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F94C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 09:29:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A1EF20823
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 09:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfARJ3z (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 04:29:55 -0500
Received: from www3345.sakura.ne.jp ([49.212.235.55]:57963 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfARJ3y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 04:29:54 -0500
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x0I9Tjhn005251;
        Fri, 18 Jan 2019 18:29:45 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp);
 Fri, 18 Jan 2019 18:29:45 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav106.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x0I9TVPn005172
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Jan 2019 18:29:45 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be
Cc:     linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [v2 PATCH 1/2] spi: sh-msiof: fix *info pointer in request_dma()
Date:   Fri, 18 Jan 2019 18:29:30 +0900
Message-Id: <1547803771-9564-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

sh_msiof_spi_info *info struct pointer was initialized in the probe() function
no need to get back and keep consistency.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-sh-msiof.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index d14b407..351470b 100644
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
2.7.4

