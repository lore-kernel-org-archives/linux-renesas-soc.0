Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36114 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbeIQMfu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 08:35:50 -0400
Date: Mon, 17 Sep 2018 09:09:38 +0200
From: Simon Horman <horms@verge.net.au>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: ebisu: Add HDMI and CVBS
 input
Message-ID: <20180917070934.5nstt2ch4vu2mwx3@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-9-git-send-email-jacopo+renesas@jmondi.org>
 <2026479.hHFyJyWhrN@avalon>
 <20180912092950.us5wtr7x7vci6xr5@verge.net.au>
 <20180912110821.GX28160@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912110821.GX28160@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 01:08:21PM +0200, jacopo mondi wrote:
> Hi Simon,
> 
> On Wed, Sep 12, 2018 at 11:29:51AM +0200, Simon Horman wrote:
> > On Mon, Sep 10, 2018 at 05:21:08PM +0300, Laurent Pinchart wrote:
> > > Hi Jacopo,
> > >
> > > Thank you for the patch.
> > >
> > > On Wednesday, 5 September 2018 18:29:45 EEST Jacopo Mondi wrote:
> > > > Add HDMI and CVBS inputs device nodes to R-Car E3 Ebisu board.
> > > >
> > > > Both HDMI and CVBS inputs are connected to an ADV7482 video decoder hooked
> > > > to the SoC CSI-2 receiver port.
> > > >
> > > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > Jacopo,
> >
> > I assume that this patch depends on 7/8.
> > Please repost this patch when you repost that one,
> > addressing Laurent's feedback.
> 
> Sorry, I'm now confused :)
> I don't see any pending comment on [7/8] nor on this one ([8/8]).
> [7/8] has been applied to your "arm64-dt-for-v4.20" branch already
> (just checked).
> 
> I have a small comment on [6/8] and one open question on [5/8]. All
> the other patches have been reviewed/acked already.
> 
> To sum up: do you want me to repost [7/8] when re-sending this series?

No need.

I now see that 6/8 and 7/8 are in my tree.  And that this patch, 8/8, has
now been reviewed so I have applied it too.  So I think all the patches in
this series targeted at my tree have now been applied.

Please consider a follow-up patch to address the review of 6/8.
