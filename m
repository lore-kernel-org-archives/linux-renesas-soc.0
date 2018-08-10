Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:33292 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbeHJQDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Aug 2018 12:03:03 -0400
Received: by mail-wm0-f68.google.com with SMTP id r24-v6so1505500wmh.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Aug 2018 06:33:07 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Fri, 10 Aug 2018 15:33:02 +0200
To: Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
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
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 01/14] arm64: dts: renesas: Cut redundant <SoC> in
 *<SoC>-<SoC>ulcb*.dts
Message-ID: <20180810133251.GA27396@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-2-erosca@de.adit-jv.com>
 <1772124.crYColn4IV@avalon>
 <20180810112248.f7hfvknbb6sdkm4o@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180810112248.f7hfvknbb6sdkm4o@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, Laurent,

On Fri, Aug 10, 2018 at 01:22:49PM +0200, Simon Horman wrote:
> On Mon, Aug 06, 2018 at 01:35:08PM +0300, Laurent Pinchart wrote:
[snip]
> > The naming convention is roughly <soc>-<board>.dts. For instance, in r8a7795-
> > h3ulcb.dts, the SoC is R8A7795 and the board "H3 ULCB". With the proposed 
> > rename we would break that convention.
> > 
> > However, the name ULCB itself (which stands for Ultra Low Cost Board) might 
> > already not follow the naming convention, as the boards are officially called 
> > R-Car Starter Kit (Pro and Premier). The V3M and V3H "low-cost" boards reflect 
> > that properly, with their .dts files named r8a77970-v3msk.dts and r8a77970-
> > v3hsk.dts respectively.
> > 
> > I'm not opposed to simplifying the file names, but I think we should then 
> > decide on a simpler convention. In particular the H3/M3 and V3 .dts files 
> > should in my opinion follow the same convention.
> > 
> > I'll now let others comment on this as I don't have such a strong opinion on 
> > this topic.
> 
> At this point I'd prefer to keep the current, albeit imperfect scheme,
> and avoid churn.

To be able to push a v2, I interpret this input as using below strings
for the newly supported M3-N Starter Kit board:
 - r8a77965-m3nulcb.dts and r8a77965-m3nulcb-kf.dts for device tree sources
 - "renesas,m3nulcb" for compatible string
 - M3NULCB for board name in the shmobile.txt DT bindings

I still think there is some redundancy in this naming scheme, but I can
live with that.

Thanks,
Eugeniu.
