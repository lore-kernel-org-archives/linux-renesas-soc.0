Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33747 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753049AbeGFHHU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 03:07:20 -0400
MIME-Version: 1.0
References: <20180705141841.11121-1-niklas.soderlund+renesas@ragnatech.se> <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20180705141841.11121-4-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jul 2018 09:07:08 +0200
Message-ID: <CAMuHMdWxCsfq+3xHmgcjUymDvCO53cYP8oC6igKjVYN2RBTNRg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mmc: renesas_sdhi: Fix sampling clock position selecting
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 5, 2018 at 4:20 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>
> When tuning each tap is issued CMD19 twice and the result of both runs
> recorded in host->taps. If the result is different between the two runs
> the wrong sampling clock position was selected. Fix this by merging the
> two runs and only keep the result for each tap if it was good in both
> sets.
>
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -384,6 +384,19 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>         /* Clear SCC_RVSREQ */
>         sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
>
> +       /*
> +        * When tuning CMD19 is issued twice for each tap, merge the
> +        * result requiring the tap to be good in both runs before
> +        * consider it for tuning selection.

considering


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
