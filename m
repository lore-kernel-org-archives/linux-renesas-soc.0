Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:51242 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbeINCUC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 22:20:02 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: jacopo mondi <jacopo@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/16] drm: bridge: thc63: Restrict modes based on hardware operating frequency
Date: Fri, 14 Sep 2018 00:08:50 +0300
Message-ID: <1575091.vT7yhvHn82@avalon>
In-Reply-To: <20180911133155.GV28160@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com> <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com> <20180911133155.GV28160@w540>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Tuesday, 11 September 2018 16:31:55 EEST jacopo mondi wrote:
> Hi Laurent,
>    sorry, I might be confused but,
> 
> On Tue, Sep 04, 2018 at 03:10:15PM +0300, Laurent Pinchart wrote:
> > The THC63LVD1024 is restricted to a pixel clock frequency in the range
> > of 8 to 135 MHz. Implement the bridge .mode_valid() operation
> > accordingly.
> > 
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> >  drivers/gpu/drm/bridge/thc63lvd1024.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c
> > b/drivers/gpu/drm/bridge/thc63lvd1024.c index c8b9edd5a7f4..63609ba16b6d
> > 100644
> > --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> > +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> > @@ -45,6 +45,23 @@ static int thc63_attach(struct drm_bridge *bridge)
> >  	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
> >  }
> > 
> > +static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
> > +					const struct drm_display_mode *mode)
> > +{
> > +	/*
> > +	 * The THC63LVD0124 clock frequency range is 8 to 135 MHz in single-in,
> > +	 * single-out mode. Note that the limits depends on the mode and will
> > +	 * need to be adjusted accordingly.
> > +	 */
> > +	if (mode->clock < 8000)
> > +		return MODE_CLOCK_LOW;
> > +
> > +	if (mode->clock > 135000)
> > +		return MODE_CLOCK_HIGH;
> > +
> > +	return MODE_OK;
> > +}
> > +
> 
> Are we talking about the CLKOUT frequency? Because that's the one I
> see depending on the dual/single output mode, and I assume we're
> checking for the mode->clock of the DRM mode to be applied to the
> connector (which receives an RGB stream from this bridge).
> 
> In case we're talking about CLKOUT, I read
> 
> "Dual LVDS port IN/Dual TTL port Out Mode:
>  8 - 135MHz(CLKOUT)
>  Dual LVDS port IN/Single TTL port Out Mode:
>  40 - 150MHz(CLKOUT)"
> 
> If we're talking about the PLL input clock (RCLK) then used to
> generate CLKOUT it's indeed defined in the 8-135Mhz range, but
> I don't see mention on it depending on the mode.

This is about the input clock on the LVDS side of the LVDS decoder, named 
RCLK. It is received from the LVDS interface on the other side and its 
frequency is equal to the pixel clock.

> >  static void thc63_enable(struct drm_bridge *bridge)
> >  {
> >  	struct thc63_dev *thc63 = to_thc63(bridge);
> > @@ -77,6 +94,7 @@ static void thc63_disable(struct drm_bridge *bridge)
> > 
> >  static const struct drm_bridge_funcs thc63_bridge_func = {
> >  	.attach	= thc63_attach,
> > +	.mode_valid = thc63_mode_valid,
> >  	.enable = thc63_enable,
> >  	.disable = thc63_disable,
> >  };

-- 
Regards,

Laurent Pinchart
