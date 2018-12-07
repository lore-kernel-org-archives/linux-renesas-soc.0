Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42846 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeLGWGj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Dec 2018 17:06:39 -0500
Date: Fri, 7 Dec 2018 14:06:36 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Message-ID: <20181207220635.v2el5xvwalenm66q@verge.net.au>
References: <cover.1544126077.git.horms+renesas@verge.net.au>
 <595096daf0ac9c1741b6182eb72d636802a21006.1544126077.git.horms+renesas@verge.net.au>
 <CAMuHMdUZSqaW_Vk9GjrtKjRUKdmbFMC5CEswGc_wDWQ-d515hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZSqaW_Vk9GjrtKjRUKdmbFMC5CEswGc_wDWQ-d515hw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 07, 2018 at 09:28:22AM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Dec 6, 2018 at 10:58 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Enable the scu-simple-card which is used by
> > the R-Car E3 (r8a77990) based Ebisu board.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index f88190463481..9d0b42d96f03 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -491,6 +491,7 @@ CONFIG_SND_SOC_RT5514=m
> >  CONFIG_SND_SOC_RT5514_SPI=m
> >  CONFIG_SND_SOC_RT5645=m
> >  CONFIG_SND_SIMPLE_CARD=m
> > +CONFIG_SND_SIMPLE_SCU_CARD=y
> 
> Shouldn't this be "m"?

Thanks Geert,

I'll look into an incremental update for that.

> 
> >  CONFIG_SND_AUDIO_GRAPH_CARD=m
> >  CONFIG_I2C_HID=m
> >  CONFIG_USB=y
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
