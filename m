Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43092 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751093AbeB1E6u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 23:58:50 -0500
Subject: Re: [RFC][PATCH 04/11] drm: Split the display info into static and
 dynamic parts
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Alison Wang <alison.wang@freescale.com>,
        Eric Anholt <eric@anholt.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
 <20180227125700.6527-5-ville.syrjala@linux.intel.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <0b81d1f7-4000-2acb-0565-b53c3ab6187f@codeaurora.org>
Date: Wed, 28 Feb 2018 10:28:39 +0530
MIME-Version: 1.0
In-Reply-To: <20180227125700.6527-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On Tuesday 27 February 2018 06:26 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Currently we have a mix of static and dynamic information stored in
> the display info structure. That makes it rather difficult to repopulate
> the dynamic parts when a new EDID appears. Let's make life easier by
> splitting the structure up into static and dynamic parts.
> 
> The static part will consist of subpixel_order, panel_orientation,
> and bus_formats.
> 
> Actually I'm not sure where bus_formats & co. fit in all this. For some
> drivers those seem to be static, even though they might fill them out
> from .get_modes(). For other drivers this stuff even gets frobbed at
> runtime, making it more some kind of a bastard encoder/connector state.
> I'll just stick it into the static side so that the behaviour doesn't
> change when I start clear out the entire dynamic state with memset().
>

[...]

>   
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index b1ab4ab09532..abd0bce9c31e 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -174,7 +174,7 @@ static int sii902x_get_modes(struct drm_connector *connector)
>   		kfree(edid);
>   	}
>   
> -	ret = drm_display_info_set_bus_formats(&connector->display_info,
> +	ret = drm_display_info_set_bus_formats(&connector->static_display_info,
>   					       &bus_format, 1);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 08ab7d6aea65..042ded9ca749 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1193,7 +1193,7 @@ static int tc_bridge_attach(struct drm_bridge *bridge)
>   	if (tc->panel)
>   		drm_panel_attach(tc->panel, &tc->connector);
>   
> -	drm_display_info_set_bus_formats(&tc->connector.display_info,
> +	drm_display_info_set_bus_formats(&tc->connector.static_display_info,
>   					 &bus_format, 1);
>   	drm_mode_connector_attach_encoder(&tc->connector, tc->bridge.encoder);
>   

The sii902x driver sets the bus_formats in get_modes, but it's a fixed 
value and we may as well do it in bridge's attach op.

For the bridge drivers:

Reviewed-by: Archit Taneja <architt@codeaurora.org>

Thanks,
Archit
