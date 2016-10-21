Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57487 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754563AbcJUHQJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 03:16:09 -0400
Date: Fri, 21 Oct 2016 09:16:03 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7779: Fix DU reg property
Message-ID: <20161021071602.GB11736@verge.net.au>
References: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <20161020084229.GE4612@verge.net.au>
 <3220182.XWJ5KRRtK6@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3220182.XWJ5KRRtK6@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 20, 2016 at 01:00:58PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Thursday 20 Oct 2016 10:42:30 Simon Horman wrote:
> > Hi Laurent,
> > 
> > On Wed, Oct 19, 2016 at 01:23:02AM +0300, Laurent Pinchart wrote:
> > > The system uses one address cell and one size cell, not two. Fix the DU
> > > DT node.
> > 
> > Do you want to handle this as a fix for v4.9? If so shall we add the
> > following?
> > 
> > Fixes: 1f08bbe8ac73 ("ARM: shmobile: r8a7779: Add DU node to device tree")
> > 
> > Else I'll just queue it up for v4.10.
> 
> v4.10 is fine, 1f08bbe8ac73 was merged in v3.19, so there's no urgency :-)
> 
> It looks like nobody has tried to get display working on Marzen for a very 
> long time.

Thanks, I will queue it up for v4.10.
