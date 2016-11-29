Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60977 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932974AbcK2JnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:43:05 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Alison Wang <alison.wang@freescale.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        linux-renesas-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: Re: [PATCH v3 03/13] drm: bridge: Link encoder and bridge in core code
Date: Tue, 29 Nov 2016 11:43:19 +0200
Message-ID: <6045676.cxyeoxsW2K@avalon>
In-Reply-To: <20161129093524.3ckhphbehlcjxnmf@phenom.ffwll.local>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480410283-28698-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <20161129093524.3ckhphbehlcjxnmf@phenom.ffwll.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Daniel,

On Tuesday 29 Nov 2016 10:35:24 Daniel Vetter wrote:
> On Tue, Nov 29, 2016 at 11:04:33AM +0200, Laurent Pinchart wrote:
> > Instead of linking encoders and bridges in every driver (and getting it
> > wrong half of the time, as many drivers forget to set the drm_bridge
> > encoder pointer), do so in core code. The drm_bridge_attach() function
> > needs the encoder and optional previous bridge to perform that task,
> > update all the callers.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  4 +-
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  4 +-
> >  drivers/gpu/drm/bridge/dw-hdmi.c                   |  3 +-
> >  drivers/gpu/drm/drm_bridge.c                       | 46 +++++++++++++----
> >  drivers/gpu/drm/drm_simple_kms_helper.c            |  4 +-
> >  drivers/gpu/drm/exynos/exynos_dp.c                 |  5 +--
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  6 +--
> >  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  5 +--
> >  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  5 +--
> >  drivers/gpu/drm/imx/imx-ldb.c                      |  6 +--
> >  drivers/gpu/drm/imx/parallel-display.c             |  4 +-
> >  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  8 ++--
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                 | 24 ++---------
> >  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 11 +++---
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c              | 17 +++++---
> >  drivers/gpu/drm/msm/edp/edp_bridge.c               |  2 +-
> >  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
> >  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |  5 +--
> >  drivers/gpu/drm/sti/sti_dvo.c                      |  3 +-
> >  drivers/gpu/drm/sti/sti_hda.c                      |  3 +-
> >  drivers/gpu/drm/sti/sti_hdmi.c                     |  3 +-
> >  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++---
> >  include/drm/drm_bridge.h                           |  3 +-
> >  23 files changed, 83 insertions(+), 103 deletions(-)

[snip]

> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 0ee052b7c21a..850bd6509ef1 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -26,6 +26,7 @@
> > 
> >  #include <linux/mutex.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_encoder.h>
> > 
> >  /**
> >   * DOC: overview
> > @@ -92,32 +93,53 @@ void drm_bridge_remove(struct drm_bridge *bridge)
> >  EXPORT_SYMBOL(drm_bridge_remove);
> >  
> >  /**
> > - * drm_bridge_attach - associate given bridge to our DRM device
> > + * drm_bridge_attach - attach the bridge to an encoder's chain
> >   *
> > - * @dev: DRM device
> > - * @bridge: bridge control structure
> > + * @encoder: DRM encoder
> > + * @bridge: bridge to attach
> > + * @previous: previous bridge in the chain (optional)
> >   *
> > - * Called by a kms driver to link one of our encoder/bridge to the given
> > - * bridge.
> > + * Called by a kms driver to link the bridge to an encoder's chain. The
> > previous
> > + * argument specifies the previous bridge in the chain. If NULL, the
> > bridge is
> > + * linked directly at the encoder's output. Otherwise it is linked at the
> > + * previous bridge's output.
> >   *
> > - * Note that setting up links between the bridge and our encoder/bridge
> > - * objects needs to be handled by the kms driver itself.
> > + * If non-NULL the previous bridge must be already attached by a call to
> > this
> > + * function.
> >   *
> >   * RETURNS:
> >   * Zero on success, error code on failure
> >   */
> > -int drm_bridge_attach(struct drm_device *dev, struct drm_bridge *bridge)
> > +int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge
> > *bridge,
> > +		      struct drm_bridge *previous)
> >  {
> > -	if (!dev || !bridge)
> > +	int ret;
> > +
> > +	if (!encoder || !bridge)
> > +		return -EINVAL;
> > +
> > +	if (previous && (!previous->dev || previous->encoder != encoder))
> >  		return -EINVAL;
> 
> Not sure we want to allow setting both encoder and bridge for chaining.
> I'd kinda expect that for chained use-case the bridge doesn't care that
> much who started the chain. And if not we can always create a helper to
> look up the drm_encoder.

As bridge drivers currently create connectors (I'd like to change that at some 
point, but one thing at a time) they need to call 
drm_mode_connector_attach_encoder() and thus need to have access to the 
drm_encoder object at the beginning of the chain. The drm_bridge structure has 
an encoder field, it seems to me that the easiest is to always populate it, 
regardless of the position of the bridge in the chain.

> Also, should we convert these to WARN_ON, they're kinda glaring driver (or
> well DT) bugs?

Yes, that seems like a good idea. I can add a patch on top of this one to 
convert the checks to WARN_ON, as I'd rather separate that change from the API 
change.

> Otherwise looks all reasonable to me, but deferring to Archit for final
> review.
> 
> >  	if (bridge->dev)
> >  		return -EBUSY;
> > 
> > -	bridge->dev = dev;
> > +	bridge->dev = encoder->dev;
> > +	bridge->encoder = encoder;
> > +
> > +	if (bridge->funcs->attach) {
> > +		ret = bridge->funcs->attach(bridge);
> > +		if (ret < 0) {
> > +			bridge->dev = NULL;
> > +			bridge->encoder = NULL;
> > +			return ret;
> > +		}
> > +	}
> > 
> > -	if (bridge->funcs->attach)
> > -		return bridge->funcs->attach(bridge);
> > +	if (previous)
> > +		previous->next = bridge;
> > +	else
> > +		encoder->bridge = bridge;
> > 
> >  	return 0;
> >  }
> > 

-- 
Regards,

Laurent Pinchart
