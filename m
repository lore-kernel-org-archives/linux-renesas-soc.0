Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57419 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758144AbdKQNjJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 08:39:09 -0500
Date: Fri, 17 Nov 2017 05:39:06 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>
Subject: Re: [PATCH v5 01/15] arm64: dts: renesas: r8a7795: Add IPMMU device
 nodes
Message-ID: <20171117133905.qqnkjt5ckalcdgdy@verge.net.au>
References: <20171110132532.1202-1-horms+renesas@verge.net.au>
 <20171110132532.1202-2-horms+renesas@verge.net.au>
 <CAMuHMdVXJduKrdb0+ujJX7O7_1omvfaWjCjTHwTafFD1sr=q=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVXJduKrdb0+ujJX7O7_1omvfaWjCjTHwTafFD1sr=q=g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 15, 2017 at 03:29:55PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Nov 10, 2017 at 2:25 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add r8a7795 IPMMU nodes and keep all disabled by default.
> >
> > This includes all IPMMU devices for r8a7795 ES2.0. Those
> > not present in r8a7795 ES1.x are removed from the DT for those
> > SoCs using delete-node. A follow-up patch will add IPMMU devices
> > to ES1.x which are not also present in ES2.0.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> > v5 [Simon Horman]
> > * Correct ES1.x override for ipmmu_vc0
> > * Add ES1.x override for ipmmu_vc1
> > * Drop mostly redundant comments from nodes
> > * Add power domains
> > * Consistently mark all nodes as disabled
> 
> Thanks for the update!
> 
> Looks like "power-domains" do work for IOMMU nodes.
> However, adding them seems to postpone initialization of the IOMMUs.
> 
> With the two typos below fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have applied this patch with those fixes and your tag.

> 
> > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> 
> > +               ipmmu_vc0: mmu@fe6b0000 {
> > +                       compatible = "renesas,ipmmu-r8a7795";
> > +                       reg = <0 0xfe6b0000 0 0x1000>;
> > +                       renesas,ipmmu-main = <&ipmmu_mm 12>;
> > +                       power-domains = <&sysc R8A7795_PD_A3VP>;
> 
> R8A7795_PD_A3VC
> 
> > +                       #iommu-cells = <1>;
> > +                       status = "disabled";
> > +               };
> > +
> > +               ipmmu_vc1: mmu@fe6f0000 {
> > +                       compatible = "renesas,ipmmu-r8a7795";
> > +                       reg = <0 0xfe6f0000 0 0x1000>;
> > +                       renesas,ipmmu-main = <&ipmmu_mm 13>;
> > +                       power-domains = <&sysc R8A7795_PD_A3VP>;
> 
> R8A7795_PD_A3VC
> 
> > +                       #iommu-cells = <1>;
> > +                       status = "disabled";
> > +               };
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
