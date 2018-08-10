Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37746 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727396AbeHJNwW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 09:52:22 -0400
Date: Fri, 10 Aug 2018 13:22:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Subject: Re: [PATCH 01/14] arm64: dts: renesas: Cut redundant <SoC> in
 *<SoC>-<SoC>ulcb*.dts
Message-ID: <20180810112248.f7hfvknbb6sdkm4o@verge.net.au>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-2-erosca@de.adit-jv.com>
 <1772124.crYColn4IV@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1772124.crYColn4IV@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 06, 2018 at 01:35:08PM +0300, Laurent Pinchart wrote:
> Hello Eugeniu,
> 
> Thank you for the patch.
> 
> On Sunday, 5 August 2018 02:11:01 EEST Eugeniu Rosca wrote:
> > Perform a 's/(h|m)3ulcb/ulcb/' substitution in below DTS filenames:
> >  - r8a7795-es1-h3ulcb.dts    => r8a7795-es1-ulcb.dts
> >  - r8a7795-es1-h3ulcb-kf.dts => r8a7795-es1-ulcb-kf.dts
> >  - r8a7795-h3ulcb.dts        => r8a7795-ulcb.dts
> >  - r8a7795-h3ulcb-kf.dts     => r8a7795-ulcb-kf.dts
> >  - r8a7796-m3ulcb.dts        => r8a7796-ulcb.dts
> >  - r8a7796-m3ulcb-kf.dts     => r8a7796-ulcb-kf.dts
> > 
> > The background of this commit is M3-N ULCB (RTP0RC77965SKBX010SA00)
> > bring-up, which (assuming no change in existing DTS name patterns)
> > requires two new DTS files:
> >  - r8a77965-m3nulcb.dts
> >  - r8a77965-m3nulcb-kf.dts
> > 
> > In all above examples:
> >  - "m3n" prefix is redundant, since r8a77965 denotes the M3-N SoC
> >  - "m3"  prefix is redundant, since r8a7796  denotes the M3/M3-W SoC
> >  - "h3"  prefix is redundant, since r8a7795  denotes the H3 SoC
> 
> The naming convention is roughly <soc>-<board>.dts. For instance, in r8a7795-
> h3ulcb.dts, the SoC is R8A7795 and the board "H3 ULCB". With the proposed 
> rename we would break that convention.
> 
> However, the name ULCB itself (which stands for Ultra Low Cost Board) might 
> already not follow the naming convention, as the boards are officially called 
> R-Car Starter Kit (Pro and Premier). The V3M and V3H "low-cost" boards reflect 
> that properly, with their .dts files named r8a77970-v3msk.dts and r8a77970-
> v3hsk.dts respectively.
> 
> I'm not opposed to simplifying the file names, but I think we should then 
> decide on a simpler convention. In particular the H3/M3 and V3 .dts files 
> should in my opinion follow the same convention.
> 
> I'll now let others comment on this as I don't have such a strong opinion on 
> this topic.

At this point I'd prefer to keep the current, albeit imperfect scheme,
and avoid churn.
