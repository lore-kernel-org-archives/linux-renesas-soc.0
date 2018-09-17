Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:28696 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbeIQQUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 12:20:34 -0400
Date: Mon, 17 Sep 2018 12:53:43 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <891115091.239809.1537181623129@webmail.strato.com>
In-Reply-To: <20180914091046.483-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-5-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 04/16] drm: bridge: thc63: Restrict modes based on
 hardware operating frequency
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Thank you for your patch!

> On September 14, 2018 at 11:10 AM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> 
> 
> The THC63LVD1024 is restricted to a pixel clock frequency in the range
> of 8 to 135 MHz. Implement the bridge .mode_valid() operation
> accordingly.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index c8b9edd5a7f4..63609ba16b6d 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -45,6 +45,23 @@ static int thc63_attach(struct drm_bridge *bridge)
>  	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
>  }
>  
> +static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
> +					const struct drm_display_mode *mode)
> +{
> +	/*
> +	 * The THC63LVD0124 clock frequency range is 8 to 135 MHz in single-in,

That should be THC63LVD1024.

> +	 * single-out mode.

For the input clock (that's what we're talking about, right?), that also applies to single-in/dual-out. Maybe just omit the "single-out" clause?

> Note that the limits depends on the mode and will
> +	 * need to be adjusted accordingly.
> +	 */

I don't quite understand. Does that refer to the THC63 mode, or the DRM mode?

> +	if (mode->clock < 8000)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > 135000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static void thc63_enable(struct drm_bridge *bridge)
>  {
>  	struct thc63_dev *thc63 = to_thc63(bridge);
> @@ -77,6 +94,7 @@ static void thc63_disable(struct drm_bridge *bridge)
>  
>  static const struct drm_bridge_funcs thc63_bridge_func = {
>  	.attach	= thc63_attach,
> +	.mode_valid = thc63_mode_valid,
>  	.enable = thc63_enable,
>  	.disable = thc63_disable,
>  };
> -- 
> Regards,
> 
> Laurent Pinchart
>

CU
Uli
