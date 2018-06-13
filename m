Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36755 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934972AbeFMLVy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 07:21:54 -0400
Date: Wed, 13 Jun 2018 13:21:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] arm64: dts: renesas: Fix VSPD registers range
Message-ID: <20180613112149.63fs2cli5v5gdt43@verge.net.au>
References: <20180608122115.21138-1-laurent.pinchart+renesas@ideasonboard.com>
 <2a6247d0-6224-f2b0-b6ac-7116c8bc0cae@cogentembedded.com>
 <2285616.K3iSyOB0te@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2285616.K3iSyOB0te@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 08, 2018 at 07:49:43PM +0300, Laurent Pinchart wrote:
> Hi Sergei,
> 
> (CC'ing Olof)
> 
> On Friday, 8 June 2018 19:41:01 EEST Sergei Shtylyov wrote:
> > On 06/08/2018 03:21 PM, Laurent Pinchart wrote:
> > > The VSPD and FCPVD nodes have overlapping register ranges, as the FCPVD
> > > devices are mapped in the memory range usually used by the VSP LUT and
> > > CLU, which are not present in the VSPD. Fix this by shortening the VSPD
> > > registers range to 0x5000.
> > > 
> > > Fixes: 9f8573e38a0b ("arm64: dts: renesas: r8a7795: Add VSP instances")
> > > Fixes: 291e0c4994d0 ("arm64: dts: r8a7795: Add support for R-Car H3
> > > ES2.0")
> > > Fixes: f06ffdfbdd90 ("arm64: dts: r8a7796: Add VSP instances")
> > > Fixes: b4f92030d5d3 ("arm64: dts: renesas: r8a77970: add VSPD support")
> > > Fixes: 295952a183d3 ("arm64: dts: renesas: r8a77995: add VSP instances")
> > > Fixes: 85cb3229218a ("arm64: dts: renesas: r8a77965: Add VSP instances")
> > 
> > That'd be a nightmare for the -stable maintainers -- all those commits
> > were made in the different time, so constant rejects are warranted.
> > 
> > > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > > Changes since v1:
> > > 
> > > - Fix H3, M3-W and M3-N in addition to V3H and D3
> > > - Don't touch the VSPBS instance of D3 as there's no overlap
> > > - Squash all patches together
> > 
> >  Don't think that was a good idea in this case. Other opinions?
> 
> We have been requested ([1]) to try and group the DT changes, hence this 
> change. No clear rule has been set, and this might be a case where a split is 
> better. Olof, what would you prefer ?
> 
> [1] https://www.spinics.net/lists/arm-kernel/msg657208.html

We are trying to find a new balance in response to [1].
If this turns out to be a problem for -stable then we will
adjust our processes accordingly.

Applied for v4.19 as this should not have any runtime effect.
Thanks everyone.
