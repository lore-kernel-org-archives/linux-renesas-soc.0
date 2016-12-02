Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:34112 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933094AbcLBO0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 09:26:21 -0500
Date: Fri, 2 Dec 2016 14:24:01 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org,
        Andy Yan <andy.yan@rock-chips.com>,
        Archit Taneja <architt@codeaurora.org>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mark Yao <mark.yao@rock-chips.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 13/22] drm: bridge: dw-hdmi: Replace device type with
 platform quirks
Message-ID: <20161202142401.GD14217@n2100.armlinux.org.uk>
References: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480635817-1258-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480635817-1258-14-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Dec 02, 2016 at 01:43:28AM +0200, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The dw-hdmi driver declares a dev_type to distinguish platform specific
> changes. Replace this with a quirk field, so that the platform can
> specify the required quirks for the driver, rather than the driver
> becoming conditional on multiple platforms.
> 
> As part of this, we rename the dw-hdmi 'spare' which is defined as the
> SVSRET bit in later documentation.

I'd really prefer that we did not go down the broken route of adding
a set of "quirk" flags - look at what a mess SDHCI has become through
allowing that kind of practice.

I'd much rather we find a saner structure to this - and we know that
the hardware has ID registers in it which can be used (so far) to
identify the buggy hardware.


> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c            | 14 ++++++--------
>  drivers/gpu/drm/bridge/dw-hdmi.h            |  4 ++--
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           |  3 +--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
>  include/drm/bridge/dw_hdmi.h                | 12 +++++-------
>  5 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index 06a44a2cdf3b..26607185722f 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -118,7 +118,6 @@ struct dw_hdmi {
>  	struct drm_bridge bridge;
>  
>  	struct platform_device *audio;
> -	enum dw_hdmi_devtype dev_type;
>  	struct device *dev;
>  	struct clk *isfr_clk;
>  	struct clk *iahb_clk;
> @@ -896,11 +895,11 @@ static void dw_hdmi_phy_enable_tmds(struct dw_hdmi *hdmi, u8 enable)
>  			 HDMI_PHY_CONF0_ENTMDS_MASK);
>  }
>  
> -static void dw_hdmi_phy_enable_spare(struct dw_hdmi *hdmi, u8 enable)
> +static void dw_hdmi_phy_enable_svsret(struct dw_hdmi *hdmi, u8 enable)
>  {
>  	hdmi_mask_writeb(hdmi, enable, HDMI_PHY_CONF0,
> -			 HDMI_PHY_CONF0_SPARECTRL_OFFSET,
> -			 HDMI_PHY_CONF0_SPARECTRL_MASK);
> +			 HDMI_PHY_CONF0_SVSRET_OFFSET,
> +			 HDMI_PHY_CONF0_SVSRET_MASK);
>  }
>  
>  static void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable)
> @@ -1031,8 +1030,8 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
>  	dw_hdmi_phy_gen2_txpwron(hdmi, 1);
>  	dw_hdmi_phy_gen2_pddq(hdmi, 0);
>  
> -	if (hdmi->dev_type == RK3288_HDMI)
> -		dw_hdmi_phy_enable_spare(hdmi, 1);
> +	if (pdata->quirks & DW_HDMI_QUIRK_PHY_SVSRET)
> +		dw_hdmi_phy_enable_svsret(hdmi, 1);

If we get a proper split between the encoder and the PHY, this should be
dealt with at the PHY side of the driver.

>  
>  	/*Wait for PHY PLL lock */
>  	msec = 5;
> @@ -1348,7 +1347,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>  	hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ, HDMI_MC_SWRSTZ);
>  
>  	val = hdmi_readb(hdmi, HDMI_FC_INVIDCONF);
> -	if (hdmi->dev_type == IMX6DL_HDMI) {
> +	if (hdmi->plat_data->quirks & DW_HDMI_QUIRK_FC_INVIDCONF) {
>  		hdmi_writeb(hdmi, val, HDMI_FC_INVIDCONF);
>  		return;
>  	}

This is a bug found on iMX6DL versions of the IP - I don't have a 6DL
board powered up at the moment to grab its revision information, but
it would be nice to make that conditional on the revision.  From what
I gather, it's a workaround issued by Synopsis rather than specific
to the (ex)FSL implementation.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
