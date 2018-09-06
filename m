Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58835 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbeIFN7p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 09:59:45 -0400
Date: Thu, 6 Sep 2018 11:25:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add all MSIOF device
 nodes
Message-ID: <20180906092507.lz2n3xw7ksbgpges@verge.net.au>
References: <1536092561-6048-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdWjLYhMDz6YuU_Y0vHtWBgSgt5BgTz0dDq86bqR8sX-1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWjLYhMDz6YuU_Y0vHtWBgSgt5BgTz0dDq86bqR8sX-1A@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 05, 2018 at 08:52:56AM +0200, Geert Uytterhoeven wrote:
> Hi Kaneko-san,
> 
> On Tue, Sep 4, 2018 at 10:23 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds the device nodes for all MSIOF SPI controllers to
> > the R8A77990 SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> Thanks for your patch!
> 
> Unfortunately this is a duplicate of
> https://www.spinics.net/lists/devicetree/msg246988.html.
> 
> Sorry for stepping on your toes, I added MSIOF support for Ebisu to investigate
> MSIOF driver bugs.

The DMA portions seem new.
Perhaps a new patch should be constructed that only adds those properties?

> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -14,6 +14,13 @@
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >
> > +       aliases {
> > +               spi0 = &msiof0;
> > +               spi1 = &msiof1;
> > +               spi2 = &msiof2;
> > +               spi3 = &msiof3;
> > +       };
> 
> The SPI subsystem no longer needs aliases.
> Furthermore, aliases complicate DT overlay handling.
> 
> > +
> >         cpus {
> >                 #address-cells = <1>;
> >                 #size-cells = <0>;
> > @@ -70,6 +77,13 @@
> >                 clock-frequency = <0>;
> >         };
> >
> > +       /* MSIOF reference clock - to be overridden by boards that provide it */
> > +       msiof_ref_clk: msiof-ref-clock {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               clock-frequency = <0>;
> > +       };
> 
> This clock does not exist.
> 
> Board DTS should use "assigned-clocks" and "assigned-clock-rates" on the
> MSO clock instead.
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
