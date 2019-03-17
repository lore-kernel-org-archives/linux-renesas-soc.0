Return-Path: <SRS0=pEya=RU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B31C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 18:11:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B3B82086A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Mar 2019 18:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ndtAYHfm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfCQSLf (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Mar 2019 14:11:35 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41927 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfCQSLf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Mar 2019 14:11:35 -0400
Received: by mail-lf1-f68.google.com with SMTP id 10so10100595lfr.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Mar 2019 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0afd8Io97Ei0NYCpCWazGPGfGrpqfnivNjoIICTsO+Q=;
        b=ndtAYHfmv9wTlkkoHtGIPC5kyuRk3drz92J4rycQYqoXIxGQP1qfwJvMsZfh0G0dEc
         RaQy453/y7GaVOb9wkv0aw1YNMb8I8YSmcA+2ExJHWavTUXqAt+JgFPw26n97QPAXtJd
         WCR1M9g46QErB7Sfo0K4r5HqLhRZhIlSwAF19HVZ56lE/RUtBnYINHhIUxuwPFKNiYK6
         TXSPhRnbuekche13Ulqgz3CCaThZ40IvLQzd/E8YtbD8wxi3OkIVm9Bj+zmD2pliXvQl
         N0qqNq0dZfMeIFdLI8TkAWPE+fQ1ZROhOR0fFBjrUG0mJ9ukmtxhfLHDh2q7u6OSu8Dv
         qEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=0afd8Io97Ei0NYCpCWazGPGfGrpqfnivNjoIICTsO+Q=;
        b=RgF+SVxV51HQqmZhYPBDgf7+mENTuPJ613GRPKWmWiESfmzdCvUSXKBGC/l6cCGEYF
         z+xhaghlw2TR6HUbdNqYO83A3EprJIQpx/A0Wjw3d1u5BQU6xizpi51Xq4oXWfgNNoST
         qS4AZ8diZnhws7m5+HMuuHM3q+PlpNtuRVVp5cIRc5yy3HIOfU7Umxoa5lKcePfgN8aj
         c0/T/GUSGGCZ29o4JbRr2hjfABIEDyVwcA4Yl3L7zUtDIdoNucblkiJg6uAtVlnMNoXM
         +5EP6IaawO5WyWCxnksNBZBCNmCGohj/ufrdVHX73gdcrNl2f3Un3rsDSbX3D2G0el1j
         eN4A==
X-Gm-Message-State: APjAAAUhnSvJTpL/hHbj7aBQVwEmg5iDJdDrlSayaJS43WblOI1Zt68h
        paUJNJiuMmkI/5++M2KU7opd/Q==
X-Google-Smtp-Source: APXvYqzZHisMT63N9+SlRm7zSqcXjRWObFsggURWFWIAVQ7Smw+vZKjv7fPc/KQugSl8fLukDcF0xA==
X-Received: by 2002:ac2:5325:: with SMTP id f5mr7591893lfh.77.1552846293742;
        Sun, 17 Mar 2019 11:11:33 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.85.82])
        by smtp.gmail.com with ESMTPSA id h5sm1561345lfc.24.2019.03.17.11.11.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Mar 2019 11:11:32 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4.9.y] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        GregKH <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <e82bd7bc-3e47-0ac9-ce43-5fb809644f9f@cogentembedded.com>
Date:   Sun, 17 Mar 2019 21:11:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Commit 5c27ff5db1491a947264d6d4e4cbe43ae6535bae upstream.

I have encountered an interrupt storm during the eMMC chip probing (and
the chip finally didn't get detected).  It turned out that U-Boot left
the DMAC interrupts enabled while the Linux driver  didn't use those.
The SDHI driver's interrupt handler somehow assumes that, even if an
SDIO interrupt didn't happen, it should return IRQ_HANDLED.  I think
that if none of the enabled interrupts happened and got handled, we
should return IRQ_NONE -- that way the kernel IRQ code recoginizes
a spurious interrupt and masks it off pretty quickly...

Fixes: 7729c7a232a9 ("mmc: tmio: Provide separate interrupt handlers")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'linux-4.9.y' branch of the -stable repo.

 drivers/mmc/host/tmio_mmc_pio.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

Index: linux-stable/drivers/mmc/host/tmio_mmc_pio.c
===================================================================
--- linux-stable.orig/drivers/mmc/host/tmio_mmc_pio.c
+++ linux-stable/drivers/mmc/host/tmio_mmc_pio.c
@@ -675,7 +675,7 @@ static bool __tmio_mmc_sdcard_irq(struct
 	return false;
 }
 
-static void tmio_mmc_sdio_irq(int irq, void *devid)
+static bool tmio_mmc_sdio_irq(int irq, void *devid)
 {
 	struct tmio_mmc_host *host = devid;
 	struct mmc_host *mmc = host->mmc;
@@ -684,7 +684,7 @@ static void tmio_mmc_sdio_irq(int irq, v
 	unsigned int sdio_status;
 
 	if (!(pdata->flags & TMIO_MMC_SDIO_IRQ))
-		return;
+		return false;
 
 	status = sd_ctrl_read16(host, CTL_SDIO_STATUS);
 	ireg = status & TMIO_SDIO_MASK_ALL & ~host->sdcard_irq_mask;
@@ -697,6 +697,8 @@ static void tmio_mmc_sdio_irq(int irq, v
 
 	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
 		mmc_signal_sdio_irq(mmc);
+
+	return ireg;
 }
 
 irqreturn_t tmio_mmc_irq(int irq, void *devid)
@@ -718,9 +720,10 @@ irqreturn_t tmio_mmc_irq(int irq, void *
 	if (__tmio_mmc_sdcard_irq(host, ireg, status))
 		return IRQ_HANDLED;
 
-	tmio_mmc_sdio_irq(irq, devid);
+	if (tmio_mmc_sdio_irq(irq, devid))
+		return IRQ_HANDLED;
 
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 EXPORT_SYMBOL(tmio_mmc_irq);
 
