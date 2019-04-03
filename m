Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E015C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:09:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB9ED21473
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 09:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfDCJJN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 05:09:13 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:17658 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfDCJJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 05:09:13 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x33998rg004339;
        Wed, 3 Apr 2019 18:09:08 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp);
 Wed, 03 Apr 2019 18:09:07 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav405.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x339926f004249
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 3 Apr 2019 18:09:07 +0900 (JST)
        (envelope-from na-hoan@jinso.co.jp)
From:   Nguyen An Hoan <na-hoan@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc:     linux-spi@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH] spi: rspi: Add configuration for LSB/MSB
Date:   Wed,  3 Apr 2019 18:09:01 +0900
Message-Id: <1554282541-8952-1-git-send-email-na-hoan@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

SPI controllers can support LSB or MSB depending on
the structure of the message that Slave requires,
Add support.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/spi/spi-rspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index 3be8fbe..7ae5f09 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -950,6 +950,8 @@ static int rspi_prepare_message(struct spi_controller *ctlr,
 		rspi->spcmd |= SPCMD_CPOL;
 	if (spi->mode & SPI_CPHA)
 		rspi->spcmd |= SPCMD_CPHA;
+	if (spi->mode & SPI_LSB_FIRST)
+		rspi->spcmd |= SPCMD_LSBF;
 
 	/* CMOS output mode and MOSI signal from previous transfer */
 	rspi->sppcr = 0;
-- 
2.7.4

