Return-Path: <SRS0=bfNf=QQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EC7C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 19:13:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 327A7217D8
	for <linux-renesas-soc@archiver.kernel.org>; Sat,  9 Feb 2019 19:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ChHlErHJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfBITNu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 9 Feb 2019 14:13:50 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43697 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfBITNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Feb 2019 14:13:50 -0500
Received: by mail-lf1-f65.google.com with SMTP id j1so4918504lfb.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Feb 2019 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Dn1Py15E4ID/MTSmA0G4F9SiBBW4lkQZx3R5s26WVNQ=;
        b=ChHlErHJCX5m9dgzz2KolPJJLMLitnxap8PBPNEWV30qvCnRwjzZHI3KAxA13Tnn3E
         IQBKgHjIeqjk8NcikytoZ6W4qHd1Lx6JT52yp7ewE2O4MQR+/SpVeJEpiBC8nBqb9eaE
         rThaVpvSXPsOY2VcKqcup3URFphoyWwfXqbzqMTp4QVN4eHhThe+TWWGgk9CeiRw8FMb
         DFA2prS4t1g+e8h/DtdneBlYKRonwZwTrYPC5rcTtOCPv3dgiezB3ZnM2Nj2SlvOAgyl
         odR/RrJkiHePuW7oR95Ge+YfBGWcFikAfKmMsH0mBoH9Ozd2hsqQ1J2QXb2Qocbu2zke
         wWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=Dn1Py15E4ID/MTSmA0G4F9SiBBW4lkQZx3R5s26WVNQ=;
        b=TaBQAguwcfsak8+/tvmb5dS4g03gZundusS3IPbsa8uyzlc5KLHOWutXPEFeoFfHAU
         +bNJxAKiNCeHIShUG5ylGbH5qdv5r4djT/bhMYSc3SKG52ni9KCyaXvGLA1rf5nI8gJX
         8KdGx/tJDcx5ULZzDibWCN8ZY1GA9aEtmvVaT9IZYbAPkuYZJzwilyjflRaC5We1lrAN
         SSjqmo37l5z4ohiE2Kb2Y4UxX/RIhTvyzmjm8jVHaEAz2lCCSmjUszoq6ACIAtH4M+zl
         /nqygTPYyF+82us4ANbitxcK5uUpZJG3UsikiXV2EzvplF/5ADF9/o9o8baZi4gNj5Rg
         rUpQ==
X-Gm-Message-State: AHQUAuaSrCbud3uCUDt3k1uGBCjdJ19sw3X+6xdyx2etBFJ0LCVL6jkp
        UhNxLldMgts7uizGflg/ZfKlMOX/2m0=
X-Google-Smtp-Source: AHgI3IYUY37xog/45HeFPzYLAvR3GUUQJnbJ4tvkr9z0qjTdbhkNORVDAYDmGMoQ9j7AyrRrHunUPw==
X-Received: by 2002:ac2:41cf:: with SMTP id d15mr17125406lfi.14.1549739627726;
        Sat, 09 Feb 2019 11:13:47 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.183])
        by smtp.gmail.com with ESMTPSA id q10-v6sm1151869ljj.3.2019.02.09.11.13.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Feb 2019 11:13:47 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <c737228e-fde2-33a0-2fdc-d88f0bfd2a9b@cogentembedded.com>
Date:   Sat, 9 Feb 2019 22:13:44 +0300
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

I have encountered an interrupt storm  during the eMMC chip probing (and
the chip finally didn't get detected). It  turned out  that U-Boot  left
the DMAC interrupts enabled while the  Linux driver didn't use those.
The SDHI driver's interrupt handler somehow  assumes that, even if an
SDIO interrupt didn't happen, it should return IRQ_HANDLED. I think that
if none of the enabled interrupts happened and got handled, we should
return IRQ_NONE -- that way the kernel IRQ code recoginizes a spurious
interrupt and masks  it off pretty quickly...

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.
We  seem  to have dropped the ball on the version 1...

Changes in version 2:
- refreshed the patch;
- fixed an article and whitespace in the patch description.

 drivers/mmc/host/tmio_mmc_core.c |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

Index: mmc/drivers/mmc/host/tmio_mmc_core.c
===================================================================
--- mmc.orig/drivers/mmc/host/tmio_mmc_core.c
+++ mmc/drivers/mmc/host/tmio_mmc_core.c
@@ -629,7 +629,7 @@ static bool __tmio_mmc_sdcard_irq(struct
 	return false;
 }
 
-static void __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
+static bool __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
 {
 	struct mmc_host *mmc = host->mmc;
 	struct tmio_mmc_data *pdata = host->pdata;
@@ -637,7 +637,7 @@ static void __tmio_mmc_sdio_irq(struct t
 	unsigned int sdio_status;
 
 	if (!(pdata->flags & TMIO_MMC_SDIO_IRQ))
-		return;
+		return false;
 
 	status = sd_ctrl_read16(host, CTL_SDIO_STATUS);
 	ireg = status & TMIO_SDIO_MASK_ALL & ~host->sdio_irq_mask;
@@ -650,6 +650,8 @@ static void __tmio_mmc_sdio_irq(struct t
 
 	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
 		mmc_signal_sdio_irq(mmc);
+
+	return ireg ? true : false;
 }
 
 irqreturn_t tmio_mmc_irq(int irq, void *devid)
@@ -668,9 +670,10 @@ irqreturn_t tmio_mmc_irq(int irq, void *
 	if (__tmio_mmc_sdcard_irq(host, ireg, status))
 		return IRQ_HANDLED;
 
-	__tmio_mmc_sdio_irq(host);
+	if (__tmio_mmc_sdio_irq(host))
+		return IRQ_HANDLED;
 
-	return IRQ_HANDLED;
+	return IRQ_NONE;
 }
 EXPORT_SYMBOL_GPL(tmio_mmc_irq);
 
