Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:56463 "EHLO
	pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbcHAOmJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 1 Aug 2016 10:42:09 -0400
Date: Mon, 1 Aug 2016 15:39:21 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Thierry Reding <treding@nvidia.com>,
	Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] drm: bridge: add DesignWare HDMI I2S audio support
Message-ID: <20160801143921.GE1041@n2100.armlinux.org.uk>
References: <874m8jxqcy.wl%kuninori.morimoto.gx@renesas.com>
 <8737o3xqab.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8737o3xqab.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 24, 2016 at 11:40:44AM +0900, Kuninori Morimoto wrote:
> +static int snd_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	struct dw_hdmi_i2s_audio_data *audio = pdev->dev.platform_data;
> +	struct platform_device_info pdevinfo;
> +	struct hdmi_codec_pdata pdata;
> +
> +	pdata.ops		= &dw_hdmi_i2s_ops;
> +	pdata.i2s		= 1;
> +	pdata.max_i2s_channels	= 6;
> +	pdata.data		= audio;
> +
> +	memset(&pdevinfo, 0, sizeof(pdevinfo));
> +	pdevinfo.parent		= pdev->dev.parent;
> +	pdevinfo.id		= PLATFORM_DEVID_AUTO;
> +	pdevinfo.name		= HDMI_CODEC_DRV_NAME;
> +	pdevinfo.data		= &pdata;
> +	pdevinfo.size_data	= sizeof(pdata);
> +	pdevinfo.dma_mask	= DMA_BIT_MASK(32);
> +
> +	return IS_ERR_OR_NULL(platform_device_register_full(&pdevinfo));

This is certainly wrong.  You're returning a 0/1 value rather than
an error code when platform_device_register_full() fails.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
