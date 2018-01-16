Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37611 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbeAPJJz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 04:09:55 -0500
Date: Tue, 16 Jan 2018 10:09:52 +0100
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 05/10] ARM: dts: porter: Fix HDMI output routing
Message-ID: <20180116090951.c64tqhxvae5paokl@verge.net.au>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-6-laurent.pinchart+renesas@ideasonboard.com>
 <20180115075602.gfstfimbcwh6uner@verge.net.au>
 <2396985.RUYR8QAblK@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2396985.RUYR8QAblK@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 15, 2018 at 10:25:34AM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Monday, 15 January 2018 09:56:03 EET Simon Horman wrote:
> > On Fri, Jan 12, 2018 at 02:58:53AM +0200, Laurent Pinchart wrote:
> > > The HDMI encoder is connected to the RGB output of the DU, which is
> > > port@0, not port@1. Fix the incorrect DT description.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Should this have the following tag?
> > 
> > Fixes: c5af8a4248d3 ("ARM: dts: porter: add DU DT support")
> 
> That would make sense, yes.
> 
> > If so, is it a fix to apply for v4.15 or a more regular patch
> > to apply for v4.16?
> 
> I believe we can wait for v4.16. HDMI output works on Porter at the
> moment due to a separate bug in the DU driver that clones outputs by
> default when it shouldn't. There's however no harm in backporting the
> patch to stable series if desired, but it's not required.

Thanks, I've applied this for v4.16 with the fixes tag above.
Possibly the fixes tag will result in some automated backporting occurring.
If so we can let that run its course, if not we can leave things be with
the option to backport later if we decide its necessary.

I have not applied the other dts patches in this series at this point.
