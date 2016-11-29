Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44172 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757115AbcK2K1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 05:27:20 -0500
Subject: Re: [PATCH v3 03/13] drm: bridge: Link encoder and bridge in core
 code
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1480410283-28698-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@freescale.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Rongrong Zou <zourongrong@gmail.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        CK Hu <ck.hu@mediatek.com>, Rob Clark <robdclark@gmail.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <94e6b51f-71bf-8734-a843-e236ea1e8ff1@codeaurora.org>
Date: Tue, 29 Nov 2016 15:57:06 +0530
MIME-Version: 1.0
In-Reply-To: <1480410283-28698-4-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 11/29/2016 02:34 PM, Laurent Pinchart wrote:
> Instead of linking encoders and bridges in every driver (and getting it
> wrong half of the time, as many drivers forget to set the drm_bridge
> encoder pointer), do so in core code. The drm_bridge_attach() function
> needs the encoder and optional previous bridge to perform that task,
> update all the callers.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c   |  4 +-
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  4 +-
>  drivers/gpu/drm/bridge/dw-hdmi.c                   |  3 +-
>  drivers/gpu/drm/drm_bridge.c                       | 46 ++++++++++++++++------
>  drivers/gpu/drm/drm_simple_kms_helper.c            |  4 +-
>  drivers/gpu/drm/exynos/exynos_dp.c                 |  5 +--
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c            |  6 +--
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          |  5 +--
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c       |  5 +--
>  drivers/gpu/drm/imx/imx-ldb.c                      |  6 +--
>  drivers/gpu/drm/imx/parallel-display.c             |  4 +-
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  8 ++--
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 | 24 ++---------
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                | 11 +++---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c              | 17 +++++---
>  drivers/gpu/drm/msm/edp/edp_bridge.c               |  2 +-
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_hdmienc.c          |  5 +--
>  drivers/gpu/drm/sti/sti_dvo.c                      |  3 +-
>  drivers/gpu/drm/sti/sti_hda.c                      |  3 +-
>  drivers/gpu/drm/sti/sti_hdmi.c                     |  3 +-
>  drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 +++---
>  include/drm/drm_bridge.h                           |  3 +-
>  23 files changed, 83 insertions(+), 103 deletions(-)
>
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> index 6119b5085501..e7799b6ee829 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_output.c
> @@ -230,9 +230,7 @@ static int atmel_hlcdc_attach_endpoint(struct drm_device *dev,
>  	of_node_put(np);
>
>  	if (bridge) {
> -		output->encoder.bridge = bridge;
> -		bridge->encoder = &output->encoder;
> -		ret = drm_bridge_attach(dev, bridge);
> +		ret = drm_bridge_attach(&output->encoder, bridge, NULL);
>  		if (!ret)
>  			return 0;
>  	}
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 6e0447f329a2..1835f1fdad19 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1227,12 +1227,10 @@ static int analogix_dp_create_bridge(struct drm_device *drm_dev,
>
>  	dp->bridge = bridge;
>
> -	dp->encoder->bridge = bridge;
>  	bridge->driver_private = dp;
> -	bridge->encoder = dp->encoder;
>  	bridge->funcs = &analogix_dp_bridge_funcs;
>
> -	ret = drm_bridge_attach(drm_dev, bridge);
> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL);
>  	if (ret) {
>  		DRM_ERROR("failed to attach drm bridge\n");
>  		return -EINVAL;
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index b71088dab268..432e0e3fff72 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -1841,13 +1841,12 @@ static int dw_hdmi_register(struct drm_device *drm, struct dw_hdmi *hdmi)
>  	hdmi->bridge = bridge;
>  	bridge->driver_private = hdmi;
>  	bridge->funcs = &dw_hdmi_bridge_funcs;
> -	ret = drm_bridge_attach(drm, bridge);
> +	ret = drm_bridge_attach(encoder, bridge, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to initialize bridge with drm\n");
>  		return -EINVAL;
>  	}
>
> -	encoder->bridge = bridge;
>  	hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
>
>  	drm_connector_helper_add(&hdmi->connector,
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 0ee052b7c21a..850bd6509ef1 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -26,6 +26,7 @@
>  #include <linux/mutex.h>
>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_encoder.h>
>
>  /**
>   * DOC: overview
> @@ -92,32 +93,53 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  EXPORT_SYMBOL(drm_bridge_remove);
>
>  /**
> - * drm_bridge_attach - associate given bridge to our DRM device
> + * drm_bridge_attach - attach the bridge to an encoder's chain
>   *
> - * @dev: DRM device
> - * @bridge: bridge control structure
> + * @encoder: DRM encoder
> + * @bridge: bridge to attach
> + * @previous: previous bridge in the chain (optional)
>   *
> - * Called by a kms driver to link one of our encoder/bridge to the given
> - * bridge.
> + * Called by a kms driver to link the bridge to an encoder's chain. The previous
> + * argument specifies the previous bridge in the chain. If NULL, the bridge is
> + * linked directly at the encoder's output. Otherwise it is linked at the
> + * previous bridge's output.
>   *
> - * Note that setting up links between the bridge and our encoder/bridge
> - * objects needs to be handled by the kms driver itself.
> + * If non-NULL the previous bridge must be already attached by a call to this
> + * function.
>   *
>   * RETURNS:
>   * Zero on success, error code on failure
>   */
> -int drm_bridge_attach(struct drm_device *dev, struct drm_bridge *bridge)
> +int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
> +		      struct drm_bridge *previous)
>  {
> -	if (!dev || !bridge)
> +	int ret;
> +
> +	if (!encoder || !bridge)
> +		return -EINVAL;

I think we could derive previous from the encoder itself. Something like:

	previous = encoder->bridge;
	while (previous && previous->next)
		previous = previous->next;
		
> +
> +	if (previous && (!previous->dev || previous->encoder != encoder))
>  		return -EINVAL;
>
>  	if (bridge->dev)
>  		return -EBUSY;
>
> -	bridge->dev = dev;
> +	bridge->dev = encoder->dev;
> +	bridge->encoder = encoder;
> +
> +	if (bridge->funcs->attach) {
> +		ret = bridge->funcs->attach(bridge);
> +		if (ret < 0) {
> +			bridge->dev = NULL;
> +			bridge->encoder = NULL;
> +			return ret;
> +		}
> +	}
>
> -	if (bridge->funcs->attach)
> -		return bridge->funcs->attach(bridge);
> +	if (previous)
> +		previous->next = bridge;
> +	else
> +		encoder->bridge = bridge;
>
>  	return 0;
>  }

<snip>

Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
