Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47247 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753456AbcLNID2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Dec 2016 03:03:28 -0500
Date: Wed, 14 Dec 2016 09:03:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] irqchip/renesas-intc-irqpin: Add R-Car Gen1 fallback
 binding
Message-ID: <20161214080318.GA32481@verge.net.au>
References: <1481280650-9258-1-git-send-email-horms+renesas@verge.net.au>
 <1481280650-9258-3-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdX_Cg6T10pMXe420kOwQn27_PRm-osNb7L4_M==fJnE_Q@mail.gmail.com>
 <20161212184311.2gciuj5lgkp5x7st@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161212184311.2gciuj5lgkp5x7st@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 12:43:11PM -0600, Rob Herring wrote:
> On Fri, Dec 09, 2016 at 01:52:20PM +0100, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Fri, Dec 9, 2016 at 11:50 AM, Simon Horman
> > <horms+renesas@verge.net.au> wrote:
> > > In the case of Renesas R-Car hardware we know that there are generations of
> > > SoCs, e.g. Gen 1, Gen 2 and Gen 3. But beyond that its not clear what the
> > 
> > it's
> > 
> > > relationship between IP blocks might be. For example, I believe that
> > > r8a7779 is older than r8a7778 but that doesn't imply that the latter is a
> > > descendant of the former or vice versa.
> > >
> > > We can, however, by examining the documentation and behaviour of the
> > > hardware at run-time observe that the current driver implementation appears
> > > to be compatible with the IP blocks on SoCs within a given generation.
> > >
> > > For the above reasons and convenience when enabling new SoCs a
> > > per-generation fallback compatibility string scheme being adopted for
> > > drivers for Renesas SoCs.
> > >
> > > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > > ---
> > >  .../interrupt-controller/renesas,intc-irqpin.txt   | 44 ++++++++++++----------
> > >  drivers/irqchip/irq-renesas-intc-irqpin.c          |  2 +
> > >  2 files changed, 26 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > > index 772c550d3b4b..e5a5251be9f5 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
> > > @@ -2,13 +2,19 @@ DT bindings for the R-/SH-Mobile irqpin controller
> > >
> > >  Required properties:
> > >
> > > -- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
> > > -  as fallback.
> > > -  Examples with soctypes are:
> > > +- compatible:
> > >      - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
> > >      - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
> > >      - "renesas,intc-irqpin-r8a7779" (R-Car H1)
> > >      - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
> > > +    - "renesas,rcar-gen1-intc-irqpin" (generic R-Car Gen1 compatible device)
> > 
> > Does it make sense to add a new family-specific compatible value to a driver
> > that's unlikely to receive more users in the future? More recent SoCs use
> > renesas,irqc.
> 
> If that's the case, then no. Please don't go crazy with your generic 
> strings. I don't mind them, but I don't know that I'd call it best 
> practice.

Understood. I do not see any new users of this driver on the horizon
and given the above I withdraw this patch.
