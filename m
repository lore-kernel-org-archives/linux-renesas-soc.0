Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:53010 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752613AbdCBSRK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Mar 2017 13:17:10 -0500
Subject: Re: [PATCH v4 8/9] drm: bridge: dw-hdmi: Remove device type from
 platform data
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170301223915.29888-9-laurent.pinchart+renesas@ideasonboard.com>
CC: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nickey Yang <nickey.yang@rock-chips.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <c8b05dea-86b9-f9bf-735a-f0d6e31e99b7@synopsys.com>
Date: Thu, 2 Mar 2017 12:51:23 +0000
MIME-Version: 1.0
In-Reply-To: <20170301223915.29888-9-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 01-03-2017 22:39, Laurent Pinchart wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The device type isn't used anymore now that workarounds and PHY-specific
> operations are performed based on version information read at runtime.
> Remove it.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jose Abreu <joabreu@synopsys.com>

Best regards,
Jose Miguel Abreu

> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c            | 2 --
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           | 2 --
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 1 -
>  include/drm/bridge/dw_hdmi.h                | 7 -------
>  4 files changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index b835d81bb471..132c00685796 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -127,7 +127,6 @@ struct dw_hdmi {
>  	struct drm_connector connector;
>  	struct drm_bridge bridge;
>  
> -	enum dw_hdmi_devtype dev_type;
>  	unsigned int version;
>  
>  	struct platform_device *audio;
> @@ -2014,7 +2013,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  
>  	hdmi->plat_data = plat_data;
>  	hdmi->dev = dev;
> -	hdmi->dev_type = plat_data->dev_type;
>  	hdmi->sample_rate = 48000;
>  	hdmi->disabled = true;
>  	hdmi->rxsense = true;
> diff --git a/drivers/gpu/drm/imx/dw_hdmi-imx.c b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> index f645275e6e63..f039641070ac 100644
> --- a/drivers/gpu/drm/imx/dw_hdmi-imx.c
> +++ b/drivers/gpu/drm/imx/dw_hdmi-imx.c
> @@ -175,7 +175,6 @@ static struct dw_hdmi_plat_data imx6q_hdmi_drv_data = {
>  	.mpll_cfg   = imx_mpll_cfg,
>  	.cur_ctr    = imx_cur_ctr,
>  	.phy_config = imx_phy_config,
> -	.dev_type   = IMX6Q_HDMI,
>  	.mode_valid = imx6q_hdmi_mode_valid,
>  };
>  
> @@ -183,7 +182,6 @@ static struct dw_hdmi_plat_data imx6dl_hdmi_drv_data = {
>  	.mpll_cfg = imx_mpll_cfg,
>  	.cur_ctr  = imx_cur_ctr,
>  	.phy_config = imx_phy_config,
> -	.dev_type = IMX6DL_HDMI,
>  	.mode_valid = imx6dl_hdmi_mode_valid,
>  };
>  
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index a6d4a0236e8f..d53827413996 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -237,7 +237,6 @@ static const struct dw_hdmi_plat_data rockchip_hdmi_drv_data = {
>  	.mpll_cfg   = rockchip_mpll_cfg,
>  	.cur_ctr    = rockchip_cur_ctr,
>  	.phy_config = rockchip_phy_config,
> -	.dev_type   = RK3288_HDMI,
>  };
>  
>  static const struct of_device_id dw_hdmi_rockchip_dt_ids[] = {
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index dd330259a3dc..545f04fae3b6 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -21,12 +21,6 @@ enum {
>  	DW_HDMI_RES_MAX,
>  };
>  
> -enum dw_hdmi_devtype {
> -	IMX6Q_HDMI,
> -	IMX6DL_HDMI,
> -	RK3288_HDMI,
> -};
> -
>  enum dw_hdmi_phy_type {
>  	DW_HDMI_PHY_DWC_HDMI_TX_PHY = 0x00,
>  	DW_HDMI_PHY_DWC_MHL_PHY_HEAC = 0xb2,
> @@ -65,7 +59,6 @@ struct dw_hdmi_phy_ops {
>  };
>  
>  struct dw_hdmi_plat_data {
> -	enum dw_hdmi_devtype dev_type;
>  	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
>  					   struct drm_display_mode *mode);
>  
