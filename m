Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41796 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732952AbeHFWGJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 18:06:09 -0400
MIME-Version: 1.0
References: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se> <20180806191227.28401-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180806191227.28401-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Aug 2018 21:55:17 +0200
Message-ID: <CAMuHMdXstt90ZEOv5nxgDd5jV_Ux98tsYoVr_U=hSZrHYb=dfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: renesas_sdhi: handle 4tap hs400 mode quirk based
 on SoC revision
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Mon, Aug 6, 2018 at 9:43 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Latest datasheet makes it clear that not all ES revisions of the H3 and
> M3-W have the 4-tap HS400 mode quirk, currently the quirk is set
> unconditionally for these two SoCs. Prepare to handle the quirk based on
> SoC revision instead of compatibility value by using soc_device_match()
> and set the TMIO_MMC_HAVE_4TAP_HS400 flag explicitly.

Thanks for your patch!

> The reason for adding a new quirks struct instead of just a flag is that
> looking ahead it seems more quirks needs to be handled in a SoC revision
> basis.

Do you expect to add a lot? If yes...

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -569,6 +588,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>         of_data = of_device_get_match_data(&pdev->dev);
>
> +       attr = soc_device_match(sdhi_quirks_match);
> +       if (attr)
> +               quirks = attr->data;

... you may consider just storing a plain struct renesas_sdhi_of_data in
the sdhi_quirks_match[] table.

> +
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res)
>                 return -EINVAL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
