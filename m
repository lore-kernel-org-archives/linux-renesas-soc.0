Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48869 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbeKSVE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 16:04:56 -0500
Date: Mon, 19 Nov 2018 11:41:39 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
Message-ID: <20181119104139.ujbtl4jfnhxj5gxy@verge.net.au>
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181118231807.GE2553@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181118231807.GE2553@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 19, 2018 at 12:18:07AM +0100, Wolfram Sang wrote:
> 
> > +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible controller.
> 
> Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
> of course. But Simon, shall we fix that for all CANFD?

I think its too late to fix it for existing bindings.
We could move to a new scheme for r8a77965 and beyond,
but that is rather messy. I lean to wards continuing with
using 'canfd' as a suffix.

> 
> > -Required properties for "renesas,r8a7795-canfd" and "renesas,r8a7796-canfd"
> > -compatible:
> > -In R8A7795 and R8A7796 SoCs, canfd clock is a div6 clock and can be used by both
> > -CAN and CAN FD controller at the same time. It needs to be scaled to maximum
> > -frequency if any of these controllers use it. This is done using the below
> > -properties:
> > +Required properties for "renesas,r8a7795-canfd", "renesas,r8a7796-canfd" and
> > +"renesas,r8a77965-canfd" compatible:
> > +In R8A7795, R8A7796 and R8A77965 SoCs, canfd clock is a div6 clock and can
> > +be used by both CAN and CAN FD controller at the same time. It needs to be
> > +scaled to maximum frequency if any of these controllers use it. This is done
> > +using the below properties:
> 
> I think updating this paragraph does not scale. Maybe we should reformat
> it the way as for plain CAN, so only in the header the new SoC gets
> added? We can fix this incrementally, though, doesn't need to be
> addressed within this patch.
> 
