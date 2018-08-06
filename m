Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:43811 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbeHFVej (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 17:34:39 -0400
Date: Mon, 6 Aug 2018 21:23:54 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 11/14] dt-bindings: can: rcar_can: document r8a77965 can
 support
Message-ID: <20180806192354.GA5999@vmlxhi-102.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-12-erosca@de.adit-jv.com>
 <4cc3afe1-199c-3a15-9525-d2498299e4b6@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4cc3afe1-199c-3a15-9525-d2498299e4b6@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Mon, Aug 06, 2018 at 06:21:09PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 08/05/2018 02:11 AM, Eugeniu Rosca wrote:
> 
> > After adding CAN support to arch/arm64/boot/dts/renesas/r8a77965.dtsi,
> > checkpatch complained that the new compatible string
> > "renesas,can-r8a77965" is not documented. Fix the warning.
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> >  Documentation/devicetree/bindings/net/can/rcar_can.txt | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/can/rcar_can.txt b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> > index 94a7f33ac5e9..23264451a5a4 100644
> > --- a/Documentation/devicetree/bindings/net/can/rcar_can.txt
> > +++ b/Documentation/devicetree/bindings/net/can/rcar_can.txt
> [...]
> > @@ -28,9 +29,8 @@ Required properties:
> >  - pinctrl-0: pin control group to be used for this controller.
> >  - pinctrl-names: must be "default".
> >  
> > -Required properties for "renesas,can-r8a7795" and "renesas,can-r8a7796"
> > -compatible:
> > -In R8A7795 and R8A7796 SoCs, "clkp2" can be CANFD clock. This is a div6 clock
> > +Required properties for compatibles [A], [B] and [C]:
> 
>    I'd suggest to avoid the footnotes:
> 
> Required properties for compatibles R8A7795, R8A7796, and R8A77965:

I like this proposal, since it is the least intrusive and allows future
addition of SoC models with minimum amount of lines changed. Will use it
in v2.

> 
> > +For the denoted SoCs, "clkp2" can be CANFD clock. This is a div6 clock
> >  and can be used by both CAN and CAN FD controller at the same time. It needs to
> >  be scaled to maximum frequency if any of these controllers use it. This is done
> >  using the below properties:
> [...]
> 
> MBR, Sergei

Thanks,
Eugeniu.
