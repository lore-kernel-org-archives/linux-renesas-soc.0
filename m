Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0021C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E9E020851
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 17:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbfCHRTz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 12:19:55 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:43667 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfCHRTz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 12:19:55 -0500
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B603F240004;
        Fri,  8 Mar 2019 17:19:49 +0000 (UTC)
Date:   Fri, 8 Mar 2019 18:20:23 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 11/15] drm: rcar-du: lvds: Add support for dual-link
 mode
Message-ID: <20190308172023.vtsvouwo4ltxzgx2@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-12-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ta7xrcz7fojfknp6"
Content-Disposition: inline
In-Reply-To: <20190306232345.23052-12-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--ta7xrcz7fojfknp6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Thu, Mar 07, 2019 at 01:23:41AM +0200, Laurent Pinchart wrote:
> In dual-link mode the LVDS0 encoder transmits even-numbered pixels, and
> sends odd-numbered pixels to the LVDS1 encoder for transmission on a
> separate link.
>
> To implement support for this mode of operation, determine if the LVDS
> connection operates in dual-link mode by querying the next device in the
> pipeline, locate the companion encoder, and control it directly through
> its bridge operations.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 104 ++++++++++++++++++++++++----
>  drivers/gpu/drm/rcar-du/rcar_lvds.h |   5 ++
>  2 files changed, 96 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 5ac92ee15be0..90d33514bb3e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -66,6 +66,9 @@ struct rcar_lvds {
>
>  	struct drm_display_mode display_mode;
>  	enum rcar_lvds_mode mode;
> +
> +	struct drm_bridge *companion;
> +	bool dual_link;
>  };
>
>  #define bridge_to_rcar_lvds(bridge) \
> @@ -400,11 +403,6 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  {
>  	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
>  	const struct drm_display_mode *mode = &lvds->display_mode;
> -	/*
> -	 * FIXME: We should really retrieve the CRTC through the state, but how
> -	 * do we get a state pointer?
> -	 */
> -	struct drm_crtc *crtc = lvds->bridge.encoder->crtc;
>  	u32 lvdhcr;
>  	u32 lvdcr0;
>  	int ret;
> @@ -413,6 +411,10 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	if (ret < 0)
>  		return;
>
> +	/* Enable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->enable(lvds->companion);
> +
>  	/*
>  	 * Hardcode the channels and control signals routing for now.
>  	 *
> @@ -435,17 +437,33 @@ static void rcar_lvds_enable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCHCR, lvdhcr);
>
>  	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK) {
> -		/* Disable dual-link mode. */
> -		rcar_lvds_write(lvds, LVDSTRIPE, 0);
> +		/*
> +		 * Configure vertical stripe based on the mode of operation of
> +		 * the connected device.
> +		 */
> +		rcar_lvds_write(lvds, LVDSTRIPE,
> +				lvds->dual_link ? LVDSTRIPE_ST_ON : 0);
>  	}
>
> -	/* PLL clock configuration. */
> -	lvds->info->pll_setup(lvds, mode->clock * 1000);
> +	/*
> +	 * PLL clock configuration on all instances but the companion in
> +	 * dual-link mode.
> +	 */
> +	if (!lvds->dual_link || lvds->companion)
> +		lvds->info->pll_setup(lvds, mode->clock * 1000);
>
>  	/* Set the LVDS mode and select the input. */
>  	lvdcr0 = lvds->mode << LVDCR0_LVMD_SHIFT;
> -	if (drm_crtc_index(crtc) == 2)
> -		lvdcr0 |= LVDCR0_DUSEL;
> +
> +	if (lvds->bridge.encoder) {
> +		/*
> +		 * FIXME: We should really retrieve the CRTC through the state,
> +		 * but how do we get a state pointer?
> +		 */
> +		if (drm_crtc_index(lvds->bridge.encoder->crtc) == 2)
> +			lvdcr0 |= LVDCR0_DUSEL;
> +	}
> +
>  	rcar_lvds_write(lvds, LVDCR0, lvdcr0);
>
>  	/* Turn all the channels on. */
> @@ -512,6 +530,10 @@ static void rcar_lvds_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDCR1, 0);
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>
> +	/* Disable the companion LVDS encoder in dual-link mode. */
> +	if (lvds->dual_link && lvds->companion)
> +		lvds->companion->funcs->disable(lvds->companion);
> +
>  	clk_disable_unprepare(lvds->clocks.mod);
>  }
>
> @@ -628,10 +650,54 @@ static const struct drm_bridge_funcs rcar_lvds_bridge_ops = {
>  	.mode_set = rcar_lvds_mode_set,
>  };
>
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +
> +	return lvds->dual_link;
> +}
> +EXPORT_SYMBOL_GPL(rcar_lvds_dual_link);
> +
>  /* -----------------------------------------------------------------------------
>   * Probe & Remove
>   */
>
> +static int rcar_lvds_parse_dt_companion(struct rcar_lvds *lvds)
> +{
> +	const struct of_device_id *match;
> +	struct device_node *companion;
> +	struct device *dev = lvds->dev;
> +	int ret = 0;
> +
> +	/* Locate the companion LVDS encoder for dual-link operation, if any. */
> +	companion = of_parse_phandle(dev->of_node, "renesas,companion", 0);
> +	if (!companion)
> +		return -ENODEV;
> +
> +	/*
> +	 * Sanity check: the companion encoder must have the same compatible
> +	 * string.
> +	 */
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +	if (!of_device_is_compatible(companion, match->compatible)) {
> +		ret = -ENODEV;
> +		goto done;
> +	}
> +
> +	lvds->companion = of_drm_find_bridge(companion);
> +	if (!lvds->companion) {
> +		ret = -EPROBE_DEFER;
> +		goto done;
> +	}
> +
> +	dev_dbg(dev, "Found companion encoder %pOF\n", companion);
> +
> +done:
> +	of_node_put(companion);
> +
> +	return ret;
> +}
> +
>  static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>  {
>  	struct device_node *local_output = NULL;
> @@ -682,14 +748,26 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
>
>  	if (is_bridge) {
>  		lvds->next_bridge = of_drm_find_bridge(remote);
> -		if (!lvds->next_bridge)
> +		if (!lvds->next_bridge) {
>  			ret = -EPROBE_DEFER;
> +			goto done;
> +		}
> +
> +		if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
> +			lvds->dual_link = lvds->next_bridge->timings
> +					? lvds->next_bridge->timings->dual_link
> +					: false;

I wonder if, in all this patch, you could not use "lvds->companion" in
place of "lvds->dual_link", and thus drop that from timings. This mean
"renesas,companion" would only be used when operating in dual link
mode, which might be less nice (and could actually called differently
in that case).

Both the THC631024 and the rcar_du-lvds driver would decide
independently if they operate in dual link mode or not (one counting
its endpoints, the other inspecting the "renesas,companion" property).

The only place where this might be tricky is the here above

 +	/*
 +	 * PLL clock configuration on all instances but the companion in
 +	 * dual-link mode.
 +	 */
 +	if (!lvds->dual_link || lvds->companion)
 +		lvds->info->pll_setup(lvds, mode->clock * 1000);

but that would remove the need for the thc63 bridge to report its
operating mode in timings...

>  	} else {
>  		lvds->panel = of_drm_find_panel(remote);
> -		if (IS_ERR(lvds->panel))
> +		if (IS_ERR(lvds->panel)) {
>  			ret = PTR_ERR(lvds->panel);
> +			goto done;
> +		}
>  	}
>
> +	if (lvds->dual_link)

Note: if (!is_bridge) you would never set lvds->dual_link, so this
should be moved inside the here above "if (is_bridge)"

> +		ret = rcar_lvds_parse_dt_companion(lvds);
> +
>  done:
>  	of_node_put(local_output);
>  	of_node_put(remote_input);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.h b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> index a709cae1bc32..222ec0e60785 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.h
> @@ -15,6 +15,7 @@ struct drm_bridge;
>  #if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
>  int rcar_lvds_clk_enable(struct drm_bridge *bridge, unsigned long freq);
>  void rcar_lvds_clk_disable(struct drm_bridge *bridge);
> +bool rcar_lvds_dual_link(struct drm_bridge *bridge);
>  #else
>  static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  				       unsigned long freq)
> @@ -22,6 +23,10 @@ static inline int rcar_lvds_clk_enable(struct drm_bridge *bridge,
>  	return -ENOSYS;
>  }
>  static inline void rcar_lvds_clk_disable(struct drm_bridge *bridge) { }
> +static inline bool rcar_lvds_dual_link(struct drm_bridge *bridge)
> +{
> +	return false;
> +}
>  #endif /* CONFIG_DRM_RCAR_LVDS */
>
>  #endif /* __RCAR_LVDS_H__ */
> --
> Regards,
>
> Laurent Pinchart
>

--ta7xrcz7fojfknp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyCpFcACgkQcjQGjxah
VjzJuRAAjC+TWwWX13gdTH7kat0jacAzr2ACKwuy0yu8cJSk3Hi/qcHRaiJ/TLsm
oBonlV1z+6cOLAjgMGA0QC6sPl4S5v+WVuSYSQMTdxskrLa+cqTnL2FTOLKp0wuL
gQ2QMosGz/9VQDlao4iMnlEQoOo2TessuVn0iiF9QK874kQHzlsNu4WOG600f4Mn
wnKZrCrHr4ym4hL1f8WpN22HetJ4dOyd5gl3DbiKkKBMufTc0e7RVTrqJTa4wWCV
17BEK7nkKa1lPKKsnEj/xXrsQoKLd1vxIRyLNgbOgkznJFXIRkzFE0v7RwISRipc
2feLAxBI8j+u7xREh8PSNoMoBu4bICkqXUzVCDERacHOqgMSX32NL3vLKg9K2OrI
SRVRzmKjDE9tNySRgatQRestIKJaidyFL138YO3N8t5ZvkNk74OhPOIuyNedmPM9
VEI/OGHRxmWQw4ewqAm9K+xh/kDzP+kckCKJ9jtaGiPrrS/F6oKKOoxx104YCJOl
XIG+pp+3eT43teNTTO+4OQ6eNqZgL8TWl3m3E2iX29vaHBkpBIJjaV5xiJq+vhbj
Ddyt0mjK5VPuEjirrGWSRkzAzLB9H98P5e9ufv/8d5Msnjr7P7JXpWRRnnPstr4x
N+UNsO2MkU764BcjbkSO4rTlJQz/wZUjghlZoH9QZz3arNWB+dY=
=NglX
-----END PGP SIGNATURE-----

--ta7xrcz7fojfknp6--
