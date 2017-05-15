Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965492AbdEOOxJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 10:53:09 -0400
Date: Mon, 15 May 2017 16:53:05 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a7795: Use GIC_SPI for HDMI
 interrupts
Message-ID: <20170515145254.GA21549@verge.net.au>
References: <20170515095241.17703-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170515095241.17703-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 15, 2017 at 12:52:41PM +0300, Laurent Pinchart wrote:
> Use the GIC_SPI macro instead of hardcoding its value in the HDMI
> interrupts specifiers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Hi Simon,
> 
> Sorry for having messed that up in the original patch :-/ Feel free to squash
> this fix in "arm64: dts: renesas: r8a7795: Add HDMI encoder support" if you
> want to rebase, or just apply it on top.

No problem, I've also made a few DT errors of late :)

I have squashed this change as you suggest.
I plan to push it a bit later today and if not tomorrow.
