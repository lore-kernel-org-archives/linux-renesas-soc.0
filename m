Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50051 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbeJRUaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Oct 2018 16:30:21 -0400
Date: Thu, 18 Oct 2018 14:29:29 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: r8a779[01]: Disable unconnected LVDS encoders
Message-ID: <20181018122928.d5egaddqaaxrfkip@verge.net.au>
References: <20181017174801.19838-1-laurent.pinchart+renesas@ideasonboard.com>
 <2320655.D6V6aaDACg@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2320655.D6V6aaDACg@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 17, 2018 at 09:01:04PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Wednesday, 17 October 2018 20:48:01 EEST Laurent Pinchart wrote:
> > The LVDS0 encoder on Koelsh and Porter, and the LVDS1 encoder on Lager,
> > are enabled in DT but have no device connected to their output. This
> > result in spurious messages being printed to the kernel log such as
> > 
> > rcar-du feb00000.display: no connector for encoder /soc/lvds@feb90000,
> > skipping
> > 
> > Fix it by disabling the encoders.
> > 
> > Fixes: 15a1ff30d8f9 ("ARM: dts: r8a7790: Convert to new LVDS DT bindings")
> > Fixes: e5c3f4707f39 ("ARM: dts: r8a7791: Convert to new LVDS DT bindings")
> > Reported-by: Simon Horman <horms@verge.net.au>
> 
> This should have read
> 
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Sorry for the mistake, I had read the e-mail thread containing the report 
> incorrectly. Simon, could you fix this when applying to your tree, or should I 
> send a v2 ?

No need for a v2.

I have applied this patch for v4.21 with the updated Reported-by tag.
