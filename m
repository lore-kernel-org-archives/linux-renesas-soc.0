Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:37908 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbeINMJs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 08:09:48 -0400
MIME-Version: 1.0
References: <87efe9ls4n.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdVkQ8vio3O7VWyoWnVrY8Y8_YRWxQeXDwJ48iTxzujWdA@mail.gmail.com>
 <87in3at0mv.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdWQ4=A6jptiGT4jsyR1H0+Z4sPBdJwOAwGc7GVPw4xAAQ@mail.gmail.com>
 <87lg84ucrr.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lg84ucrr.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Sep 2018 08:56:31 +0200
Message-ID: <CAMuHMdWHGE0R_qeKCstcCiSc6YYC8GAqX1ZcsyafWP=DmTJgLA@mail.gmail.com>
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

On Fri, Sep 14, 2018 at 2:53 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > Before 6c92d5a2744e2761 patch, driver will forcibly ignore
> > > non-SSI modules, and try to use PIO mode.
> > > I'm not sure it is "kindly support" or "overkill support".
> > >
> > > After this patch, it needs DMA, otherwise, probe will be failed.
> > > DT shouldn't have non-SSI modules if you want to use PIO mode.
> > >
> > >         + /* use PIO mode */
> > >         - playback = <&ssi0 &src0 &dvc0>;
> > >         + playback = <&ssi0>;
> >
> > OK, so falling back to PIO was really a "best effort" fallback, and the user
> > should really enable DMA?
>
> Yeah, I'm thinking this is better.
> PIO fallback is of course "nice to have" if possible.
> But, because of this new iommu patch, keeping this feature
> needs "big complicated patch", and we can get "small effect" I think.
> Thus, I think this is the time to remove this feature.
> Can you agree ?

You're the rcar-sound expert ;-)
If you think there's not much value in keeping PIO fallback, it can be
removed.

We can change behavior once these dependency issues have been resolved
in a generic way.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
