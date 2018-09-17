Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:45149 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbeIQSXr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 14:23:47 -0400
Date: Mon, 17 Sep 2018 14:56:30 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v2 08/16] drm: rcar-du: Enable configurable DPAD0 routing
 on Gen3
Message-ID: <20180917125630.GM16851@w540>
References: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180914091046.483-9-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="nb8zVy0QMK3AA1xu"
Content-Disposition: inline
In-Reply-To: <20180914091046.483-9-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nb8zVy0QMK3AA1xu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Fri, Sep 14, 2018 at 12:10:38PM +0300, Laurent Pinchart wrote:
> All Gen3 SoCs supported so far have a fixed association between DPAD0
> and DU channels, which led to hardcoding that association when writing
> the corresponding hardware register. The D3 and E3 will break that
> mechanism as DPAD0 can be dynamically connected to either DU0 or DU1.
>
> Make DPAD0 routing dynamic on Gen3. To ensure a valid hardware
> configuration when the DU starts without the RGB output enabled, DPAD0
> is associated at initialization time to the first DU channel that it can
> be connected to. This makes no change on Gen2 as all Gen2 SoCs can
> connected DPAD0 to DU0, which is the current implicit default value.
>
> As the DPAD0 source is always 0 when a single source is possible on
> Gen2, we can also simplify the Gen2 code in the same function to remove
> a conditional check.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Please add my:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>



> ---
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 17 ++++++-----------
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 4c62841eff2f..f38703e7a10d 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -56,8 +56,6 @@ static void rcar_du_group_setup_pins(struct rcar_du_group *rgrp)
>  static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
> -	unsigned int possible_crtcs =
> -		rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs;
>  	u32 defr8 = DEFR8_CODE;
>
>  	if (rcdu->info->gen < 3) {
> @@ -69,21 +67,18 @@ static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
>  		 * DU instances that support it.
>  		 */
>  		if (rgrp->index == 0) {
> -			if (possible_crtcs > 1)
> -				defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
> +			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
>  			if (rgrp->dev->vspd1_sink == 2)
>  				defr8 |= DEFR8_VSCS;
>  		}
>  	} else {
>  		/*
> -		 * On Gen3 VSPD routing can't be configured, but DPAD routing
> -		 * needs to be set despite having a single option available.
> +		 * On Gen3 VSPD routing can't be configured, and DPAD routing
> +		 * is set in the group corresponding to the DPAD output (no Gen3
> +		 * SoC has multiple DPAD sources belonging to separate groups).
>  		 */
> -		unsigned int rgb_crtc = ffs(possible_crtcs) - 1;
> -		struct rcar_du_crtc *crtc = &rcdu->crtcs[rgb_crtc];
> -
> -		if (crtc->index / 2 == rgrp->index)
> -			defr8 |= DEFR8_DRGBS_DU(crtc->index);
> +		if (rgrp->index == rcdu->dpad0_source / 2)
> +			defr8 |= DEFR8_DRGBS_DU(rcdu->dpad0_source);
>  	}
>
>  	rcar_du_group_write(rgrp, DEFR8, defr8);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index ed7fa3204892..bd01197700c5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -501,6 +501,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	struct drm_device *dev = rcdu->ddev;
>  	struct drm_encoder *encoder;
>  	struct drm_fbdev_cma *fbdev;
> +	unsigned int dpad0_sources;
>  	unsigned int num_encoders;
>  	unsigned int num_groups;
>  	unsigned int swindex;
> @@ -613,6 +614,17 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  		encoder->possible_clones = (1 << num_encoders) - 1;
>  	}
>
> +	/*
> +	 * Initialize the default DPAD0 source to the index of the first DU
> +	 * channel that can be connected to DPAD0. The exact value doesn't
> +	 * matter as it should be overwritten by mode setting for the RGB
> +	 * output, but it is nonetheless required to ensure a valid initial
> +	 * hardware configuration on Gen3 where DU0 can't always be connected to
> +	 * DPAD0.
> +	 */
> +	dpad0_sources = rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs;
> +	rcdu->dpad0_source = ffs(dpad0_sources) - 1;
> +
>  	drm_mode_config_reset(dev);
>
>  	drm_kms_helper_poll_init(dev);
> --
> Regards,
>
> Laurent Pinchart
>

--nb8zVy0QMK3AA1xu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbn6R+AAoJEHI0Bo8WoVY8rs0P/0ylQ9ZtQTE3CBstg268pIHx
xypTIA4+IfmipCjNvnFWHp/3K1kYqX3IN1BH0woVsmUiQSBnoHaXVpKLxJm8Py25
fN7nlDNdbCnn5jNVEicQjtW1lDlqOygp6BYtX1GTqcqxpjNTXDT1E5UVSPgsv4wt
vl1EL1q6xb8Lf1H+wNISqDClBWyrnq+nvs3yY0ztM95C/dCZeRiokCt6b2NE9dg4
/0Yhma0OTQn/DFT7m3iGaUsTHYnLxbd3+Ilbi/JGBrHKpwzsaAs/qvIihHHAFnT9
e0bnufzy3QcwIp54NypPnr/q6FDB+mcf1Ot/7aBXZB4DqHIzjHj8k78IIIa4Jy8W
t2rxKjmtKvKC02X78UNCDjA6rbSzubGSxuwOk3d8LRvDeov6rCAAn9ifjNrfjodI
bmPopAvbZRSLRNMj3rpPSWrkZCkkmqfK8Jq3375Tnhjn0P5NnnnjPpx3hFYmcq2/
ImOgEWJWtT1tRiCGaYKHM1Sp7WFvLOENRMfF9Yhf/tDuJtsbM00yKhyuGcoPQbAS
QQBgvGJUc3M6ID/PH/NlQvKs65usBW5Bi5CY84kP2ZYyokKFN0r4Lx0i1DActAOZ
+gh/rOgg1kBzIU4EtHtbjoMRFNLP7YlX9IMdbtbdsjx0JgHL5FG/c2slXaJSZA2K
ZIuwM3NngQM1LWzR2eVL
=R0ZB
-----END PGP SIGNATURE-----

--nb8zVy0QMK3AA1xu--
