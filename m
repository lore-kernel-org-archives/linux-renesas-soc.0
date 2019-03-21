Return-Path: <SRS0=/KHX=RY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0ADC10F00
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 10:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5D263218FD
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Mar 2019 10:47:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jl+zvgkL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfCUKrL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Mar 2019 06:47:11 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:44380 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfCUKrK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Mar 2019 06:47:10 -0400
Received: by mail-ua1-f67.google.com with SMTP id r21so1749658uan.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2019 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uSD/DJC+Lg25Th70y99KRKBF3Lfgu0H7nkYtN7LpnGw=;
        b=Jl+zvgkLCiPbzG77cU94KejWuxFuwGgJXb0uhAwTGzXWv8QGqmEl75jCbnXYXP7nLZ
         RRbMpORlMRXQ8Eur4IbbfsC0bw5+NsQxAra/8VwRkLJxEarPax5P/IBCjJ7s2NvmuTND
         96bWQ86QE0cGzlVHBBmGl3mLpCuZ/62eR/PoJmtyfP1v0vKhrKbDQoSXimoA+n9wuENv
         AOeBJ+ReVP728NpUEpWQtmboZmvQEK2IcqfLTFzJ1iCutfpfpmH6N2/n0LAjLVR2itVT
         lnDlQo+5+WsxOVm7/ICy6Lhahc5eUG9S81wdOhEC5faOsS8n3vvoJRho2WqfeZIxqrCU
         NXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uSD/DJC+Lg25Th70y99KRKBF3Lfgu0H7nkYtN7LpnGw=;
        b=coKM6ijiXnFgQy1WOpAhx9BIK996lur7lOsLeZFwlj6oZfWvgNgW5DZnUSMM1tYjXS
         dmsLXuGAVbAwKLgy34wzX7aSh3+JZpG9XwGW5YyvF4X93Fpjf/33EfWj3VV9GFbvW5K8
         sFJaDbxvjJVaNpHuAJknQC9EImdErtYQQJ3DqbGTWSJmCeaBTlLqRukjAwnsDOslcg9c
         CCCc2Em5QMIZ5571xlvHFeNDFx/zuFVDLIYMX3SuysGdE7Z7WgiMtYJzlg14weZdEzaM
         EiPr2gW+UYpLHalZV3ypZlOghPAwvdlsjmr4FIry7dxv9VsS0idL321YC3XtRPpZlgF2
         70jw==
X-Gm-Message-State: APjAAAVYfDV5q0twDCDzxCfkAHfjlMwVWtx8Uoej3ttoEUkDy8y7G1MC
        tUSGTmlp8k4+J3dfuu93CgN+zAlR6dBzI/2suSsrVQ==
X-Google-Smtp-Source: APXvYqyh3v3QRcsnkm51iwwNDG1IFwggBWifzqR8Uy4UZoAI+d8bcL86reuxvC6aNBKdXYIkFQgBhzYHrT5angDaYjw=
X-Received: by 2002:ab0:719a:: with SMTP id l26mr1368507uao.24.1553165229767;
 Thu, 21 Mar 2019 03:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190319101259.20078-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 21 Mar 2019 11:46:33 +0100
Message-ID: <CAPDyKFoq6tuh5zfcu9J6xiep6GzJ-=_cPxyrMSsKmhEToEkUjA@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: renesas_sdhi: limit block count to 16 bit for
 old revisions
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

On Tue, 19 Mar 2019 at 11:13, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> R-Car Gen2 has two different SDHI incarnations in the same chip. The
> older one does not support the recently introduced 32 bit register
> access to the block count register. Make sure we use this feature only
> after the first known version.
>
> Thanks to the Renesas Testing team for this bug report!
>
> Fixes:5603731a15ef ("mmc: tmio: fix access width of Block Count Register")
> Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for fixes and added a stable tag, thanks!

Kind regards
Uffe


> ---
>
> I could reproduce the issue on my Renesas Lager board (R-Car H2) and this patch
> fixes the issue for me. Still, if we could confirmation from the testing team,
> this would be awesome to have before applying, I think.
>
>  drivers/mmc/host/renesas_sdhi_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 71e13844df6c..8742e27e4e8b 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -641,6 +641,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         struct renesas_sdhi *priv;
>         struct resource *res;
>         int irq, ret, i;
> +       u16 ver;
>
>         of_data = of_device_get_match_data(&pdev->dev);
>
> @@ -773,12 +774,17 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (ret)
>                 goto efree;
>
> +       ver = sd_ctrl_read16(host, CTL_VERSION);
> +       /* GEN2_SDR104 is first known SDHI to use 32bit block count */
> +       if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
> +               mmc_data->max_blk_count = U16_MAX;
> +
>         ret = tmio_mmc_host_probe(host);
>         if (ret < 0)
>                 goto edisclk;
>
>         /* One Gen2 SDHI incarnation does NOT have a CBSY bit */
> -       if (sd_ctrl_read16(host, CTL_VERSION) == SDHI_VER_GEN2_SDR50)
> +       if (ver == SDHI_VER_GEN2_SDR50)
>                 mmc_data->flags &= ~TMIO_MMC_HAVE_CBSY;
>
>         /* Enable tuning iff we have an SCC and a supported mode */
> --
> 2.11.0
>
