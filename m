Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:41612 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750796AbeAPWUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 17:20:41 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: rcar-du: lvds: Fix LVDS startup on R-Car gen2
Date: Wed, 17 Jan 2018 00:20:45 +0200
Message-ID: <2846660.RJnc8Crq0n@avalon>
In-Reply-To: <1078e267-c900-6caf-5787-de078f5b6557@cogentembedded.com>
References: <11845752.a3eY2rs97p@avalon> <1635865.FStOqVGXHX@avalon> <1078e267-c900-6caf-5787-de078f5b6557@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tuesday, 16 January 2018 22:17:31 EET Sergei Shtylyov wrote:
> On 01/16/2018 06:46 PM, Laurent Pinchart wrote:
> >>> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>> 
> >>> According to the latest revision 2.00 of the R-Car gen2 manual, the LVDS
> >>> must be enabled and the bias crcuit enabled after the LVDS I/O pins are
> 
> Oops, this needs fixing (note the typo!). Could you please change this
> passage to:
> 
> and the bias circuit must be enabled after the LVDS I/O pins are
> 
> ?

Sure I'll fix that.

> >>> enabled, not before. Fix the gen2 LVDS startup sequence accordingly.
> >>> 
> >>> While at it, also fix the comment preceding the first LVDCR0 write that
> >>> still talks about hardcoding the LVDS mode 0.
> >> 
> >> Please do this in a separate commit then...
> > 
> > The reason I added it here is that I think we don't need patch 1/2 from
> > this series, and I found a bit overkill to split a comment fix to a
> > separate patch when we have a patch that touches the code around the
> > comment.
> 
> OK, you're the maintainer of this driver, you know better. :-)
> 
> >>> Fixes: 90374b5c25c9 ("drm/rcar-du: Add internal LVDS encoder support")
> >> 
> >> You forgot to specify the other commit this one fixes -- I mean the
> >> comment fix.
> > 
> > Do we need to for a comment update ? It doesn't affect fix the behaviour
> > of the driver or device, and I'd thus prefer to avoid giving the wrong
> > impression that this patch fixes an bug introduced in a previous commit,
> > otherwise it might end up being backported unnecessarily.
> 
>     OK, no dire need to backport indeed...
> 
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>> Reviewed-by: Laurent Pinchart
> >>> <laurent.pinchart+renesas@ideasonboard.com>
> >>> [Set the mode and input at the same time as the BEN and LVEN bits]
> >>> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> Signed-off-by: Laurent Pinchart
> >>> <laurent.pinchart+renesas@ideasonboard.com>
> >>> ---
> >>> 
> >>>    drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 14 +++++++-------
> >>>    1 file changed, 7 insertions(+), 7 deletions(-)
> >>> 
> >>> Hi Sergei,
> >>> 
> >>> For your convenience (and if you agree with bundling mode setup with the
> >>> first write as explained in my review of patch 1/2), here's the updated
> >>> version of patch 2/2 that I have taken in my development branch. If
> >>> you're fine with it I'll keep it, otherwise we can continue the review
> >>> discussion.
> >> 
> >> As I said, I don't know how to interpret the note 3 in either manual.
> 
> Moreover, it seems to me that the notes don't match the start-up procedure
> anymore...

How so ?

> > As explained in my latest reply to patch 1/2, my understanding is that the
> > parameters can be programmed at any time before step 6. The fact that the
> > current code works seems to confirm that interpretation. We could ask
> > Renesas for a confirmation if you want.
> 
> Would be good to ask, indeed.

I'll ask.

-- 
Regards,

Laurent Pinchart
