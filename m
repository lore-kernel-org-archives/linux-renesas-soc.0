Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>, Archit Taneja <architt@codeaurora.org>, Fabio Estevam <fabio.estevam@freescale.com>, Heiko Stuebner <heiko@sntech.de>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Mark Yao <mark.yao@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Ulrich Hecht <ulrich.hecht@gmail.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/22] drm: bridge: dw-hdmi: Abstract the platform PHY configuration
Date: Fri, 02 Dec 2016 16:09:34 +0200
Message-ID: <1574414.1AHBzqbLxV@avalon>
In-Reply-To: <1658cf45-17e0-58cf-13c9-63e6d78a9725@synopsys.com>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1480635817-1258-13-git-send-email-laurent.pinchart+renesas@ideasonboard.com> <1658cf45-17e0-58cf-13c9-63e6d78a9725@synopsys.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jose,

On Friday 02 Dec 2016 11:15:19 Jose Abreu wrote:
> On 01-12-2016 23:43, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Platforms implement the dw-hdmi with a separate PHY entity. It is
> > configured over it's own I2C bus. To allow for different PHY's to be
> > configured from the dw-hdmi driver, abstract the actual programming of
> > the PHY to its own functions, as configured by the platform.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart
> > <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> > drivers/gpu/drm/bridge/dw-hdmi.c            | 79 +++++++++++++++---------
> > drivers/gpu/drm/imx/dw_hdmi-imx.c           |  2 +
> > drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  1 +
> > include/drm/bridge/dw_hdmi.h                | 12 +++++
> > 4 files changed, 63 insertions(+), 31 deletions(-)

[snip]

> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> > index e551b457c100..fa7655836c81 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -52,6 +52,10 @@ struct dw_hdmi_plat_data {
> >  	const struct dw_hdmi_mpll_config *mpll_cfg;
> >  	const struct dw_hdmi_curr_ctrl *cur_ctr;
> >  	const struct dw_hdmi_phy_config *phy_config;
> > +	int (*configure_phy)(struct dw_hdmi *hdmi,
> > +			     const struct dw_hdmi_plat_data *pdata,
> > +			     unsigned long mpixelclock,
> > +			     enum dw_hdmi_resolution resolution);
> 
> I think the name of this callback here is a little bit misleading
> because you are only configuring the phy pll. Maybe
> .configure_phy_pll() would be more suitable.

Isn't there more than the PLL ? For instance register TXTERM configures the 
transmission line termination.

> >  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
> >  	
> >  					   struct drm_display_mode *mode);
> >  
> >  };

-- 
Regards,

Laurent Pinchart
