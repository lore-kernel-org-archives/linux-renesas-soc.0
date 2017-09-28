Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:46170 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750759AbdI1JQs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 05:16:48 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: kieran.bingham@ideasonboard.com,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] drm: rcar-du: Reject planes located fully off-screen
Date: Thu, 28 Sep 2017 12:16:48 +0300
Message-ID: <37669611.vtIjLgZvls@avalon>
In-Reply-To: <20170928071034.ovxweoxdp3sb3ij2@phenom.ffwll.local>
References: <20170815230338.14913-1-laurent.pinchart+renesas@ideasonboard.com> <b2179a21-51aa-e973-73de-fd657ecfedb5@ideasonboard.com> <20170928071034.ovxweoxdp3sb3ij2@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Thursday, 28 September 2017 10:10:34 EEST Daniel Vetter wrote:
> On Wed, Sep 27, 2017 at 07:58:42PM +0100, Kieran Bingham wrote:
> > Hi Laurent,
> > 
> > Thankyou for the patch,
> > 
> > This looks good, and passes the tests.
> > 
> > On 16/08/17 00:03, Laurent Pinchart wrote:
> > > There is no point in accepting fully off-screen planes as they won't be
> > > displayed. Reject them in the atomic check.
> > > 
> > > Signed-off-by: Laurent Pinchart
> > > <laurent.pinchart+renesas@ideasonboard.com>
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Just a note, this is different from what i915 does. Not sure you want to
> intentionally be incompatible with i915 and hence defacto make this part
> of atomic undefined (or break some apps, depending upon how this pans
> out). I think X loves to put the cursor offscreen at least.
> 
> I think we even have igts to test this properly.

If you update the documentation I'll submit a v2 that allows fully off-screen 
planes :-)

-- 
Regards,

Laurent Pinchart
