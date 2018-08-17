Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:40812 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbeHQMow (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 08:44:52 -0400
Date: Fri, 17 Aug 2018 11:41:52 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Simon Horman <horms@verge.net.au>
CC: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
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
Subject: Re: [PATCH v2 2/7] dt-bindings: can: rcar_can: document r8a77965 can
 support
Message-ID: <20180817094152.GA2361@vmlxhi-102.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-2-erosca@de.adit-jv.com>
 <20180817090403.tsxpqal3wzmcfujj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20180817090403.tsxpqal3wzmcfujj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Fri, Aug 17, 2018 at 11:04:03AM +0200, Simon Horman wrote:
> On Sun, Aug 12, 2018 at 03:31:44PM +0200, Eugeniu Rosca wrote:
> > Document the support for rcar_can on R8A77965 SoC devices.
> > Add R8A77965 to the list of SoCs which require the "assigned-clocks" and
> > "assigned-clock-rates" properties (thanks, Sergei). Rewrap text.
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> > Changes in v2:
> >  - [Kieran Bingham] Simplified commit description. Rewrapped text.
> >  - [Sergei Shtylyov] Replaced footnotes with inline text.
> >  - Pushed all dt-bindings patches to the beginning of the series.
> > ---
> >  Documentation/devicetree/bindings/net/can/rcar_can.txt | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> As this is a CAN patch I believe it should be:
> 
>   * Targeted at the net-next tree.
> 
>   * Have net-next in the subject prefix
> 
>     e.g.:
> 
>     "[PATCH v3 net-next] dt-bindings: can: rcar_can: document r8a77965 support"

I will re-spin this particular patch as v3 with your Reviewed-by and all
the suggested names included in the "Sent to" field.

> 
>     * Sent to:
>       Wolfgang Grandegger <wg@grandegger.com>
>       Marc Kleine-Budde <mkl@pengutronix.de>
>       "David S. Miller" <davem@davemloft.net>
>       linux-can@vger.kernel.org
>       netdev@vger.kernel.org
> 
> As it is a DT binding patch I believe it should also be sent to:
>   Rob Herring <robh+dt@kernel.org>
>   Mark Rutland <mark.rutland@arm.com>
>   devicetree@vger.kernel.org
> 
> And as it is related to Renesas SoCs it should also be sent to:
>   Simon Horman <horms@verge.net.au>
>   Magnus Damm <damm+renesas@opensource.se>
>   linux-renesas-soc@vger.kernel.org
> 
> Sending it to more people is ok too :)

Best regards,
Eugeniu.
