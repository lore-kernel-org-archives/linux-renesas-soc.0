Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42842 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbeIMQNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 12:13:52 -0400
MIME-Version: 1.0
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
 <20180912155057.GJ6062@sirena.org.uk> <CAMuHMdVnoLTYEvtJ3AY0hFxGqtw-kVE0vWtA74ewJkxkirogYA@mail.gmail.com>
 <2b5e7838-5c5f-b993-1a9c-38208c2b4d24@arm.com>
In-Reply-To: <2b5e7838-5c5f-b993-1a9c-38208c2b4d24@arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Sep 2018 13:04:41 +0200
Message-ID: <CAMuHMdUygpJTcumhsZPbrssX8TN2HqkdvEgVSv2b9XUU6o315A@mail.gmail.com>
Subject: Re: of_dma_request_slave_channel() failed ?
To: Robin Murphy <robin.murphy@arm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Vinod <vkoul@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        dmaengine@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Robin,

On Thu, Sep 13, 2018 at 12:12 PM Robin Murphy <robin.murphy@arm.com> wrote:
> On 13/09/18 10:00, Geert Uytterhoeven wrote:
> [...]
> > The main issue is that if of_dma_find_controller() fails, a DMA slave driver
> > cannot distinguish between dmac not yet probed successfully, and dmac
> > driver not present.
>
> ...which is in fact the exact same problem that the IOMMU code has -
> might it make sense to give of_dma_request_slave_channel() similar
> (optional?) driver_deferred_probe_check_state() logic, i.e. "if my DMAC
> driver's not shown up by this point, assume it's not built-in and go on
> without it". Of course it is somewhat easier for IOMMU drivers as
> there's zero chance of those popping up as modules later on.

It may solve the issue in some cases.  But only if the dmac is reprobed
before the DMA slave driver, which is not guaranteed.

BTW, it seems e.g. i2c and serial suffer from the same problem, and fall
back to PIO. However, these drivers try to obtain the DMA channel when
used, not during probe, so they start using DMA after the dmac has been
probed successfully.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
