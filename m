Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42268 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbeILOdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Sep 2018 10:33:36 -0400
Date: Wed, 12 Sep 2018 11:29:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, geert@linux-m68k.org,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 8/8] arm64: dts: renesas: ebisu: Add HDMI and CVBS
 input
Message-ID: <20180912092950.us5wtr7x7vci6xr5@verge.net.au>
References: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
 <1536161385-25562-9-git-send-email-jacopo+renesas@jmondi.org>
 <2026479.hHFyJyWhrN@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026479.hHFyJyWhrN@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Sep 10, 2018 at 05:21:08PM +0300, Laurent Pinchart wrote:
> Hi Jacopo,
> 
> Thank you for the patch.
> 
> On Wednesday, 5 September 2018 18:29:45 EEST Jacopo Mondi wrote:
> > Add HDMI and CVBS inputs device nodes to R-Car E3 Ebisu board.
> > 
> > Both HDMI and CVBS inputs are connected to an ADV7482 video decoder hooked
> > to the SoC CSI-2 receiver port.
> > 
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Jacopo,

I assume that this patch depends on 7/8.
Please repost this patch when you repost that one,
addressing Laurent's feedback.
