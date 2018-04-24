Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32884 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752757AbeDXJWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:22:25 -0400
Date: Tue, 24 Apr 2018 11:22:20 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77980: add MMC support
Message-ID: <20180424092220.s6qgtxloinmimqa7@verge.net.au>
References: <611daf1f-42a2-d463-0814-ebf762871018@cogentembedded.com>
 <aaa58189-2c27-e51f-1f97-3671c50a1479@cogentembedded.com>
 <20180420095857.latofivdh3dnvu2z@verge.net.au>
 <5be1ecdb-8f36-ca1e-aba6-012fbb263894@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5be1ecdb-8f36-ca1e-aba6-012fbb263894@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 10:06:03PM +0300, Sergei Shtylyov wrote:
> On 04/20/2018 12:58 PM, Simon Horman wrote:
> 
> >> Define the generic R8A77980 part of the MMC0 (SDHI2) device node.
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> ---
> >>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> ===================================================================
> >> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> >> @@ -371,6 +371,18 @@
> >>  			dma-channels = <16>;
> >>  		};
> >>  
> >> +		mmc0: mmc@ee140000 {
> > 
> > Please use sdhi2: sd@ee140000 for consistency with other SoCs
> > (I refereed to the r8a7795).
> 
>    Mmm... note that this controller has MMC signals (8 data bits, DS, no CD/WP),
> see manual v0.55. I think it's more correct to call it MMC0 (trken from the
> manual as well)...

Ok, point taken. I've applied this. But in general I would like the
dtsi files to be consistent where it makes sense.
