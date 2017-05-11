Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39498 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751985AbdEKO7w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2017 10:59:52 -0400
Date: Thu, 11 May 2017 16:59:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 0/7] R-Car H3 HDMI output DT integration
Message-ID: <20170511145948.GG21895@verge.net.au>
References: <20170510070458.21193-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170510091440.GC16496@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170510091440.GC16496@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 10, 2017 at 11:14:41AM +0200, Simon Horman wrote:
> On Wed, May 10, 2017 at 10:04:51AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series contains all the DT changes needed to integrate HDMI output
> > support for the H3 Salvator-X board.
> > 
> > The patches have been rebased on top of Simon's latest devel branch. Conflict
> > resolution led to the new 2/7 patch. For convenience, the patches are
> > available from
> > 
> > 	git://linuxtv.org/pinchartl/media.git drm-next-dt-v4-20170510
> > 
> > Simon, this depends on driver changes that were merged by Linus for v4.12-rc1
> > (the checkpatch warnings related to unknown compatible strings will then be
> > gone). Could you please apply these patches once you merge v4.12-rc1 in your
> > tree ?
> 
> Yes, that sounds reasonable. I plan to rebase shortly after v4.12-rc1 is
> released. Please feel free to ping me if I forget to queue these up at that
> time.

Subsequently Geert offered some review. I'll be watching out for a v5 to
apply.
