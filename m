Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:34226 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbeIKOma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 10:42:30 -0400
MIME-Version: 1.0
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Sep 2018 11:43:47 +0200
Message-ID: <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
Subject: Re: of_dma_request_slave_channel() failed ?
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

CC asoc, dma, iommu

On Tue, Sep 4, 2018 at 8:06 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> Hi Renesas ML
> Cc Rob
>
> I noticed that Sound driver is using PIO mode
> on latest kernel.
>
>         ...
>         rcar_sound ec500000.sound: src[0] : probe error -11
>         rcar_sound ec500000.sound: ssi[0] fallback to PIO mode
>         rcar_sound ec500000.sound: src[1] : probe error -11
>         rcar_sound ec500000.sound: ssi[1] fallback to PIO mode
>         rcar_sound ec500000.sound: ssi[2] : probe error -11
>         rcar_sound ec500000.sound: ssi[2] fallback to PIO mode
>         rcar_sound ec500000.sound: ssi[3] : probe error -11
>         rcar_sound ec500000.sound: ssi[3] fallback to PIO mode
>         rcar_sound ec500000.sound: probed
>         ...
>
> Sound can use DMA mode and PIO mode.
> It automatically fallbacks to PIO mode if it can't use DMA.
>
> I bisected this issue, and found the 1st bad commit
>
> -----------------------------------------------------
> commit ac6bbf0cdf4206c517ac9789814c23e372ebce4d
> Author: Rob Herring <robh@kernel.org>
> Date:   Mon Jul 9 09:41:52 2018 -0600
>
>     iommu: Remove IOMMU_OF_DECLARE
>
>     Now that we use the driver core to stop deferred probe for missing
>     drivers, IOMMU_OF_DECLARE can be removed.
>
>     This is slightly less optimal than having a list of built-in drivers in
>     that we'll now defer probe twice before giving up. This shouldn't have a
>     significant impact on boot times as past discussions about deferred
>     probe have given no evidence of deferred probe having a substantial
>     impact.
>         ...
> -----------------------------------------------------
>
> In more detail, it seems it can't find DMA controller,
> and of_dma_request_slave_channel() returns
> -EPROBE_DEFER from this commit.
>
> struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
>                                               const char *name)
> {
>         ...
>                 ofdma = of_dma_find_controller(&dma_spec);
>
>                 if (ofdma) {
>                         chan = ofdma->of_dma_xlate(&dma_spec, ofdma);
>                 } else {
> =>                      ret_no_channel = -EPROBE_DEFER;
>                         chan = NULL;
>                 }
>         ...
> =>      return ERR_PTR(ret_no_channel);
> }
>
> Is this known issue ?
> Or sound shouldn't fallbacks to PIO mode ?

I assume you wrote commit 6c92d5a2744e2761 ("ASoC: rsnd: don't fallback
to PIO mode when -EPROBE_DEFER") to work around this?

While this got rid of the error messages, and postpones sound initialization
until the audio DMAC is available, it does mean that the driver will _never_
fall back to PIO.

I.e. if CONFIG_RCAR_DMAC=n, audio will fail to probe instead of falling
back to PIO.

With CONFIG_RCAR_DMAC=y:

    rcar-dmac e6700000.dma-controller: ignoring dependency for device,
assuming no driver
    rcar-dmac e7300000.dma-controller: ignoring dependency for device,
assuming no driver
    rcar-dmac e7310000.dma-controller: ignoring dependency for device,
assuming no driver
    rcar-dmac ec700000.dma-controller: ignoring dependency for device,
assuming no driver
    rcar-dmac ec720000.dma-controller: ignoring dependency for device,
assuming no driver

So it seems the audio DMAC is deferred a second time, before the iommu driver
probed.

    subsys_initcall(ipmmu_init); calls platform_driver_register
    module_platform_driver(rcar_dmac_driver);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
