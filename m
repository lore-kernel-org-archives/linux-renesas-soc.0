Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:46456 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbeHaOcI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 10:32:08 -0400
MIME-Version: 1.0
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se> <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
 <20180831094439.ldljak3bnmehh6vs@ninjato>
In-Reply-To: <20180831094439.ldljak3bnmehh6vs@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Aug 2018 12:25:07 +0200
Message-ID: <CAMuHMdX9p2sgQhpgbLmW4KGRyxEsbXD4=OEfm3QfM-cyLKK84A@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
To: Wolfram Sang <wsa@the-dreams.de>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Aug 31, 2018 at 11:44 AM Wolfram Sang <wsa@the-dreams.de> wrote:
> > As a comment in the other thread said you should not set it multiple times,
> > probably the best solution is to:
> >   (a) check if dev->dma_parms is already set, and if not:
> >       (b) allocate using plain kzalloc() (with a comment why!),
> >       (c) not free the memory nor reset dev->dma_parms (with a comment why!).
>
> Quite clumsy if done per driver, or?

Yes it is. As for other DMA parameters (e.g. DMA mask), it's a property of
the device and/or platform. So (in theory) it should be set up that way...

> If this is the intended behaviour, then there is something to improve
> with the dma_params API, or? If something which is meant to have a
> lifecycle same as the device but needs to get set during probe/remove
> lifecycle, this calls for at least a helper function which hides all
> these details?

Promote drivers/gpu/drm/exynos/exynos_drm_iommu.c:configure_dma_max_seg_size()
to a generic helper?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
