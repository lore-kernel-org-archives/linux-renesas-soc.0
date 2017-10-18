Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH v5 8/9] drm/bridge/synopsys: dw-hdmi: Do not use device's
 drvdata
To: Jeffy Chen <jeffy.chen@rock-chips.com>,
        linux-kernel@vger.kernel.org
Cc: briannorris@chromium.org, seanpaul@chromium.org,
        dianders@chromium.org, heiko@sntech.de, tfiga@chromium.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Romain Perier <romain.perier@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        dri-devel@lists.freedesktop.org,
        Kevin Hilman <khilman@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-rockchip@lists.infradead.org,
        Carlo Caione <carlo@caione.org>,
        linux-amlogic@lists.infradead.org,
        Archit Taneja <architt@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Mark Yao <mark.yao@rock-chips.com>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        David Airlie <airlied@linux.ie>
References: <20171018120944.7819-1-jeffy.chen@rock-chips.com>
 <20171018120944.7819-9-jeffy.chen@rock-chips.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <40e49fc2-fd7d-12ab-fe49-b4d0586b65a1@baylibre.com>
Date: Wed, 18 Oct 2017 18:03:03 +0200
MIME-Version: 1.0
In-Reply-To: <20171018120944.7819-9-jeffy.chen@rock-chips.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 18/10/2017 14:09, Jeffy Chen wrote:
> Let plat drivers own the drvdata, so that they could cleanup resources
> in their unbind().
> 
> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
> ---
> 
> Changes in v5: None
> 
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c   | 43 ++++++++++-------------------
>  drivers/gpu/drm/imx/dw_hdmi-imx.c           | 22 +++++++++------
>  drivers/gpu/drm/meson/meson_dw_hdmi.c       | 20 ++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c      | 14 ++++++++--
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 23 ++++++++-------
>  include/drm/bridge/dw_hdmi.h                | 17 ++++++------
>  6 files changed, 77 insertions(+), 62 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index cef414466f9f..fc29f69f7108 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -138,6 +138,8 @@ struct meson_dw_hdmi {
>  	struct clk *hdmi_pclk;
>  	struct clk *venci_clk;
>  	u32 irq_stat;
> +
> +	struct dw_hdmi *hdmi;
>  };
>  #define encoder_to_meson_dw_hdmi(x) \
>  	container_of(x, struct meson_dw_hdmi, encoder)
> @@ -526,7 +528,7 @@ static irqreturn_t dw_hdmi_top_thread_irq(int irq, void *dev_id)
>  		if (stat & HDMITX_TOP_INTR_HPD_RISE)
>  			hpd_connected = true;
>  
> -		dw_hdmi_setup_rx_sense(dw_hdmi->dev, hpd_connected,
> +		dw_hdmi_setup_rx_sense(dw_hdmi->hdmi, hpd_connected,
>  				       hpd_connected);
>  
>  		drm_helper_hpd_irq_event(dw_hdmi->encoder.dev);
> @@ -865,9 +867,14 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  	dw_plat_data->input_bus_format = MEDIA_BUS_FMT_YUV8_1X24;
>  	dw_plat_data->input_bus_encoding = V4L2_YCBCR_ENC_709;
>  
> -	ret = dw_hdmi_bind(pdev, encoder, &meson_dw_hdmi->dw_plat_data);
> -	if (ret)
> -		return ret;
> +	meson_dw_hdmi->hdmi = dw_hdmi_bind(pdev, encoder,
> +					   &meson_dw_hdmi->dw_plat_data);
> +	if (IS_ERR(meson_dw_hdmi->hdmi)) {
> +		encoder->funcs->destroy(encoder);
> +		return PTR_ERR(meson_dw_hdmi->hdmi);
> +	}
> +
> +	dev_set_drvdata(dev, meson_dw_hdmi);
>  
>  	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>  
> @@ -877,7 +884,10 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>  				   void *data)
>  {
> -	dw_hdmi_unbind(dev);
> +	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +
> +	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +	meson_dw_hdmi->encoder.funcs->destroy(&meson_dw_hdmi->encoder);
>  }
>  
>  static const struct component_ops meson_dw_hdmi_ops = {

[...]

For meson/meson_dw_hdmi.c :

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
