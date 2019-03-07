Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DF9C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9C78620663
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfV1/MoD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbfCGAEs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 19:04:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54150 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfCGAEs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 19:04:48 -0500
Received: by mail-wm1-f67.google.com with SMTP id e74so7578744wmg.3;
        Wed, 06 Mar 2019 16:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RsyiXtrERdpKhf948BNoHs6KFXRsfkG+m5eMNygOTsY=;
        b=lfV1/MoDOOOHq6MN2NpUiOVb3tS9Qs7ndM8f2zX2zp+ZshSMY4dErTE4V/5crMXpTr
         c1vIL1Gh4Y88jHAIg0d5qN0uM3oYcV6fxjIsXxtYgjgBkGRnmQrzn7V2G6lBzEHBhTOH
         ycNkt7izypZL2fq2irKlTLh9AKkbtsqpvZGEHRBUSG3ayzda/LlOTFujADTQMlIh3Ocu
         DsMfxKm/zin6TwXcStwV/j0iNJn8DlZAqOoZyj6N0ZSkRoleu8pQilp8H94Ntjm0g2Mb
         0Nhqtvrv4QfRHiMA7WkIcnpLQibwx64KTV9q+1uAxa87iwzx1LRf84ptDPh4py0S6iK6
         n+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RsyiXtrERdpKhf948BNoHs6KFXRsfkG+m5eMNygOTsY=;
        b=PqHcWpVhBkBXMu3dQ5m0ntV6YHKwOKMk7SLRpz8jRa8aijiTmnEyl527Phs/5Ikadn
         9KaXN5grTwlB11eaBXhvV1oO9kSuNNkBCD2zAJIMPyhuHz7LlJ0hTVwpr2hglUHcGjtD
         koECylPaNM8vSd+gsZL3Klz9rwLGLfkv/2EPHt/3bdOGBRi/WUxBc17m4L97WEGd9Ffj
         sxXb/ouwzmVl4aGSpePZ0h/IIIXQucQejw0ULhNgjPyztIo+5T+Tm+LknOto4nOHdZ2p
         tfqjj2nsDQNSNBeJErdrXavKio5EO732CPQNyKJAlHoSudIbaxepmY5SdQX1Gwv37zj3
         pEaA==
X-Gm-Message-State: APjAAAVWuUQRvU+oZccUHU7FYaaeX3ElY0BxDuk46hM2RBTatjYqftai
        fP7noI2N06qg4xQeSj6BZ+f/h1OQ
X-Google-Smtp-Source: APXvYqxQquUdrWyJ/WAJKha1c17+MslNr4y/yfpEN44Oe5nis6OqczmBYSegEnQ54cTT3x035erAYA==
X-Received: by 2002:a1c:63d4:: with SMTP id x203mr3992117wmb.128.1551917085535;
        Wed, 06 Mar 2019 16:04:45 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a22sm3381642wmj.35.2019.03.06.16.04.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2019 16:04:44 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-ide@vger.kernel.org, linux-nvme@lists.infradead.org
Cc:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@fb.com>, Jens Axboe <axboe@kernel.dk>,
        Keith Busch <keith.busch@intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sagi Grimberg <sagi@grimberg.me>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] [RFC] ata: ahci: Respect bus DMA constraints
Date:   Thu,  7 Mar 2019 01:04:39 +0100
Message-Id: <20190307000440.8708-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut+renesas@gmail.com>

Since commit 6c2fb2ea7636 ("of/device: Set bus DMA mask as appropriate"),
the upstream bus can constraint device DMA range. Respect that constraint
and do not change the device DMA masks if they were already set.

This is applicable e.g. on systems where the PCIe controller cannot expose
the full address space range. Such a system may have a 64bit CPU with DRAM
mapped both below and above the 32bit address space, yet the PCIe devices
can not perform DMA directly to/from the DRAM range above the 32bit limit.
Hence, for such setup to work, all the buffers must exist below the 32bit
limit.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jens Axboe <axboe@fb.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: Keith Busch <keith.busch@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Sagi Grimberg <sagi@grimberg.me>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-ide@vger.kernel.org
To: linux-nvme@lists.infradead.org
---
 drivers/ata/ahci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index 021ce46e2e57..2acce056dd8c 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -926,6 +926,13 @@ static int ahci_configure_dma_masks(struct pci_dev *pdev, int using_dac)
 	if (pdev->dma_mask && pdev->dma_mask < DMA_BIT_MASK(32))
 		return 0;
 
+	/*
+	 * The upstream device could have applied DMA constraints already,
+	 * respect those and do not change the DMA masks.
+	 */
+	if (pdev->dev.dma_mask && pdev->dev.coherent_dma_mask)
+		return 0;
+
 	if (using_dac &&
 	    !dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
 		rc = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(64));
-- 
2.20.1

