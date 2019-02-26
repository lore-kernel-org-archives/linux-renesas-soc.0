Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1E8C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF38E213A2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v9KjSuhD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfBZITE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 03:19:04 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:37405 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfBZITE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 03:19:04 -0500
Received: by mail-ua1-f68.google.com with SMTP id v26so11059671uap.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Feb 2019 00:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QEpbqr3ypimrveWtf2rprUK2vXmOlNJv+TQC0TsPyeU=;
        b=v9KjSuhDYV7h/5oAA+hRyIIJAJKw/ghXhDjniSGr2bmeuMZbC2OCtWAGBeuGTEOvVn
         JWSuZIe1QtUW2J15mDZHb4onKcHkx9K3FfmA5Nwji7+X1QC/HOmvaAM9oG7EQyy3xtrv
         WSNQ0fZBw2zBHWbjUjumCHdXedbCa1yMixHWqYOTfIqpaJdCfO2aYi/pV3d1i9zULXht
         TeiO49C3sCA/7cfJFXfxvqtxZPVG9DzgFjrMxzl6cUkdn7M0PIE+SaHhBmi19Fov0IZh
         2HtjkFJ25Bf8kCtGn3aJ1dPOzbl5sA/j1ylPGC7Np7JPT3zoTlpbtEwEeAr5HT/uR209
         bG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QEpbqr3ypimrveWtf2rprUK2vXmOlNJv+TQC0TsPyeU=;
        b=pvx9QnuFIknaqwaPZgTjKBnJJSXvNezAodwGjHM2woyPozB0OaENIo3W16FfawUML1
         Ol1IWksYIvPJ7DDwtZREwtWYfi+PFcUNL//Rbucy//HbjbE04zPu2wP+1piu975Z6SH8
         yvbkLqhzQSOIt51pW1Bh1pXBuP5kf/PV/pOMrG1SDbMWsOPc7Bs76QhcibE4/BuSjsWM
         qS6hiQNn7cUtNnnGIGGvFPBEnFEXMTsYtyEHWW5BLEH8ForZSd35IdXKA2NHaG8V6nQk
         CJWyPXjE22TfDB+eChAKsQXV+8FcYik6y1gCd63XlvtPuH3Qeguqkk5yHQ80uutZ67Kb
         Elnw==
X-Gm-Message-State: AHQUAuYqaHXugASEzoAb1WOV8oNrVmQWEloT71MajV95cD7Sl168PjKL
        aof5Gqq0Tf0q1PucujJPLCvBEcm8HARJ/6m0ep8bzw==
X-Google-Smtp-Source: AHgI3IamEPIMSDJ44tsZeCR7Ob5M6lWbrtC3zQ7fRYKAe2aivaPZ7DeHH3BDmDhPV5bt4VDggbpwV2TSdFN/xyFUoGI=
X-Received: by 2002:a9f:3707:: with SMTP id z7mr781995uad.25.1551169142847;
 Tue, 26 Feb 2019 00:19:02 -0800 (PST)
MIME-Version: 1.0
References: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
In-Reply-To: <7e293159-0ae3-82fb-2723-04e91d652906@cogentembedded.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 26 Feb 2019 09:18:26 +0100
Message-ID: <CAPDyKFra3BYg-H63hUZyALnCJnXdDP8rVKK=EORz2SiCOKgckA@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: tmio_mmc_core: don't claim spurious interrupts
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 18 Feb 2019 at 18:45, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
>
> I have encountered an interrupt storm during the eMMC chip probing (and
> the chip finally didn't get detected).  It turned out that U-Boot left
> the DMAC interrupts enabled while the Linux driver  didn't use those.
> The SDHI driver's interrupt handler somehow assumes that, even if an
> SDIO interrupt didn't happen, it should return IRQ_HANDLED.  I think
> that if none of the enabled interrupts happened and got handled, we
> should return IRQ_NONE -- that way the kernel IRQ code recoginizes
> a spurious interrupt and masks it off pretty quickly...
>
> Fixes: 7729c7a232a9 ("mmc: tmio: Provide separate interrupt handlers")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


>
> ---
> The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.
>
> Changes in version 3:
> - simplified the final *return* statement in __tmio_mmc_sdio_irq();
> - added the "Fixes:" tag;
> - cleaned up the whitespace in the patch description.
>
> Changes in version 2:
> - refreshed the patch;
> - fixed an article and whitespace in the patch description.
>
>  drivers/mmc/host/tmio_mmc_core.c |   11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Index: mmc/drivers/mmc/host/tmio_mmc_core.c
> ===================================================================
> --- mmc.orig/drivers/mmc/host/tmio_mmc_core.c
> +++ mmc/drivers/mmc/host/tmio_mmc_core.c
> @@ -629,7 +629,7 @@ static bool __tmio_mmc_sdcard_irq(struct
>         return false;
>  }
>
> -static void __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
> +static bool __tmio_mmc_sdio_irq(struct tmio_mmc_host *host)
>  {
>         struct mmc_host *mmc = host->mmc;
>         struct tmio_mmc_data *pdata = host->pdata;
> @@ -637,7 +637,7 @@ static void __tmio_mmc_sdio_irq(struct t
>         unsigned int sdio_status;
>
>         if (!(pdata->flags & TMIO_MMC_SDIO_IRQ))
> -               return;
> +               return false;
>
>         status = sd_ctrl_read16(host, CTL_SDIO_STATUS);
>         ireg = status & TMIO_SDIO_MASK_ALL & ~host->sdio_irq_mask;
> @@ -650,6 +650,8 @@ static void __tmio_mmc_sdio_irq(struct t
>
>         if (mmc->caps & MMC_CAP_SDIO_IRQ && ireg & TMIO_SDIO_STAT_IOIRQ)
>                 mmc_signal_sdio_irq(mmc);
> +
> +       return ireg;
>  }
>
>  irqreturn_t tmio_mmc_irq(int irq, void *devid)
> @@ -668,9 +670,10 @@ irqreturn_t tmio_mmc_irq(int irq, void *
>         if (__tmio_mmc_sdcard_irq(host, ireg, status))
>                 return IRQ_HANDLED;
>
> -       __tmio_mmc_sdio_irq(host);
> +       if (__tmio_mmc_sdio_irq(host))
> +               return IRQ_HANDLED;
>
> -       return IRQ_HANDLED;
> +       return IRQ_NONE;
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_irq);
>
