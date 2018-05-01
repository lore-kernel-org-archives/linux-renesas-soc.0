Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55630 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750955AbeEAFkD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 May 2018 01:40:03 -0400
Date: Tue, 1 May 2018 07:39:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7790: Fix sort order of VSP1/FDP1 nodes
Message-ID: <20180501053942.safyboe3lil6utjg@verge.net.au>
References: <20180430065949.my4733iq3cx2ombj@verge.net.au>
 <20180430105325.27753-1-kieran.bingham+renesas@ideasonboard.com>
 <6550082.BIGKvazxOf@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6550082.BIGKvazxOf@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 30, 2018 at 02:25:33PM +0300, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Monday, 30 April 2018 13:53:25 EEST Kieran Bingham wrote:
> > Commit 5d3b50d3c04d ("ARM: dts: renesas: r8a7790: Add FDP1 instances")
> > introduced the FDP1 for the r8a7790, but broke the sort ordering of the
> > device tree nodes.
> > 
> > Move the last VSP up to it's peers to correct the ordering.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, applied.
