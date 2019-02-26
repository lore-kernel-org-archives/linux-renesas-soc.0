Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C40C43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77001213A2
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 08:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fpsE84bp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfBZIS7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 03:18:59 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:38994 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfBZIS6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 03:18:58 -0500
Received: by mail-vk1-f195.google.com with SMTP id i68so2783815vke.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Feb 2019 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ImJo8K9bxXpGG92iI5RaZts8SD+Kh0cuyAJTKRwprWk=;
        b=fpsE84bpIJbC4fIaH9pAgYqO6GrvY5DvBq30a2sap+RYtSUlqXILVft4kHy/XesxnA
         mLqqrwh9F/6ZDJ/Wx28Q0LiEPLqP8LKHzDuClm+D5SOjRzp22PkAqgzXihjIlVSY9nCi
         qbVEZsTwwo7HBX9NsphvPXRWEIePB3w58vmnIbowT0woFTdPsiYg1cnH6bF1TBFhJXyD
         cpdNLyvlwuW26imPJ/SrF1uQoCYs1XivMdUVypKoXfRqk1fQ7yslREMI7jm3C0RzvP5K
         3lZesRzD2G/RKv5yuE2vPWQONpGWn/l4iCzMiDb5FkT87bp+BX2kwYEXePQa179tXirQ
         aZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ImJo8K9bxXpGG92iI5RaZts8SD+Kh0cuyAJTKRwprWk=;
        b=dDHGNl3DnCest2IDmjXIos8TNu4urm8bcs9mVU7LFUfdtQ0e2cxAILFwWg1eivknrP
         3ro0Dxlaqieyl0RB3NL65En1vRIHlgL0PQ3glL/qlZkKs4nyJSTSr1SwcY5oOf196JzU
         m43F8v3hG+m+sxvW+xzuojXKc9c8lvNg9cFqiYJcdIvHr0hjGCCWI+NQtI/z+kgmzgtM
         j2cU8iHQHFcEFSW83GYwif+m0xGboSvjs3UwODiCQqsWJZhO1XmoUOIqbkSRWJmiAhVw
         ODkYmn07lW/0sdJqt2xCw9hljIJz34SGLP9BaBZ8so6HCajBOpF8T4966W4bBynQwfzp
         Woyw==
X-Gm-Message-State: AHQUAuYZB/4UMz9C8C+Qg6ejQkMgQguQ5ykOC3wg/xUIOP9juXRdqZNQ
        Eaft6RGRUuiIHarWIxMDaRCSfLq1oLxoofwUbrarQw==
X-Google-Smtp-Source: AHgI3IYpHVCU1Vpfg6kwZrzijKy49jcZUpwjTtZShFo/XkWATIm6EUNBo8FP84+5wLI4RQ4gvaRXKJQTxXlZa1Pdq3E=
X-Received: by 2002:a1f:a5d3:: with SMTP id o202mr11973368vke.40.1551169137477;
 Tue, 26 Feb 2019 00:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190208193002.16915-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 26 Feb 2019 09:18:20 +0100
Message-ID: <CAPDyKFrLqubMXGJjw3vfZZTiHPFn5FHuouhaSKmYRSfa9b95fQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Change HW adjustment register
 according to speed mode
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Marek Vasut <marek.vasut@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 8 Feb 2019 at 20:30, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> SCC is used for SDR104/HS200/HS400. We need to change SCC_DT2FF
> according to the mode. If it is inappropriate, CRC error tends to occur.
>
> This adds variable "tap_hs400" for HS400 mode and configures SCC_DT2FF
> as needed.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: rebased to upstream and updated commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> I don't have a testcase currently, so I don't think this is stable material. If
> this ever changes, we can have it added to stable later. But I am open for
> other opinions here. Tested on Salvator-XS with Renesas R-Car M3N, no
> regressions in both detecting HS400 and transferring large files.
>
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 ++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 1 +
>  3 files changed, 11 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index da1e49c45bec..8394a7bb1fc1 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -15,6 +15,7 @@
>  struct renesas_sdhi_scc {
>         unsigned long clk_rate; /* clock rate for SDR104 */
>         u32 tap;                /* sampling clock position for SDR104 */
> +       u32 tap_hs400;          /* sampling clock position for HS400 */
>  };
>
>  struct renesas_sdhi_of_data {
> @@ -49,6 +50,7 @@ struct renesas_sdhi {
>         struct pinctrl_state *pins_default, *pins_uhs;
>         void __iomem *scc_ctl;
>         u32 scc_tappos;
> +       u32 scc_tappos_hs400;
>  };
>
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 7e2a75c4f36f..71e13844df6c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -337,6 +337,10 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
>         /* Set HS400 mode */
>         sd_ctrl_write16(host, CTL_SDIF_MODE, 0x0001 |
>                         sd_ctrl_read16(host, CTL_SDIF_MODE));
> +
> +       sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF,
> +                      priv->scc_tappos_hs400);
> +
>         sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
>                        (SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
>                         SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) |
> @@ -396,6 +400,9 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
>         /* Reset HS400 mode */
>         sd_ctrl_write16(host, CTL_SDIF_MODE, ~0x0001 &
>                         sd_ctrl_read16(host, CTL_SDIF_MODE));
> +
> +       sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_DT2FF, priv->scc_tappos);
> +
>         sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TMPPORT2,
>                        ~(SH_MOBILE_SDHI_SCC_TMPPORT2_HS400EN |
>                          SH_MOBILE_SDHI_SCC_TMPPORT2_HS400OSEL) &
> @@ -786,6 +793,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                         if (taps[i].clk_rate == 0 ||
>                             taps[i].clk_rate == host->mmc->f_max) {
>                                 priv->scc_tappos = taps->tap;
> +                               priv->scc_tappos_hs400 = taps->tap_hs400;
>                                 hit = true;
>                                 break;
>                         }
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 92c9b15252da..9dfafa2a90a3 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -81,6 +81,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         {
>                 .clk_rate = 0,
>                 .tap = 0x00000300,
> +               .tap_hs400 = 0x00000704,
>         },
>  };
>
> --
> 2.11.0
>
