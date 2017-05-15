Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49340 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdEOGyB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 02:54:01 -0400
Date: Mon, 15 May 2017 08:53:56 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 0/6] R-Car H3 HDMI output DT integration
Message-ID: <20170515065355.GF16545@verge.net.au>
References: <20170513231618.1715-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170515065256.GE16545@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170515065256.GE16545@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 15, 2017 at 08:52:56AM +0200, Simon Horman wrote:
> On Sun, May 14, 2017 at 02:16:12AM +0300, Laurent Pinchart wrote:
> > Hello,
> > 
> > This patch series contains all the DT changes needed to integrate HDMI output
> > support for the H3 Salvator-X board.
> > 
> > The patches have been rebased on top of a merge of Simon's latest devel branch
> > and v4.12-rc1, and have taken Geert's comments into account. For convenience,
> > they are available from
> > 
> >         git://linuxtv.org/pinchartl/media.git drm-next-dt-v5-20170513
> > 
> > Simon, this still depends on driver changes that were merged by Linus for
> > v4.12-rc1 (the checkpatch warnings related to unknown compatible strings will
> > then be gone). Again, please only apply these patches after you merge
> > v4.12-rc1 in your tree.
> 
> Thanks. Now that v4.12-rc1 has been released I have rebased by
> arm64-dt-for-v4.13 branch on top of it. I plan to merge that into both
> renesas-next and renesas-devel, and push later today.

I somehow forgot to say that I have queued up these patches in
the arm64-dt-for-v4.13 branch.
