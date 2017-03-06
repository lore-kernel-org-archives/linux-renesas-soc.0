Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:55744 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752877AbdCFKFr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Mar 2017 05:05:47 -0500
Subject: Re: [PATCH v4 2/4] drm: bridge: Add LVDS encoder driver
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <20170302104728.7150-1-laurent.pinchart+renesas@ideasonboard.com>
 <20170302104728.7150-3-laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <3f4581e5-a8dd-ce1a-2916-556d1d40ed56@codeaurora.org>
Date: Mon, 6 Mar 2017 15:35:40 +0530
MIME-Version: 1.0
In-Reply-To: <20170302104728.7150-3-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 3/2/2017 4:17 PM, Laurent Pinchart wrote:
> The LVDS encoder driver is a DRM bridge driver that supports the
> parallel to LVDS encoders that don't require any configuration. The
> driver thus doesn't interact with the device, but creates an LVDS
> connector for the panel and exposes its size and timing based on
> information retrieved from DT.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Acked-by: Daniel Vetter <daniel@ffwll.ch>
> ---
> Changes since v3:
>
> - Dropped encoder_type
> - Added a Kconfig dependency on DRM_PANEL
> ---
>  drivers/gpu/drm/bridge/Kconfig        |   9 ++
>  drivers/gpu/drm/bridge/Makefile       |   1 +
>  drivers/gpu/drm/bridge/lvds-encoder.c | 209 ++++++++++++++++++++++++++++++++++
>  3 files changed, 219 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
>

<snip>

> +
> +static int lvds_encoder_remove(struct platform_device *pdev)
> +{
> +	struct lvds_encoder *encoder = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&encoder->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id lvds_encoder_match[] = {
> +	{ .compatible = "lvds-encoder" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, lvds_encoder_match);
> +
> +struct platform_driver lvds_encoder_driver = {

I changed this to static to fix a sparse warning. Pushed
this and others in this set to drm-misc-next.

Thanks,
Archit

> +	.probe	= lvds_encoder_probe,
> +	.remove	= lvds_encoder_remove,
> +	.driver		= {
> +		.name		= "lvds-encoder",
> +		.of_match_table	= lvds_encoder_match,
> +	},
> +};
> +module_platform_driver(lvds_encoder_driver);
> +
> +MODULE_AUTHOR("Laurent Pinchart <laurent.pinchart@ideasonboard.com>");
> +MODULE_DESCRIPTION("Transparent parallel to LVDS encoder");
> +MODULE_LICENSE("GPL");
>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
hosted by The Linux Foundation
