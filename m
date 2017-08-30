Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54098 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750835AbdH3H2z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 03:28:55 -0400
Date: Wed, 30 Aug 2017 09:28:51 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: Re: [PATCH] arm64: dts: ulcb: Enable display output
Message-ID: <20170830072850.GJ10398@verge.net.au>
References: <20170822142326.9652-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170822142326.9652-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 22, 2017 at 05:23:26PM +0300, Laurent Pinchart wrote:
> The DU is already wired up to the HDMI encoder, all we need to do is
> enable it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> This patch has been tested on the M3-W ULCB in Magnus' board farm. As no
> display is connected to the HDMI output testing was limited, to probing the
> device and verifying that it can be accessed from userspace.
> 
> Tests on the H3 ES1.1 and H3 ES2.0 ULCBs were less successful as I couldn't
> get the boards to boot properly, but they failed without this patch as well,
> so I don't think it should be a blocker.

Thanks, applied.
