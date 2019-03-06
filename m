Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FFEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:07:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C2CAD20657
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D3KoA902"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729882AbfCFKHS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 05:07:18 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:57212 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729848AbfCFKHS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 05:07:18 -0500
Received: from [192.168.0.21] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EED44242;
        Wed,  6 Mar 2019 11:07:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551866836;
        bh=bY96cPrroIyOPRCp+zQHJqC9Nlv+E93UBhUM7Gnj8ao=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=D3KoA902hi4K2w4xiqSPrFUWjYde+X5Yl2BGZ1FamMFxhcf8fqyqLdePq8me1ifVF
         UP6Wuk+kTy4TMLkyTmV0yUiGtvLfXgN0aMkOv9i9MmuzWMHPZUhVpOSBNrL50tM79h
         U8fHYfT49jL8VMEVcXhAHD7X20UQDdVzioIWV9ww=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] drm: rcar-du: Support panels connected directly to the
 DPAD outputs
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, Kevin Key <kevin.key@gentex.com>
References: <20190302161725.25104-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <38c22c56-6cf2-0930-4ed5-fde20e1e4915@ideasonboard.com>
Date:   Wed, 6 Mar 2019 10:07:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190302161725.25104-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the patch,

On 02/03/2019 16:17, Laurent Pinchart wrote:
> The R-Car DU driver assumes that a bridge is always connected to the DU
> output. This is valid for the LVDS and HDMI outputs, but the DPAD
> outputs can be connected directly to a panel, in which case no bridge is
> available.
> 
> To support this use case, detect whether the entities connected to the
> DU DPAD outputs are encoders or panels based on the number of ports of
> their DT node, and retrieve the corresponding type of DRM objects. For
> panels, additionally create panel bridge instances.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Except for some minor wording on the comment, which I'll let you handle,

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 54 ++++++++++++++++++++---
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index 8ee4e762f4e5..595ecfa1ff0e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -28,13 +28,33 @@ static const struct drm_encoder_funcs encoder_funcs = {
>  	.destroy = drm_encoder_cleanup,
>  };
>  
> +static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
> +{
> +	struct device_node *ports;
> +	struct device_node *port;
> +	unsigned int num_ports = 0;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (!ports)
> +		ports = of_node_get(node);
> +
> +	for_each_child_of_node(ports, port) {
> +		if (of_node_name_eq(port, "port"))
> +			num_ports++;
> +	}
> +
> +	of_node_put(node);
> +
> +	return num_ports;
> +}
> +
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
>  	struct drm_encoder *encoder;
> -	struct drm_bridge *bridge = NULL;
> +	struct drm_bridge *bridge;
>  	int ret;
>  
>  	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
> @@ -48,11 +68,33 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
>  		enc_node, output);
>  
> -	/* Locate the DRM bridge from the encoder DT node. */
> -	bridge = of_drm_find_bridge(enc_node);
> -	if (!bridge) {
> -		ret = -EPROBE_DEFER;
> -		goto done;
> +	/*
> +	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> +	 * DT node has a single port, consider it describes a panel and create a


consider it as describing? (if it's an assumption that has been made)

consider if it describes? (if it's conditional)

I'm not sure I fully understand the intent of the sentence to correct it
- but it needs a little tweak. The use of the word 'consider' makes me
assume that it might not need a panel bridge, and some further decision
needs to be made, but the code looks like it assumes one port means
there should be a panel - and a bridge will be added.



> +	 * panel bridge.
> +	 */
> +	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
> +	     output == RCAR_DU_OUTPUT_DPAD1) &&
> +	    rcar_du_encoder_count_ports(enc_node) == 1) {
> +		struct drm_panel *panel = of_drm_find_panel(enc_node);
> +
> +		if (IS_ERR(panel)) {
> +			ret = PTR_ERR(panel);
> +			goto done;
> +		}
> +
> +		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel,
> +						   DRM_MODE_CONNECTOR_DPI);
> +		if (IS_ERR(bridge)) {
> +			ret = PTR_ERR(bridge);
> +			goto done;
> +		}
> +	} else {
> +		bridge = of_drm_find_bridge(enc_node);
> +		if (!bridge) {
> +			ret = -EPROBE_DEFER;
> +			goto done;
> +		}
>  	}
>  
>  	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,
> 

-- 
Regards
--
Kieran
