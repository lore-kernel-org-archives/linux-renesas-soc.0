Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:36096 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751511AbdFIHes (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 03:34:48 -0400
MIME-Version: 1.0
In-Reply-To: <1496927368-18897-5-git-send-email-horms+renesas@verge.net.au>
References: <1496927368-18897-1-git-send-email-horms+renesas@verge.net.au> <1496927368-18897-5-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2017 09:34:46 +0200
Message-ID: <CAMuHMdWrpsRDDqzrxJjt3_V0gjTo9fQiFGRzo=crdaeeHKX2uw@mail.gmail.com>
Subject: Re: [PATCH/RFC 3/5] mmc: sh_mobile_sdhi: add some SoC specific data
 for R-Car Gen3
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Jun 8, 2017 at 3:09 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> To avoid complicate code in own dma code for gen3, this patch
> adds set max_segs to 1. Then, the tmio driver will get requests
> as sg_len = 1 only.

The above doesn't seem to match with the actual code changes?

> In the performance point of view, the CONFIG_MMC_BLOCK_BOUNCE should
> be set. Otherwise, mmc block layer will set 4-kbyte each as a request.

FWIW, CONFIG_MMC_BLOCK_BOUNCE is no more in -next.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Ai Kyuse <ai.kyuse.uw@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/mmc/host/renesas_sdhi.h      | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index eb3ea15ff92d..6f7233fe32a2 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -31,6 +31,8 @@ struct renesas_sdhi_of_data {
>         int scc_offset;
>         struct renesas_sdhi_scc *taps;
>         int taps_num;
> +       unsigned int max_blk_count;
> +       unsigned short max_segs;
>  };
>
>  int renesas_sdhi_probe(struct platform_device *pdev,
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 82150a966391..294bc9705c5f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -522,6 +522,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 mmc_data->capabilities |= of_data->capabilities;
>                 mmc_data->capabilities2 |= of_data->capabilities2;
>                 mmc_data->dma_rx_offset = of_data->dma_rx_offset;
> +               mmc_data->max_blk_count = of_data->max_blk_count;
> +               mmc_data->max_segs = of_data->max_segs;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
