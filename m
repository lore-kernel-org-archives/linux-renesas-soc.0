Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:41652 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeKEVkl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Nov 2018 16:40:41 -0500
MIME-Version: 1.0
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se> <20181031231340.1958-4-niklas.soderlund@ragnatech.se>
In-Reply-To: <20181031231340.1958-4-niklas.soderlund@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Nov 2018 13:20:58 +0100
Message-ID: <CAMuHMdXsWRXH=HkDJ1+7QCsH0ey3CmTOX90NxfvP2VspVaUvMQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: disable HS400 on H3 ES1.x and
 M3-W ES1.x
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

Thanks for your patch!

On Thu, Nov 1, 2018 at 12:15 AM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> The Renesas BSP confirms that H3 ES1.x and M3-W ES1.x do not properly

M3-W ES1.[012] (also in the subject)? (ES1.2 is indistinguishable from ES1.1)
Or does this apply to M3-W ES1.3, too?

> support HS400. Add a quirk to indicate this and disable HS400 in the MMC
> capabilities if the quirk is set.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> @@ -607,15 +608,21 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>         renesas_sdhi_sdbuf_width(host, enable ? width : 16);
>  }
>
> -static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w = {
> +static const struct renesas_sdhi_quirks sdhi_quirks_h3_m3w_es1 = {
> +       .hs400_disabled = true,
> +       .hs400_4taps = true,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_h3_es2 = {
> +       .hs400_disabled = false,
>         .hs400_4taps = true,
>  };
>
>  static const struct soc_device_attribute sdhi_quirks_match[]  = {
> -       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w },
> -       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_m3w },
> -       { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w },
> -       { .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w },
> +       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_h3_m3w_es1 },
> +       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_h3_es2 },
> +       { .soc_id = "r8a7796", .revision = "ES1.0", .data = &sdhi_quirks_h3_m3w_es1 },
> +       { .soc_id = "r8a7796", .revision = "ES1.1", .data = &sdhi_quirks_h3_m3w_es1 },
>         { /* Sentinel. */ },
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
