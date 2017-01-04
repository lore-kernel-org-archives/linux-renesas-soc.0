Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:32982 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751771AbdADL6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 06:58:23 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2.1 04/13] drm: Add data transmission order bus flag
Date: Wed, 04 Jan 2017 13:58:26 +0200
Message-ID: <4668322.BBvS3ppBQr@avalon>
In-Reply-To: <20170104070654.GB5729@ulmo.ba.sec>
References: <7f668e382fa001811f961abfb398c9c9@agner.ch> <20170104003926.29683-1-laurent.pinchart+renesas@ideasonboard.com> <20170104070654.GB5729@ulmo.ba.sec>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Thierry,

On Wednesday 04 Jan 2017 08:06:54 Thierry Reding wrote:
> On Wed, Jan 04, 2017 at 02:39:26AM +0200, Laurent Pinchart wrote:
> > The flags indicate whether data is transmitted lsb to msb or msb to lsb
> > on the bus.
> > 
> > The exact meaning is bus-type dependent. For instance, for LVDS buses
> > the flags indicate whether the seven data bits transmitted in a clock
> > pulse are sent in normal order (msb to lsb, slots 0 to 6) or reverse
> > order (lsb to msb, slots 6 to 0).
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Rename the flag to DRM_BUS_FLAG_DATA_LSB_TO_MSB and add a
> > 
> >   corresponding DRM_BUS_FLAG_DATA_MSB_TO_LSB flag.
> > 
> > ---
> > 
> >  include/drm/drm_connector.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index a9b95246e26e..712f255577ea 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -160,6 +160,10 @@ struct drm_display_info {
> > 
> >  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
> >  /* drive data on neg. edge */
> >  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> > 
> > +/* data is transmitted msb to lsb on the bus */
> > +#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
> > +/* data is transmitted lsb to msb on the bus */
> > +#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)
> 
> Nit: "LSB" and "MSB" because they're abbreviations. If I end up applying
> this I'll probably do that myself, and I leave it up to whoever else
> might apply it whether or not they want to be pedantic, so:
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>

Thank you. I'll fix that in my tree too. I went for lower case because bit is 
usually abbreviated b and byte B, but I don't think it really conveys that 
meaning anyway :-)

-- 
Regards,

Laurent Pinchart
