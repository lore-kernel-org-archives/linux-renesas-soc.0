Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55061 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753081AbeB0NX0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Feb 2018 08:23:26 -0500
Message-ID: <1519737781.3402.15.camel@pengutronix.de>
Subject: Re: [RFC][PATCH 04/11] drm: Split the display info into static and
 dynamic parts
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Keith Packard <keithp@keithp.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Shashank Sharma <shashank.sharma@intel.com>,
        Stefan Agner <stefan@agner.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Manfred Schlaegl <manfred.schlaegl@gmx.at>,
        Marek Vasut <marex@denx.de>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Alison Wang <alison.wang@freescale.com>,
        Eric Anholt <eric@anholt.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime.ripard@bootlin.com>
Date: Tue, 27 Feb 2018 14:23:01 +0100
In-Reply-To: <20180227125700.6527-5-ville.syrjala@linux.intel.com>
References: <20180227125700.6527-1-ville.syrjala@linux.intel.com>
         <20180227125700.6527-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 2018-02-27 at 14:56 +0200, Ville Syrjala wrote:
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
> from .get_modes().
>
> For other drivers this stuff even gets frobbed at
> runtime, making it more some kind of a bastard encoder/connector state.
> I'll just stick it into the static side so that the behaviour doesn't
> change when I start clear out the entire dynamic state with memset().

[...]
>  drivers/gpu/drm/imx/imx-ldb.c                      |   4 +-
>  drivers/gpu/drm/imx/parallel-display.c             |   2 +-

For imx-drm,
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
