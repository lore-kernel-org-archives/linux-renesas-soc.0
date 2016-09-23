Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50266 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750720AbcIWHl3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 03:41:29 -0400
Date: Fri, 23 Sep 2016 09:41:24 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: rskrza1: add sdhi1 DT support
Message-ID: <20160923074123.GD20129@verge.net.au>
References: <20160922213211.7988-1-chris.brandt@renesas.com>
 <20160922213211.7988-4-chris.brandt@renesas.com>
 <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWckFaU__BM=WAOvJ+fVjEvNdLCFy0GNiKwU159aZTdhg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 23, 2016 at 09:09:07AM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 22, 2016 at 11:32 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > ---
> >  arch/arm/boot/dts/r7s72100-rskrza1.dts | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > index e5dea5b..548b51f 100644
> > --- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > +++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
> > @@ -56,6 +56,10 @@
> >         };
> >  };
> >
> > +&sdhi1 {
> > +       status = "okay";
> 
> On all other boards, we have the bus-width property in the board-specific
> .dts instead of in the SoC-specific .dtsi.

I'd like us to be consistent as much as possible.
But I do wonder why it has been added as a board property.

> > +};
> > +
> >  &scif2 {
> >         status = "okay";
> >  };
