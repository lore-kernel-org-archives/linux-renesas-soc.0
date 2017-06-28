Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38236 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751920AbdF1TB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2017 15:01:56 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Setup planes before enabling CRTC to avoid flicker
Date: Wed, 28 Jun 2017 22:01:48 +0300
Message-ID: <2122582.afWRqxtlHg@avalon>
In-Reply-To: <CAMuHMdVmH=kYHiKv3+p9gtv_kqLQf4y3ZYg2OonMaa3qsHo2Fw@mail.gmail.com>
References: <20170628185055.16379-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdVmH=kYHiKv3+p9gtv_kqLQf4y3ZYg2OonMaa3qsHo2Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Wednesday 28 Jun 2017 20:52:53 Geert Uytterhoeven wrote:
> On Wed, Jun 28, 2017 at 8:50 PM, Laurent Pinchart wrote:
> > Commit 52055bafa1ff ("drm: rcar-du: Move plane commit code from CRTC
> > start to CRTC resume") changed the order of the plane commit and CRTC
> > enable operations to accommodate the runtime PM requirements. However,
> > this introduced corruption in the first displayed frame, as the CRTC is
> > now enabled without any plane configured. On Gen2 hardware the first
> > frame will be black and likely unnoticed, but on Gen3 hardware we end up
> > starting the display before the VSP compositor, which is more
> > noticeable.
> > 
> > To fix this, revert the order of the commit operations back, and handle
> > runtime PM requirements in the CRTC .atomic_begin() and .atomic_enable()
> > helper operation handlers.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> 
> Fixes: ...

I thought about that, but this patch fixes a problem caused by a combination 
of commits. The one mentioned above is probably the easiest to point at, but 
the problem only became, well, problematic, with the introduction of Gen3 
support in v4.6.

Furthermore, while it's probably possible to backport this patch to v4.6, I 
don't think it needs to be included in -stable. For all those reasons, a Fixes 
tag might not be useful. Of course please feel free to disagree :-)

-- 
Regards,

Laurent Pinchart
