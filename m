Return-Path: <SRS0=NV9y=ZO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A4BC432C0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Nov 2019 06:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E772E2068F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 22 Nov 2019 06:16:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfKVGNz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 22 Nov 2019 01:13:55 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:61957 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729514AbfKVGNy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:54 -0500
X-IronPort-AV: E=Sophos;i="5.69,228,1571670000"; 
   d="scan'208";a="32153148"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2019 15:13:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C0654400D0F7;
        Fri, 22 Nov 2019 15:13:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 4/4] mmc: host: renesas_sdhi_sys_dmac: Set dma_buswidth value to 32 byte
Date:   Fri, 22 Nov 2019 15:13:51 +0900
Message-Id: <1574403231-18512-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To improve performance, this patch sets dma_buswidth value to 32
when transfer size is multiples of 32. In other words, a sd card
transfer's size if not multiples of 32, this driver uses PIO
and then the performance will be down.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 09137cc..65e71b6 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -58,7 +58,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
-	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_4_BYTES,
+	.dma_buswidth	= DMA_SLAVE_BUSWIDTH_32_BYTES,
 	.dma_rx_offset	= 0x2000,
 	.scc_offset	= 0x0300,
 	.taps		= rcar_gen2_scc_taps,
-- 
2.7.4

