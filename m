Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49719 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbeJRUNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 16:13:55 -0400
Date: Thu, 18 Oct 2018 14:13:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a77965: Add LVDS support
Message-ID: <20181018121302.q5nvro6enbrkt7jy@verge.net.au>
References: <20181018004149.29448-1-laurent.pinchart+renesas@ideasonboard.com>
 <20181018004149.29448-4-laurent.pinchart+renesas@ideasonboard.com>
 <1e5ca6fb-8d60-066f-c39a-ddaa24844211@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e5ca6fb-8d60-066f-c39a-ddaa24844211@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 18, 2018 at 12:17:14PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> 
> On 18/10/18 01:41, Laurent Pinchart wrote:
> > The M3-N (r8a77965) platform has oneLVDS encoder connected to the DU.
> 
> s/oneLVDS/one LVDS/
> 
> > Add the corresponding DT node and wire it up.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> With the title fixed,
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks, applied for v4.21 with the changelog updated as suggested above
