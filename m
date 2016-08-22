Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54164 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751187AbcHVJ1C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 05:27:02 -0400
Date: Mon, 22 Aug 2016 11:25:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Ai Kyuse <ai.kyuse.uw@renesas.com>
Subject: Re: [PATCH/RTF 7/7] arm64: dts: r8a7796: salvator-x: enable SDHI0 & 3
Message-ID: <20160822092555.GC7896@verge.net.au>
References: <1471433516-4478-1-git-send-email-horms+renesas@verge.net.au>
 <1471433516-4478-8-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVjmVobeTNSf9kWtWaGk6zcWRjGKkjKqfFmqx0ZJYJurg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVjmVobeTNSf9kWtWaGk6zcWRjGKkjKqfFmqx0ZJYJurg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 17, 2016 at 05:52:17PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 17, 2016 at 1:31 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Enable the exposed SD card slots in the DT of the r8a7796/salvator-x.
> >
> > Based on work for the r8a7795/salvator-x by Ai Kyuse.
> >
> > Cc: Ai Kyuse <ai.kyuse.uw@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 84 ++++++++++++++++++++++
> >  1 file changed, 84 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> > index bb34b8d69c79..f06621f2ee4c 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> 
> > @@ -36,12 +86,46 @@
> >                 groups = "scif2_data_a";
> >                 function = "scif2";
> >         };
> > +
> > +       sdhi0_pins: sd0 {
> > +               groups = "sdhi0_data4", "sdhi0_ctrl";
> > +               function = "sdhi0";
> > +       };
> > +
> > +       sdhi3_pins: sd3 {
> > +               groups = "sdhi3_data4", "sdhi3_ctrl";
> > +               function = "sdhi3";
> > +       };
> >  };
> >
> >  &extal_clk {
> >         clock-frequency = <16666666>;
> >  };
> >
> > +&sdhi0 {
> > +       pinctrl-0 = <&sdhi0_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       vmmc-supply = <&vcc_sdhi0>;
> > +       vqmmc-supply = <&vccq_sdhi0>;
> > +       cd-gpios = <&gpio3 12 GPIO_ACTIVE_LOW>;
> > +       wp-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
> 
> BTW, is there a specific reason CD and WP use GPIOs, and not the
> dedicated sdhi0_cd and sdhi0_wp pin config?
> It's done the same on r8a7795/salvator-x.

Good point. I'll try and follow up on that.

> > +       bus-width = <4>;
> > +       status = "okay";
> > +};
> > +
> > +&sdhi3 {
> > +       pinctrl-0 = <&sdhi3_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       vmmc-supply = <&vcc_sdhi3>;
> > +       vqmmc-supply = <&vccq_sdhi3>;
> > +       cd-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
> > +       wp-gpios = <&gpio4 16 GPIO_ACTIVE_HIGH>;
> 
> Likewise.
> 
> > +       bus-width = <4>;
> > +       status = "okay";
> > +};
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
