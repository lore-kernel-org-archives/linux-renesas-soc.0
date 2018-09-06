Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:58633 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728035AbeIFNvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Sep 2018 09:51:12 -0400
Date: Thu, 6 Sep 2018 11:16:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: r8a77990: Add VIN and CSI-2 device
 nodes
Message-ID: <20180906091638.5egumd3pnuqocj5d@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-7-git-send-email-jacopo+renesas@jmondi.org>
 <20180906091029.gezk3zkalppxjb3e@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180906091029.gezk3zkalppxjb3e@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Sep 06, 2018 at 11:10:33AM +0200, Simon Horman wrote:
> On Wed, Sep 05, 2018 at 05:29:43PM +0200, Jacopo Mondi wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > 
> > Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.
> > 
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Thanks.
> 
> I took the liberty of re-arranging the node order to preserve the existing
> sort order in the .dtsi file.
> 
> The result is as follows:
> 
> 
> >From 053f0c7e8547095a959cbd3bbaf602388c8bbca7 Mon Sep 17 00:00:00 2001
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Date: Wed, 5 Sep 2018 17:29:43 +0200
> Subject: [PATCH] arm64: dts: r8a77990: Add VIN and CSI-2 device nodes
> 
> Add device nodes for VIN4, VIN5 and CSI40 to R-Car E3 R8A77990 device tree.
> 
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> [simon: sorted nodes by bus address, then IP block]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Sorry, I missread Laurent's reply to 7/7 and now see that he has not
supplied tags for this patch. I have not queued up this patch after all and
am waiting for review.

Sorry for my confusion.
