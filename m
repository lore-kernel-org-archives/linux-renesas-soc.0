Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:37106 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751781AbeDJJsN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 05:48:13 -0400
MIME-Version: 1.0
In-Reply-To: <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com> <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Apr 2018 11:48:12 +0200
Message-ID: <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for old SoCs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Apr 10, 2018 at 11:38 AM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Early revisions of certain SoCs cannot do multiple DMA RX streams in
> parallel. To avoid data corruption, only allow one DMA RX channel and
> fall back to PIO, if needed.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Nguyen Viet Dung <dung.nguyen.aj@renesas.com>

Thanks for your patch!

> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c

>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  {
> -       if (!soc_device_match(gen3_soc_whitelist))
> +       const struct soc_device_attribute *soc = soc_device_match(gen3_soc_whitelist);
> +
> +       if (!soc)
>                 return -ENODEV;
>
> +       if (soc->data)

This non-NULL check is not really needed.

> +               global_flags |= (unsigned long)soc->data;
> +
>         return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
