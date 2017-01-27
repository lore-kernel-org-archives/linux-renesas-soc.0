Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58866 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754297AbdA0Inl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 03:43:41 -0500
Date: Fri, 27 Jan 2017 09:43:35 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: r8a7796: Add I2C for DVFS device node
Message-ID: <20170127084334.GJ21195@verge.net.au>
References: <1485420750-12701-1-git-send-email-horms+renesas@verge.net.au>
 <1485420750-12701-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdXSriucRXVACQoGx0S8CX0sXPmuWvAQy0+RP9PY-z7U3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXSriucRXVACQoGx0S8CX0sXPmuWvAQy0+RP9PY-z7U3g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jan 26, 2017 at 11:07:24AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 26, 2017 at 9:52 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Dien Pham <dien.pham.ry@rvc.renesas.com>
> >
> > This patch adds I2C for DVFS device node for R8A7796 SoC.
> >
> > Signed-off-by: Dien Pham <dien.pham.ry@rvc.renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> 
> > @@ -269,6 +270,19 @@
> >                         #power-domain-cells = <1>;
> >                 };
> >
> > +               i2c_dvfs: i2c@e60b0000 {
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +                       compatible = "renesas,iic-r8a7796",
> > +                                    "renesas,rcar-gen3-iic",
> > +                                    "renesas,rmobile-iic";
> > +                       reg = <0 0xe60b0000 0 0x425>;
> > +                       interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks = <&cpg CPG_MOD 926>;
> 
> You may want to add dmas/dma-names.
> That can be done later, though.

Thanks, I will do that as a follow up and queue up this series
for v4.12 in the mean time.
