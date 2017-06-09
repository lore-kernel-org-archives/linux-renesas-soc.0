Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:35942 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751658AbdFIHjv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Jun 2017 03:39:51 -0400
MIME-Version: 1.0
In-Reply-To: <1496927595-19521-5-git-send-email-horms+renesas@verge.net.au>
References: <1496927595-19521-1-git-send-email-horms+renesas@verge.net.au> <1496927595-19521-5-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2017 09:39:49 +0200
Message-ID: <CAMuHMdU8fqoi-zh4OKC_40xH3pZy+w_qDjtxm2pRLUsJieFmgw@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/5] mmc: renesas_sdhi: add support for R-Car Gen3
 SDHI DMAC
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Jun 8, 2017 at 3:13 PM, Simon Horman <horms+renesas@verge.net.au> wrote:
> R-Car Gen3 has a dedicated DMA controller for SDHI module. Since
> the DMAC is in a part of SDHI module and is not suitable as dmaengine,

the DMAC is part of the SDHI module?

> this patch adds a different code as tmio_mmc_dma_gen3.c.

adds different code?

> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -575,10 +575,27 @@ config MMC_SDHI
>         depends on SUPERH || ARM || ARM64
>         depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
>         select MMC_TMIO_CORE
> +       select MMC_SDHI_SYS_DMAC if (SUPERH || ARM)
> +       select MMC_SDHI_INTERNAL_DMAC if ARM64
>         help
>           This provides support for the SDHI SD/SDIO controller found in
>           Renesas SuperH, ARM and ARM64 based SoCs
>
> +config MMC_SDHI_SYS_DMAC
> +       tristate "DMA support use of SYS DMAC with SDHI SD/SDIO controller"

DMA support for SYS_DMAC?


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
