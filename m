Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EEBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:14:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C023920661
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 13:14:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K+pJK+N5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfCFNOF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 08:14:05 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfCFNOE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 08:14:04 -0500
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB18C242;
        Wed,  6 Mar 2019 14:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1551878042;
        bh=ivaORkxb7CU5/mZJQysxm62Ko3jRvk7geajR4qV6wgg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K+pJK+N5BcnB5DJElhjFhTcI/MS106dasUnE/f0yasmRixxWj/zgHaTjS0VdmYBl0
         Y44Uyz2+XyRsFqYjV5Mcv8AQAY3mLu0+ouPhl+rnIabUxfRXEKwcyeN6wLRphvaKqw
         g4LWxJaXAFvQDTJJyPK4nbA/MWL8JQQtG4jHx9l0=
Date:   Wed, 6 Mar 2019 15:13:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kevin Key <kevin.key@gentex.com>
Subject: Re: [PATCH] drm: rcar-du: Support panels connected directly to the
 DPAD outputs
Message-ID: <20190306131355.GB4791@pendragon.ideasonboard.com>
References: <20190302161725.25104-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306100332.je6buhiyyjtv2fmk@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190306100332.je6buhiyyjtv2fmk@uno.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

On Wed, Mar 06, 2019 at 11:03:32AM +0100, Jacopo Mondi wrote:
> On Sat, Mar 02, 2019 at 06:17:25PM +0200, Laurent Pinchart wrote:
> > The R-Car DU driver assumes that a bridge is always connected to the DU
> > output. This is valid for the LVDS and HDMI outputs, but the DPAD
> > outputs can be connected directly to a panel, in which case no bridge is
> > available.
> >
> > To support this use case, detect whether the entities connected to the
> > DU DPAD outputs are encoders or panels based on the number of ports of
> > their DT node, and retrieve the corresponding type of DRM objects. For
> > panels, additionally create panel bridge instances.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 54 ++++++++++++++++++++---
> >  1 file changed, 48 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > index 8ee4e762f4e5..595ecfa1ff0e 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> > @@ -28,13 +28,33 @@ static const struct drm_encoder_funcs encoder_funcs = {
> >  	.destroy = drm_encoder_cleanup,
> >  };
> >
> > +static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
> > +{
> > +	struct device_node *ports;
> > +	struct device_node *port;
> > +	unsigned int num_ports = 0;
> > +
> > +	ports = of_get_child_by_name(node, "ports");
> > +	if (!ports)
> > +		ports = of_node_get(node);
> > +
> > +	for_each_child_of_node(ports, port) {
> > +		if (of_node_name_eq(port, "port"))
> > +			num_ports++;
> > +	}
> > +
> > +	of_node_put(node);
> > +
> > +	return num_ports;
> > +}
> > +
> >  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  			 enum rcar_du_output output,
> >  			 struct device_node *enc_node)
> >  {
> 
> You received a Tested-by, so I might surely be mistaken, but the
> caller of this function skips all remote nodes with a single port,
> doesn't it?
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rcar-du/rcar_du_kms.c#L308
> 
> I don't have any DTS with a panel connected to the DPAD output so, as
> a test, I removed all endpoints except endpoint@0 from the 'hdmi0' device
> node, and the 'rcar_du_encoder_init()' function never gets called and DU
> probing fails with:
> rcar-du feb00000.display: no encoder found for endpoint /soc/display@feb00000/ports/port@1/endpoint, skipping
> 
> What am I missing?

You're missing drm-next :-)

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/rcar-du/rcar_du_kms.c#n331

> >  	struct rcar_du_encoder *renc;
> >  	struct drm_encoder *encoder;
> > -	struct drm_bridge *bridge = NULL;
> > +	struct drm_bridge *bridge;
> >  	int ret;
> >
> >  	renc = devm_kzalloc(rcdu->dev, sizeof(*renc), GFP_KERNEL);
> > @@ -48,11 +68,33 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
> >  		enc_node, output);
> >
> > -	/* Locate the DRM bridge from the encoder DT node. */
> > -	bridge = of_drm_find_bridge(enc_node);
> > -	if (!bridge) {
> > -		ret = -EPROBE_DEFER;
> > -		goto done;
> > +	/*
> > +	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> > +	 * DT node has a single port, consider it describes a panel and create a
> > +	 * panel bridge.
> > +	 */
> > +	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
> > +	     output == RCAR_DU_OUTPUT_DPAD1) &&
> > +	    rcar_du_encoder_count_ports(enc_node) == 1) {
> 
> Could this be cached?

How so ? This function is run once per enc_node, so the cache wouldn't
be used again, would it ?

> > +		struct drm_panel *panel = of_drm_find_panel(enc_node);
> > +
> > +		if (IS_ERR(panel)) {
> > +			ret = PTR_ERR(panel);
> > +			goto done;
> > +		}
> > +
> > +		bridge = devm_drm_panel_bridge_add(rcdu->dev, panel,
> > +						   DRM_MODE_CONNECTOR_DPI);
> > +		if (IS_ERR(bridge)) {
> > +			ret = PTR_ERR(bridge);
> > +			goto done;
> > +		}
> > +	} else {
> > +		bridge = of_drm_find_bridge(enc_node);
> > +		if (!bridge) {
> > +			ret = -EPROBE_DEFER;
> > +			goto done;
> > +		}
> >  	}
> >
> >  	ret = drm_encoder_init(rcdu->ddev, encoder, &encoder_funcs,

-- 
Regards,

Laurent Pinchart
