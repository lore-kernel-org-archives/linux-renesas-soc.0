Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46571 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeKEVhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 16:37:04 -0500
MIME-Version: 1.0
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se> <20181031231340.1958-2-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031231340.1958-2-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 13:17:22 +0100
Message-ID: <CAMuHMdUH=gc4TCzaGKuk6J7sA7W5m+Ek_8O=s8z+vtz2pAqybg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mmc: renesas_sdhi: handle 4tap hs400 mode quirk
 based on SoC revision
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

On Thu, Nov 1, 2018 at 12:15 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> Latest datasheet makes it clear that not all ES revisions of the H3 and
> M3-W have the 4-tap HS400 mode quirk, currently the quirk is set
> unconditionally for these two SoCs. Prepare to handle the quirk based on
> SoC revision instead of compatibility value by using soc_device_match()
> and set the TMIO_MMC_HAVE_4TAP_HS400 flag explicitly.
>
> The reason for adding a new quirks struct instead of just a flag is that
> looking ahead it seems more quirks needs to be handled in a SoC revision
> basis.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

> @@ -602,11 +607,25 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>         renesas_sdhi_sdbuf_width(host, enable ? width : 16);
>  }
>
> +static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w = {

I know this variable is renamed later, but sdhi_quirks_h3_m3w gives the
impression it applies to all H3/M3-W variants.
What about sdhi_quirks_4tap instead?

> +       .hs400_4taps = true,
> +};
> +
> +static const struct soc_device_attribute sdhi_quirks_match[]  = {
> +       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w },
> +       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_m3w },
> +       { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w },
> +       { .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w },
> +       { /* Sentinel. */ },
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
