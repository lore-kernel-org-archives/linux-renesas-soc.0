Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A775AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D3A420657
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 10:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfCFKDD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 05:03:03 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50501 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfCFKDD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 05:03:03 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EC1F9240009;
        Wed,  6 Mar 2019 10:02:59 +0000 (UTC)
Date:   Wed, 6 Mar 2019 11:03:32 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kevin Key <kevin.key@gentex.com>
Subject: Re: [PATCH] drm: rcar-du: Support panels connected directly to the
 DPAD outputs
Message-ID: <20190306100332.je6buhiyyjtv2fmk@uno.localdomain>
References: <20190302161725.25104-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lxzm5gyl2zcbg7jk"
Content-Disposition: inline
In-Reply-To: <20190302161725.25104-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--lxzm5gyl2zcbg7jk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Sat, Mar 02, 2019 at 06:17:25PM +0200, Laurent Pinchart wrote:
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

You received a Tested-by, so I might surely be mistaken, but the
caller of this function skips all remote nodes with a single port,
doesn't it?
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rcar-du/rcar_du_kms.c#L308

I don't have any DTS with a panel connected to the DPAD output so, as
a test, I removed all endpoints except endpoint@0 from the 'hdmi0' device
node, and the 'rcar_du_encoder_init()' function never gets called and DU
probing fails with:
rcar-du feb00000.display: no encoder found for endpoint /soc/display@feb00000/ports/port@1/endpoint, skipping

What am I missing?

Thanks
   j


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
> +	 * panel bridge.
> +	 */
> +	if ((output == RCAR_DU_OUTPUT_DPAD0 ||
> +	     output == RCAR_DU_OUTPUT_DPAD1) &&
> +	    rcar_du_encoder_count_ports(enc_node) == 1) {

Could this be cached?

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
> --
> Regards,
>
> Laurent Pinchart
>

--lxzm5gyl2zcbg7jk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlx/mvQACgkQcjQGjxah
Vjy+ThAAign2m3UyPlO3TJazpJQQrTzIAUlWfspKg76avX886+D7b9b5MX3wBNNn
MWsAk05/jo+iJ83s8w5M7cUOEb2PvkQfkRm8+xFj5FIH7yFuDzZeL2oerjZ5XHo9
HBDMQ9kRYqgLk4GoH/pvODTt2PRAqYsZ5EHq2Pq6ep0Y6SOhNGV2+p6eJFM3vq7l
TvI+q6gn8tJacIiY3RRhWrAqXITsYj4mltIlYboa6k4WgZe2sps3YHWJEKMWru6c
frMm6fzVbs3MKQ90kiVgOqyCv+HZF6rK//93YVdQlzqIbACl0nIMTA3O0nOS2ndY
486lvfQHexCQtArETmd4h2Ig7zSulvNqriq+0ZlQDqhCIqs2keYFmIEFCkuzE3jG
DFcXMuuzHFUqLdjeMfeyZpcTcahgSUtKpBje4kyoUMV4SMHJn+bzK8oa3/0N8LSK
EJFnDMjCOcqIS+iT/sf9gSiwTqg44xKeReZ7u43njfAMrbFLl2/Pp9MlODvPP2d8
Cl3gTYE+tdxEANofm015Xrh01g4G3G/7ryrIIftotBGH+vwBQAyAdzGtF0bTwvnA
Hzzczutnz2pjJR3Fw3XlfSB2rBO+7MELWvgDEVUsURiZmrTHXLPssOe5kmQcX6HH
cED5Jujue22ouA52R/Qzio4tJ15iLWW474cg15fJb2cgyIslM/E=
=pMqi
-----END PGP SIGNATURE-----

--lxzm5gyl2zcbg7jk--
