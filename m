Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f53.google.com ([209.85.222.53]:38386 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbeIMNqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 09:46:43 -0400
MIME-Version: 1.0
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com> <87in3at0mv.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87in3at0mv.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Sep 2018 10:38:03 +0200
Message-ID: <CAMuHMdWQ4=A6jptiGT4jsyR1H0+Z4sPBdJwOAwGc7GVPw4xAAQ@mail.gmail.com>
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

On Thu, Sep 13, 2018 at 7:48 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > -----------------------------------------------------
> > > commit ac6bbf0cdf4206c517ac9789814c23e372ebce4d
> > > Author: Rob Herring <robh@kernel.org>
> > > Date:   Mon Jul 9 09:41:52 2018 -0600
> > >
> > >     iommu: Remove IOMMU_OF_DECLARE
> > >
> > >     Now that we use the driver core to stop deferred probe for missing
> > >     drivers, IOMMU_OF_DECLARE can be removed.
> > >
> > >     This is slightly less optimal than having a list of built-in drivers in
> > >     that we'll now defer probe twice before giving up. This shouldn't have a
> > >     significant impact on boot times as past discussions about deferred
> > >     probe have given no evidence of deferred probe having a substantial
> > >     impact.
> > >         ...
> > > -----------------------------------------------------
> (snip)
> > I assume you wrote commit 6c92d5a2744e2761 ("ASoC: rsnd: don't fallback
> > to PIO mode when -EPROBE_DEFER") to work around this?
>
> Yes, it is work around for it.
>
> > While this got rid of the error messages, and postpones sound initialization
> > until the audio DMAC is available, it does mean that the driver will _never_
> > fall back to PIO.
> >
> > I.e. if CONFIG_RCAR_DMAC=n, audio will fail to probe instead of falling
> > back to PIO.
>
> If I focus only for sound here, the purpose of PIO mode is
> checking basic HW connection, clock settings, etc.
> Without DMAC support, it can't use many sound features.
> And PIO mode is supporting "SSI" only.
>
> If DT has SRC/CTU/DVC settings for sound,
> it needs DMA support anyway.
>
> &rcar_sound {
>         ...
>         ports {
>                 rsnd_port0: port@0 {
>                         rsnd_endpoint0: endpoint {
>                                 ...
> =>                              playback = <&ssi0 &src0 &dvc0>;
>                         };
>                 };
>         };
> };
>
> Before 6c92d5a2744e2761 patch, driver will forcibly ignore
> non-SSI modules, and try to use PIO mode.
> I'm not sure it is "kindly support" or "overkill support".
>
> After this patch, it needs DMA, otherwise, probe will be failed.
> DT shouldn't have non-SSI modules if you want to use PIO mode.
>
>         + /* use PIO mode */
>         - playback = <&ssi0 &src0 &dvc0>;
>         + playback = <&ssi0>;
>

OK, so falling back to PIO was really a "best effort" fallback, and the user
should really enable DMA?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
