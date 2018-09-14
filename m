Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:34208 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbeINP2M (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 11:28:12 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-kernel@vger.kernel.org, kbingham@kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] MAINTAINERS: rcar-du: Add co-maintainer
Date: Fri, 14 Sep 2018 13:14:36 +0300
Message-ID: <1670376.fKoVCqDDkR@avalon>
In-Reply-To: <20180913093700.GZ28160@w540>
References: <20180806143904.4716-1-kieran.bingham@ideasonboard.com> <20180913093700.GZ28160@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Thursday, 13 September 2018 12:37:00 EEST jacopo mondi wrote:
> Hi Kieran, Laurent
> 
> On Mon, Aug 06, 2018 at 03:39:01PM +0100, Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Add myself as a co-maintainer for the Renesas DRM drivers.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > ---
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > 
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7cebd5bba8a8..c7cecb9201b3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4764,6 +4764,7 @@
> > F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.
> > txt
> >  DRM DRIVERS FOR RENESAS
> >  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > +M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >  L:	dri-devel@lists.freedesktop.org
> >  L:	linux-renesas-soc@vger.kernel.org
> >  T:	git git://linuxtv.org/pinchartl/fbdev
> 
> Am I wrong or this git repository isn't actual anymore for DU?

You're right, the fix will be in my pull request for v4.20.

-- 
Regards,

Laurent Pinchart
