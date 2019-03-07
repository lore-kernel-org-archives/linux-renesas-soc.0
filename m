Return-Path: <SRS0=HvZV=RK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E51FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:05:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BB2D20663
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  7 Mar 2019 00:05:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtoqJlg2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfCGAE7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 19:04:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36668 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfCGAE7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 19:04:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id o17so15402700wrw.3;
        Wed, 06 Mar 2019 16:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOq4o/gGBKYosn1k7l7U3C9cWiFchEJt6ahMuB7Tvbg=;
        b=RtoqJlg22b0Q4xrOjXexLh1hsP8j74VkgY5OWB/UHls24EsvGuKAgOCQBlTmgWACIV
         1vUaTxjfZEmkjxANiaJgts/7HRd4B4mFISMGD9y56CDQ2q8hWXRO8PiT6uZPzLSCMaX1
         UhjXyRCiDfqunXnC0JCcN/xQIGIiASNsZbUAJrBi0CzD7KCO1/TEtkGS/x5DdSKKcoTY
         XKq7gCAL1AlRngIBj01HsbmOMxlv8+ZbRE57GtKx8hWuPdPa0M2bKcZRyfMP2HIpdxoR
         h6vXk366gQVrb3wAishuy3EUXHJHWQnSu91m4YGDhCoho6/8Pp6b2RxZaVkU+h1Hhilu
         s6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOq4o/gGBKYosn1k7l7U3C9cWiFchEJt6ahMuB7Tvbg=;
        b=Mk2xMkbtfAUHuCw6KRqGseAi9pMwwVUAM/tV3kIWykwG2OTruOURRZebhMr8Np6KiC
         lpxqVCKFdskwdT362WwPZ4OdUS/8McDUQG73WIZfK9TQP//Go5Ae+VU03DRN2cdfCxKw
         xA4S0DwrrWa2KTKQaU2aXlX1tVLksck3mHhtEH0DfMsMYU1QgnMg/lAocsi8YTrxtR4l
         MtYJfTEaLJT9T0q7xwZ3Tlk2sEiwVe+FBTjRdmxIn0dJsBP9fEEdXtQULxdKDflgfHY2
         0CtYZvLdM6yg1vkk8n5VjvBkABwypU2p0NvL9CZNhNwpSC7r7ZAW/+l+2ZFGHNvkWQir
         U7/A==
X-Gm-Message-State: APjAAAXeSnSwWgPBxVeLvZCvSsKYmbItCO94uPDnGkBVtPmB7ZTA14Mg
        9XeiEAFM419ZX0bsVtLp0N+JLFmW
X-Google-Smtp-Source: APXvYqwMIDUADyD/Qipl8keh4e4um+QfcZHkiUJF2DoDBzXybUfaPKq/R8LrXOuLrB5QgZ3APWNXOA==
X-Received: by 2002:a05:6000:1c2:: with SMTP id t2mr4993658wrx.109.1551917097157;
        Wed, 06 Mar 2019 16:04:57 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id a22sm3381642wmj.35.2019.03.06.16.04.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Mar 2019 16:04:56 -0800 (PST)
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
Subject: [PATCH 2/2] [RFC] nvme-pci: Respect bus DMA constraints
Date:   Thu,  7 Mar 2019 01:04:40 +0100
Message-Id: <20190307000440.8708-2-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190307000440.8708-1-marek.vasut@gmail.com>
References: <20190307000440.8708-1-marek.vasut@gmail.com>
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
 drivers/nvme/host/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 92bad1c810ac..8ec873fb86b1 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2323,7 +2323,8 @@ static int nvme_pci_enable(struct nvme_dev *dev)
 
 	pci_set_master(pdev);
 
-	if (dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(64)) &&
+	if (!dev->dev->coherent_dma_mask &&
+	    dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(64)) &&
 	    dma_set_mask_and_coherent(dev->dev, DMA_BIT_MASK(32)))
 		goto disable;
 
-- 
2.20.1

