Return-Path: <SRS0=HOJI=R3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F70C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 24 Mar 2019 17:32:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B4D41213F2
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 24 Mar 2019 17:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Rf/RSDu3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbfCXRcQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 24 Mar 2019 13:32:16 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36923 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbfCXRcQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Mar 2019 13:32:16 -0400
Received: by mail-lf1-f65.google.com with SMTP id u2so4405934lfd.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 24 Mar 2019 10:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=6llkRkZMWE7xZwOC8T5tXU00lPG8rUYE1xLxT1+LccI=;
        b=Rf/RSDu34tm4p3Sofrmuo/8B6yQPD6VUKuI8GY+WkasRabNaK2eCSiDohKeVcy+B5k
         WugeFkCHmdC7hwWXHwVM3UJ+uGz3aWXk9NOQN7xx7w+7qGHFH8xdjE1/yHR8LzcsMufA
         BZQKr42VLBvwgRBUhpKaxSIzSdY0WZEQLZ6u7LnsukovRyD3790hsTDcIEJlJ8Pfww2j
         ablR0vRKpb022nhhc9DAPiReUbQZnDHrgBtEJKhDYx+IYw4dQr2NiGtu5L7pwWE0hboW
         skGrkl3BH8a/76i76bpxm0p8AQ6sA/NX1aNUTgU5xVpLLK80gvALcdwv3fRQvEclH8Lb
         xJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=6llkRkZMWE7xZwOC8T5tXU00lPG8rUYE1xLxT1+LccI=;
        b=dmVqrtUfjAbRG40zAVA9froBDtBkm8CIyF5ttrAN/ZyxyDYKl3lyaKl2eCpB5PGOYl
         Jaj4oRbaPShOJFGkPnlOvGfw3tNPAGdyaJUYGhX/ACOpEVzoswtu75/+8cbhbHKBUzGo
         0SYYm3nzcgreg+XTr+iC/IM7XTNUfDiF2IkaaQftTGzlhcV+b27idS4wOseVSNtWSVOV
         YF74umtMHey1LGHXp6sqKwObjLzNloiXl1YsrSqPZTn9eXvu6ARtgRxV3EFUUABMzyHj
         rG077Vp00pAzt39hbnBdWvZzuRsDfAZ51QOouTQ0IX6AqbaBhtswrlRtQkc5JIY4Kxp/
         K5Xw==
X-Gm-Message-State: APjAAAV9NaFmUFb/d2dLc+IMIQqU616o/e7i8yzvSeC+4HXGf7tZXtxb
        gdi8DzNif+DzTm4VpcKJpDezv9Lty7s=
X-Google-Smtp-Source: APXvYqw6+S/+XfpgVDdlL50scqcV+dCMVpWYj0FR9ersuj9TX9+Q5mDQgHaJgbjd9d/TwN7csLllwQ==
X-Received: by 2002:ac2:447a:: with SMTP id y26mr11018042lfl.169.1553448734061;
        Sun, 24 Mar 2019 10:32:14 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.80.147])
        by smtp.gmail.com with ESMTPSA id w26sm2996051lfe.5.2019.03.24.10.32.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 24 Mar 2019 10:32:13 -0700 (PDT)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v4.4.y] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        GregKH <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <948c139f-aef2-efb9-6b73-c293883ab368@cogentembedded.com>
Date:   Sun, 24 Mar 2019 20:32:12 +0300
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
The patch is against the 'linux-4.4.y' branch of the -stable repo.

 drivers/mmc/host/tmio_mmc_pio.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

Index: linux-stable/drivers/mmc/host/tmio_mmc_pio.c
===================================================================
--- linux-stable.orig/drivers/mmc/host/tmio_mmc_pio.c
+++ linux-stable/drivers/mmc/host/tmio_mmc_pio.c
@@ -716,7 +716,7 @@ irqreturn_t tmio_mmc_sdio_irq(int irq, v
 	unsigned int sdio_status;
 
 	if (!(pdata->flags & TMIO_MMC_SDIO_IRQ))
-		return IRQ_HANDLED;
+		return IRQ_NONE;
 
 	status = sd_ctrl_read16(host, CTL_SDIO_STATUS);
 	ireg = status & TMIO_SDIO_MASK_ALL & ~host->sdcard_irq_mask;
@@ -730,7 +730,7 @@ irqreturn_t tmio_mmc_sdio_irq(int irq, v
 	if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
 		mmc_signal_sdio_irq(mmc);
 
-	return IRQ_HANDLED;
+	return IRQ_RETVAL(ireg);
 }
 EXPORT_SYMBOL(tmio_mmc_sdio_irq);
 
@@ -747,9 +747,7 @@ irqreturn_t tmio_mmc_irq(int irq, void *
 	if (__tmio_mmc_sdcard_irq(host, ireg, status))
 		return IRQ_HANDLED;
 
-	tmio_mmc_sdio_irq(irq, devid);
-
-	return IRQ_HANDLED;
+	return tmio_mmc_sdio_irq(irq, devid);
 }
 EXPORT_SYMBOL(tmio_mmc_irq);
 
