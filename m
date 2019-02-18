Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA9DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E079B2146F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 17:45:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="yaT4xELy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731296AbfBRRpo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 12:45:44 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:47078 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388288AbfBRRpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 12:45:44 -0500
Received: by mail-lj1-f196.google.com with SMTP id v16so15064220ljg.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Feb 2019 09:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=S4C6cRn66bK/gnGHM8DZYRk2tLrQu1yj/oRkR/po+C8=;
        b=yaT4xELyku+eBmBWCeXszmkUWFwgu0eSr/fUEHNz0yql453O4D7TfMWUeelsnjcf6i
         pNK8vi8c7pZ6igdfBG9FhLrP+VbAy8rIKv37eSa/b/6o1trc54C6gqO1Ryi0hvC4EjNZ
         ezAOLY1rnVgYUnDDkJsXkDUnkLRaQ2AxHaeBv1sqABPtgxrxAILPXG7CyPJ6cXnuILRM
         aKuEG/v0rsUQYcVJWAM8T3sA7U2zJKsgk0WrS3mgvZX5tZiT4chxePRZ33k2MxC/6Upp
         aUZh4POMzNqbhwJotufmB654ycC/6J+VQ1O0SU/+opKSdT99ndKwrrjXuoGj8GAzYhCo
         L/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=S4C6cRn66bK/gnGHM8DZYRk2tLrQu1yj/oRkR/po+C8=;
        b=ZnTX5fERMu/QB6uk2llv7jiBusPWPt9vkIOSO7Zf/tXlLwuue/oJHCzKGdU3Z4kaiI
         N/Oc86UB4Ivn+wqv5YwLs9RcovSF8jt9y5Iw6iIcHSIroKMQ400buPtXWqQs3o8bdBMR
         R25WuZqzCh44N8b8ocm+D8qXRtdA+FUSNwuUGloMSC96sDBc7l2L037klC/E724f8hOE
         jaQ51Pl+hMIao62AXi1PEljWn7Zewti7mh6iIkFBxWwxph95anEjcpaFD6ll0Lh105Bm
         G9vv3wNyTWez74LWISyejq2RiS3GxsKPaqqzVv4UwKL70GvQzxPgf8UM7VUr2+1j2KEk
         oKjA==
X-Gm-Message-State: AHQUAuZaL0VDQKMl6UhdxV/3sZzHOo2IR4CdABNawOE70h1rFVpbay2R
        gX+KzCkD7Tzdir7d2i6x1iAy4R7LMkw=
X-Google-Smtp-Source: AHgI3IaMO6PgKnS+oVfC7BgoJVrNjEMHssgPeRe+N7WPwD3UhkTgEnS2dV7LDp16FnsdHuS1Uf2/0g==
X-Received: by 2002:a2e:9618:: with SMTP id v24-v6mr14951841ljh.110.1550511941908;
        Mon, 18 Feb 2019 09:45:41 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.29])
        by smtp.gmail.com with ESMTPSA id r10-v6sm3563624ljj.71.2019.02.18.09.45.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Feb 2019 09:45:41 -0800 (PST)
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v3] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Organization: Cogent Embedded
Message-ID: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
Date:   Mon, 18 Feb 2019 20:45:40 +0300
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
The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.

Changes in version 3:
- simplified the final *return* statement in __tmio_mmc_sdio_irq();
- added the "Fixes:" tag;
- cleaned up the whitespace in the patch description.

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
+	return ireg;
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
 
