Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:33619 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbeIKT6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 15:58:48 -0400
Date: Tue, 11 Sep 2018 16:59:02 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 07/16] drm: rcar-du: Use LVDS PLL clock as dot clock when
 possible
Message-ID: <20180911145902.GO20333@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-8-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lG9v85r552aFjg4G"
Content-Disposition: inline
In-Reply-To: <20180904121027.24031-8-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lG9v85r552aFjg4G
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,

On Tue, Sep 04, 2018 at 03:10:18PM +0300, Laurent Pinchart wrote:
> On selected SoCs, the DU can use the clock output by the LVDS encoder
> PLL as its input dot clock. This feature is optional, but on the D3 and
> E3 SoC it is often the only way to obtain a precise dot clock frequency,
> as the other available clocks (CPG-generated clock and external clock)
> usually have fixed rates.
>
> Add a DU model information field to describe which DU channels can use
> the LVDS PLL output clock as their input clock, and configure clock
> routing accordingly.
>
> This feature is available on H2, M2-W, M2-N, D3 and E3 SoCs, with D3 and
> E3 being the primary targets. It is left disabled in this commit, and
> will be enabled per-SoC after careful testing.
>
> At the hardware level, clock routing is configured at runtime in two
> steps, first selecting an internal dot clock between the LVDS PLL clock
> and the external DOTCLKIN clock, and then selecting between the internal
> dot clock and the CPG-generated clock. The first part requires stopping
> the whole DU group in order for the change to take effect, thus causing
> flickering on the screen. For this reason we currently hardcode the
> clock source the the LVDS PLL clock if available, and allow flicker-free

s/the the/to the/ ?

> selection of the external DOTCLKIN clock or CPG-generated clock
> otherwise. A more dynamic clock selection process can be implemented
> later if the need arises.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  8 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h   |  2 ++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 64 +++++++++++++++++++++++++--------
>  3 files changed, 59 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 1d81eb244441..39d2fee6d7b8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -261,6 +261,14 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
>  		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
>
>  		escr = ESCR_DCLKSEL_DCLKIN | div;
> +	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
> +		/*
> +		 * Use the LVDS PLL output as the dot clock when outputting to
> +		 * the LVDS encoder on an SoC that supports this clock routing
> +		 * option. We use the clock directly in that case, without any
> +		 * additional divider.
> +		 */
> +		escr = ESCR_DCLKSEL_DCLKIN;

This confused me, but we have later clarified offline.
Setting the DCLKIN bit alone does not guarantee that we use the LVDS
PLL clock output, but the DIDSR mux must be configured to select LVDS
over dotclkin[0] or dotclkin[1] first. Would you consider mentioning DIDSR
in the comment here?

>  	} else {
>  		struct du_clk_params params = { .diff = (unsigned long)-1 };
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index fef9ea5c22f3..ebba9aefba6a 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -53,6 +53,7 @@ struct rcar_du_output_routing {
>   * @routes: array of CRTC to output routes, indexed by output (RCAR_DU_OUTPUT_*)
>   * @num_lvds: number of internal LVDS encoders
>   * @dpll_mask: bit mask of DU channels equipped with a DPLL
> + * @lvds_clk_mask: bitmask of channels that can use the LVDS clock as dot clock
>   */
>  struct rcar_du_device_info {
>  	unsigned int gen;
> @@ -62,6 +63,7 @@ struct rcar_du_device_info {
>  	struct rcar_du_output_routing routes[RCAR_DU_OUTPUT_MAX];
>  	unsigned int num_lvds;
>  	unsigned int dpll_mask;
> +	unsigned int lvds_clk_mask;
>  };
>
>  #define RCAR_DU_MAX_CRTCS		4
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index ef2c177afb6d..4c62841eff2f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -89,6 +89,54 @@ static void rcar_du_group_setup_defr8(struct rcar_du_group *rgrp)
>  	rcar_du_group_write(rgrp, DEFR8, defr8);
>  }
>
> +static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
> +{
> +	struct rcar_du_device *rcdu = rgrp->dev;
> +	struct rcar_du_crtc *rcrtc;
> +	unsigned int num_crtcs = 0;
> +	unsigned int i;
> +	u32 didsr;
> +
> +	/*
> +	 * Configure input dot clock routing with a hardcoded configuration. If
> +	 * the DU channel can use the LVDS encoder output clock as the dot
> +	 * clock, do so. Otherwise route DU_DOTCLKINn signal to DUn.
> +	 *
> +	 * Each channel can then select between the dot clock configured here
> +	 * and the clock provided by the CPG through the ESCR register.
> +	 */

well, you mention ESCR here, so maybe no need to do the same above...
up to you...

> +	if (rcdu->info->gen < 3 && rgrp->index == 0) {
> +		/*
> +		 * On Gen2 a single register in the first group controls dot
> +		 * clock selection for all channels.
> +		 */
> +		rcrtc = rcdu->crtcs;
> +		num_crtcs = rcdu->num_crtcs;
> +	} else if (rcdu->info->gen == 3 && rgrp->num_crtcs > 1) {
> +		/*
> +		 * On Gen3 dot clocks are setup through per-group registers,
> +		 * only available when the group has two channels.
> +		 */
> +		rcrtc = &rcdu->crtcs[rgrp->index * 2];
> +		num_crtcs = rgrp->num_crtcs;
> +	}
> +
> +	if (!num_crtcs)
> +		return;
> +
> +	didsr = DIDSR_CODE;
> +	for (i = 0; i < num_crtcs; ++i, ++rcrtc) {
> +		if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index))
> +			didsr |= DIDSR_LCDS_LVDS0(i)
> +			      |  DIDSR_PDCS_CLK(i, 0);
> +		else
> +			didsr |= DIDSR_LCDS_DCLKIN(i)
> +			      |  DIDSR_PDCS_CLK(i, 0);
> +	}
> +
> +	rcar_du_group_write(rgrp, DIDSR, didsr);
> +}
> +
>  static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
> @@ -106,21 +154,7 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>
>  	if (rcar_du_has(rgrp->dev, RCAR_DU_FEATURE_EXT_CTRL_REGS)) {
>  		rcar_du_group_setup_defr8(rgrp);
> -
> -		/*
> -		 * Configure input dot clock routing. We currently hardcode the
> -		 * configuration to routing DOTCLKINn to DUn. Register fields
> -		 * depend on the DU generation, but the resulting value is 0 in
> -		 * all cases.
> -		 *
> -		 * On Gen2 a single register in the first group controls dot
> -		 * clock selection for all channels, while on Gen3 dot clocks
> -		 * are setup through per-group registers, only available when
> -		 * the group has two channels.
> -		 */
> -		if ((rcdu->info->gen < 3 && rgrp->index == 0) ||
> -		    (rcdu->info->gen == 3 &&  rgrp->num_crtcs > 1))
> -			rcar_du_group_write(rgrp, DIDSR, DIDSR_CODE);
> +		rcar_du_group_setup_didsr(rgrp);

This setting is performed for all Gen3 SoCs, while relevant only for
D3/E3. It doens't harm though.

Only minor comments, so
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

>  	}
>
>  	if (rcdu->info->gen >= 3)
> --
> Regards,
>
> Laurent Pinchart
>

--lG9v85r552aFjg4G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbl9g2AAoJEHI0Bo8WoVY8ndMP/2/k41g7Yw0R5dXiUwfYUwGA
EeTnFi1rcyaNPurjOxeUFe08JgaZ553rTaDwI46JJ0VPFNaNwtQjcafkbNqJx1nb
zu8Xh6MOTGevTyUvPPiK+xj7FaPDCm6IaFjdwgW3wKNDs6SjLov8p7apvVM5qOSD
ub3U+pGiuPcVgvZHpaLIu3dRQj6hpTxIoQbKC2CYBLbArh3P1ljIHaTAhw6RJvqy
QX8kdaDsaUYwpUs3HWEL0dg7aQn72gukjgt4oL7Ccdq0zU8qQFn5HTbvrNl4wnl4
2EZsdKO061ayo/whGhY1Z96CmrGBoM+oVQ7rH1lG4UTkFP5nJ2H0Gc3OK36m7yHW
pWVRHBbapeudCLRrZAh72geukLI/vtZiq6YzvWvseY9jNCVDG7eDtFaQU1japlSv
wWRL5/7NfW8QL6PWpM8Y28Jf2+AG9fg55Q4Fy7r/5GLXhfEXi836USd/pvb9oNrI
1S6fXI4QnXMuciT7k9stqq2sPDH8wuJISw3tUEgjpFNxZKX8JnrrDoWeQAYcdWrh
Y/niHPxMNkpa+YT7rbso1fBoAi9nhLmVfERcDaccUD1Xu9akEbuDyyernRthdA1A
Qf7bGDTqbnd+kx8MxV4msyHzXSrRy8y5/YrdKhM8LoGiEK/4kXluhZ9a2wo6TWVs
Q9Zi4bIgJsMv/w2+l2m2
=DZOS
-----END PGP SIGNATURE-----

--lG9v85r552aFjg4G--
