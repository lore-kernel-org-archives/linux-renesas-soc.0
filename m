Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:43849 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752909AbcLTLcM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Dec 2016 06:32:12 -0500
Subject: Re: [PATCH v2 15/29] drm: bridge: dw-hdmi: Handle overflow workaround
 based on device version
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        <dri-devel@lists.freedesktop.org>
References: <20161220013400.28317-1-laurent.pinchart+renesas@ideasonboard.com>
 <20161220013400.28317-16-laurent.pinchart+renesas@ideasonboard.com>
CC: Andy Yan <andy.yan@rock-chips.com>,
        Fabio Estevam <fabio.estevam@freescale.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Ulrich Hecht <ulrich.hecht@gmail.com>,
        Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        <linux-renesas-soc@vger.kernel.org>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <1d559621-12c9-c41c-f9d4-9ed3c62e3453@synopsys.com>
Date: Tue, 20 Dec 2016 11:32:07 +0000
MIME-Version: 1.0
In-Reply-To: <20161220013400.28317-16-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,


On 20-12-2016 01:33, Laurent Pinchart wrote:
> Use the device version queried at runtime instead of the device type
> provided through platform data to handle the overflow workaround. This
> will make support of other SoCs integrating the same HDMI TX controller
> version easier.
>
> Among the supported platforms only i.MX6DL and i.MX6Q have been
> identified as needing the workaround. Disabling it on Rockchip RK3288
> (which integrates a v2.00a controller) didn't produce any error or
> artifact.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jose Abreu <joabreu@synopsys.com>

Best regards,
Jose Miguel Abreu
> ---
>  drivers/gpu/drm/bridge/dw-hdmi.c | 46 ++++++++++++++++++++++++++++------------
>  1 file changed, 33 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/dw-hdmi.c b/drivers/gpu/drm/bridge/dw-hdmi.c
> index 730a7558d4d4..f4faa14213e5 100644
> --- a/drivers/gpu/drm/bridge/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/dw-hdmi.c
> @@ -117,8 +117,10 @@ struct dw_hdmi {
>  	struct drm_connector connector;
>  	struct drm_bridge bridge;
>  
> -	struct platform_device *audio;
>  	enum dw_hdmi_devtype dev_type;
> +	unsigned int version;
> +
> +	struct platform_device *audio;
>  	struct device *dev;
>  	struct clk *isfr_clk;
>  	struct clk *iahb_clk;
> @@ -1323,19 +1325,38 @@ static void hdmi_enable_audio_clk(struct dw_hdmi *hdmi)
>  /* Workaround to clear the overflow condition */
>  static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
>  {
> -	int count;
> +	unsigned int count;
> +	unsigned int i;
>  	u8 val;
>  
> -	/* TMDS software reset */
> -	hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ, HDMI_MC_SWRSTZ);
> +	/*
> +	 * Under some circumstances the Frame Composer arithmetic unit can miss
> +	 * an FC register write due to being busy processing the previous one.
> +	 * The issue can be worked around by issuing a TMDS software reset and
> +	 * then write one of the FC registers several times.
> +	 *
> +	 * The number of iterations matters and depends on the HDMI TX revision
> +	 * (and possibly on the platform). So far only i.MX6Q (v1.30a) and
> +	 * i.MX6DL (v1.31a) have been identified as needing the workaround, with
> +	 * 4 and 1 iterations respectively.
> +	 */
>  
> -	val = hdmi_readb(hdmi, HDMI_FC_INVIDCONF);
> -	if (hdmi->dev_type == IMX6DL_HDMI) {
> -		hdmi_writeb(hdmi, val, HDMI_FC_INVIDCONF);
> +	switch (hdmi->version) {
> +	case 0x130a:
> +		count = 4;
> +		break;
> +	case 0x131a:
> +		count = 1;
> +		break;
> +	default:
>  		return;
>  	}
>  
> -	for (count = 0; count < 4; count++)
> +	/* TMDS software reset */
> +	hdmi_writeb(hdmi, (u8)~HDMI_MC_SWRSTZ_TMDSSWRST_REQ, HDMI_MC_SWRSTZ);
> +
> +	val = hdmi_readb(hdmi, HDMI_FC_INVIDCONF);
> +	for (i = 0; i < count; i++)
>  		hdmi_writeb(hdmi, val, HDMI_FC_INVIDCONF);
>  }
>  
> @@ -1832,7 +1853,6 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	int irq;
>  	int ret;
>  	u32 val = 1;
> -	u16 version;
>  	u8 prod_id0;
>  	u8 prod_id1;
>  	u8 config0;
> @@ -1917,21 +1937,21 @@ __dw_hdmi_probe(struct platform_device *pdev,
>  	}
>  
>  	/* Product and revision IDs */
> -	version = (hdmi_readb(hdmi, HDMI_DESIGN_ID) << 8)
> -		| (hdmi_readb(hdmi, HDMI_REVISION_ID) << 0);
> +	hdmi->version = (hdmi_readb(hdmi, HDMI_DESIGN_ID) << 8)
> +		      | (hdmi_readb(hdmi, HDMI_REVISION_ID) << 0);
>  	prod_id0 = hdmi_readb(hdmi, HDMI_PRODUCT_ID0);
>  	prod_id1 = hdmi_readb(hdmi, HDMI_PRODUCT_ID1);
>  
>  	if (prod_id0 != HDMI_PRODUCT_ID0_HDMI_TX ||
>  	    (prod_id1 & ~HDMI_PRODUCT_ID1_HDCP) != HDMI_PRODUCT_ID1_HDMI_TX) {
>  		dev_err(dev, "Unsupported HDMI controller (%04x:%02x:%02x)\n",
> -			version, prod_id0, prod_id1);
> +			hdmi->version, prod_id0, prod_id1);
>  		ret = -ENODEV;
>  		goto err_iahb;
>  	}
>  
>  	dev_info(dev, "Detected HDMI TX controller v%x.%03x %s HDCP\n",
> -		 version >> 12, version & 0xfff,
> +		 hdmi->version >> 12, hdmi->version & 0xfff,
>  		 prod_id1 & HDMI_PRODUCT_ID1_HDCP ? "with" : "without");
>  
>  	initialize_hdmi_ih_mutes(hdmi);
