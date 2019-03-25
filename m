Return-Path: <SRS0=tR/q=R4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F72C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:27:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 372E62070D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Mar 2019 13:27:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rW2PsJox"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbfCYN1G (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Mar 2019 09:27:06 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:39917 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfCYN1G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Mar 2019 09:27:06 -0400
Received: by mail-ua1-f65.google.com with SMTP id m11so2965628uad.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2019 06:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O6pQLZfUNHgUzWwnSv9gKmNK9WPnn5Ru2ze68uuU/DU=;
        b=rW2PsJoxEX3Rygejrbo2gLc0QMVLUFXI4n+XrfS0h/mDlcRtyOzepqc6gxVA1D8Rj+
         8FTKMPz+n/fLvXejDcI8ykUcoR7tvCXMMC4iQD6wQvl94t6lJGkT37dcZP4ViH9yJDfU
         5yWh/MTdcUCXnjnWjW3KqpZIe7Qf4sfc9XPNrke40yEO2jaUDFLzS//EgZKAGFGdRICH
         rekFgvYIRivOrTMHXJwcfxDLRDvsmiZVToz60IN/0d8n6Sl4Cm7aY4hnTtCUR/cJC7Sh
         /2WtmQ+EJcuRem7ELO/+WB85aDjrY6ABEqA1Ej5OqXNjveCk7/TnxgzPUj0xbP4V0WU8
         9Obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O6pQLZfUNHgUzWwnSv9gKmNK9WPnn5Ru2ze68uuU/DU=;
        b=eJikOW6nEIL+eqeTY8P51KChlKJpwuem4Q6lP3XRibZEi3ZfLUgGHcGWF87mf9tHzN
         YpSksQWfTN0f0dQYiVBq//r8J4xNJIOtiWEc8suEG7JHhOahmR6XaLVu0C7e4XzBW/Jc
         fB9FIL0YzSdPrw49tzPPMI8pqbGff5oqi5mugtLxPHCbZiVQKrYRHHRlBdgDVhHzsmmP
         oX4S3/yPpj8nOiUoylj+ElZKQ7vmp9T+SrkCylo1vvHYBEfbTD3/DxRLn3qWf+5P4ytt
         lBsNvXJ8ZbTidfa7Tf8gs8zyhyKGhEsD487CvulC0KGldO1jDw3ybRI6r68c13e8uaUb
         4Ltw==
X-Gm-Message-State: APjAAAVWISCNnesx9qfmRggKPYPoHSrV1Te2mZVSajXc4f2F0m2ZY/sh
        kFt6eOYtAN+k/5o6Xv+HRI4o9lbM3fjQq57hGQtKLA==
X-Google-Smtp-Source: APXvYqxWYepJXjWd8fEln6m4SA1SjmH3Xx/pAr86yr9ZxboIcpAuJxLEGrcuUS5IgwKRyjYjvgCUCwYVjbbA9siTdDA=
X-Received: by 2002:ab0:24d:: with SMTP id 71mr13985396uas.15.1553520425026;
 Mon, 25 Mar 2019 06:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190319103417.28407-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 25 Mar 2019 14:26:29 +0100
Message-ID: <CAPDyKFrMqwSqyTUG=_qq9FkpZwx+iPNcBzS_o9HHEG2cuwcKGQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: set CBSY flag before probing TMIO host
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 Mar 2019 at 11:34, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The CBSY flag should be proper before calling tmio_mmc_host_probe()
> because this function will already use write16 which checks this bit.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> This patch depends on "[RFT] mmc: renesas_sdhi: limit block count to 16 bit for
> old revisions" [1]. This one, however, is not backed by a bug report but just
> found by code review. I wouldn't suggest stable here because the non-working
> case is probably more on the academic side (unless I overlooked something).
> Yet, the code becomes easier to read because it is the flow one would expect.
> So, I post this already for discussion. We need to wait for the dependency
> first, of course.
>
> Tested on the SDR50 only SDHI of a Renesas Lager board (R-Car H2). No
> regressions encountered: still probes fine and works at the same speed.
>
> [1] https://patchwork.kernel.org/patch/10859279/
>
>  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 8742e27e4e8b..5885f3fb0b2f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -779,14 +779,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
>                 mmc_data->max_blk_count = U16_MAX;
>
> -       ret = tmio_mmc_host_probe(host);
> -       if (ret < 0)
> -               goto edisclk;
> -
>         /* One Gen2 SDHI incarnation does NOT have a CBSY bit */
>         if (ver == SDHI_VER_GEN2_SDR50)
>                 mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
>
> +       ret = tmio_mmc_host_probe(host);
> +       if (ret < 0)
> +               goto edisclk;
> +
>         /* Enable tuning iff we have an SCC and a supported mode */
>         if (of_data && of_data->scc_offset &&
>             (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
> --
> 2.11.0
>
