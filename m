Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35524 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751367AbdITSP5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 14:15:57 -0400
Received: by mail-pf0-f194.google.com with SMTP id i23so1489550pfi.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Sep 2017 11:15:56 -0700 (PDT)
Date: Wed, 20 Sep 2017 20:15:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm: rcar-du: Don't set connector DPMS property
Message-ID: <20170920181549.GB25248@dvetter-linux.ger.corp.intel.com>
References: <20170815130545.2225-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170815130545.2225-2-laurent.pinchart+renesas@ideasonboard.com>
 <4050000.DqEiLjPiul@avalon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4050000.DqEiLjPiul@avalon>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 15, 2017 at 08:23:19PM +0300, Laurent Pinchart wrote:
> Gentle review ping.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> on both.

Please push to drm-misc or wherever.

Thanks, Daniel

> 
> On Tuesday, 15 August 2017 16:05:45 EEST Laurent Pinchart wrote:
> > Since commit 4a97a3da420b ("drm: Don't update property values for atomic
> > drivers") atomic drivers must not update property values as properties
> > are read from the state instead. To catch remaining users, the
> > drm_object_property_set_value() function now throws a warning when
> > called by atomic drivers on non-immutable properties, and we hit that
> > warning when creating connectors.
> > 
> > The easy fix is to just remove the drm_object_property_set_value() as it
> > is used here to set the initial value of the connector's DPMS property
> > to OFF. The DPMS property applies on top of the connector's state crtc
> > pointer (initialized to NULL) that is the main connector on/off control,
> > and should thus default to ON.
> > 
> > Fixes: 4a97a3da420b ("drm: Don't update property values for atomic drivers")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > This patch fixes a regression in drm-next and should be merged in v4.14-rc1.
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
> > b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c index
> > b373ad48ef5f..e96f2df0c305 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_lvdscon.c
> > @@ -79,10 +79,6 @@ int rcar_du_lvds_connector_init(struct rcar_du_device
> > *rcdu,
> > 
> >  	drm_connector_helper_add(connector, &connector_helper_funcs);
> > 
> > -	connector->dpms = DRM_MODE_DPMS_OFF;
> > -	drm_object_property_set_value(&connector->base,
> > -		rcdu->ddev->mode_config.dpms_property, DRM_MODE_DPMS_OFF);
> > -
> >  	ret = drm_mode_connector_attach_encoder(connector, encoder);
> >  	if (ret < 0)
> >  		return ret;
> 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
