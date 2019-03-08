Return-Path: <SRS0=mNNB=RL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C0AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 557CA2081B
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Mar 2019 16:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfCHQ2K (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Mar 2019 11:28:10 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56303 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbfCHQ2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Mar 2019 11:28:04 -0500
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 395F9C000A;
        Fri,  8 Mar 2019 16:28:02 +0000 (UTC)
Date:   Fri, 8 Mar 2019 17:28:36 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH/RFC 09/15] drm: rcar-du: lvds: Adjust operating frequency
 for D3 and E3
Message-ID: <20190308162836.5lfobi5aurthg53h@uno.localdomain>
References: <20190306232345.23052-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190306232345.23052-10-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mm3hcrhuq5td4yoy"
Content-Disposition: inline
In-Reply-To: <20190306232345.23052-10-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--mm3hcrhuq5td4yoy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   thanks, this matches section 37.1.1 of v1.50 datasheet

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

On Thu, Mar 07, 2019 at 01:23:39AM +0200, Laurent Pinchart wrote:
> The D3 and E3 SoCs have different pixel clock frequency limits for the
> LVDS encoder than the other SoCs in the Gen3 family. Adjust the mode
> fixup implementation accordingly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index cd202157264a..b1abe737dc05 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -515,11 +515,16 @@ static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
>  				 const struct drm_display_mode *mode,
>  				 struct drm_display_mode *adjusted_mode)
>  {
> +	struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> +	int min_freq;
> +
>  	/*
>  	 * The internal LVDS encoder has a restricted clock frequency operating
> -	 * range (31MHz to 148.5MHz). Clamp the clock accordingly.
> +	 * range, from 5MHz to 148.5MHz on D3 and E3, and from 31MHz to
> +	 * 148.5MHz on all other platforms. Clamp the clock accordingly.
>  	 */
> -	adjusted_mode->clock = clamp(adjusted_mode->clock, 31000, 148500);
> +	min_freq = lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL ? 5000 : 31000;
> +	adjusted_mode->clock = clamp(adjusted_mode->clock, min_freq, 148500);
>
>  	return true;
>  }
> --
> Regards,
>
> Laurent Pinchart
>

--mm3hcrhuq5td4yoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAlyCmDQACgkQcjQGjxah
VjzyVg//W0QDLEObsxFqzTa+1GvK+EViwSxRVT24yzL7uBgLHPpw8jEXFoHvPnS4
JyCe+Dm7Wkpk5g0meAlL2i280UJfi9vn3k12XIsfuYjutmdHzVCLEXXHRerdGhcZ
aBtzf1msSO3KoIbKvF39vrJT+p38W/9rOZMbVtvzDQCTvrofvnV9TizU3G/W/Dkn
hjqLoWLKoGDHHhctdStjpAkF/3uTHYVEJo27wqJdUyvPiGXmQzYzHvs5Ss8RtgXl
gdUnTwFqbvnGz7MwbCLLxLHzZEZLpPlJHvra51bW6Vt5v3beiw0HanSQH54OOwq0
3HunF4+Kc6MrrVsn8cF2yjcdo6zt+JINT/UUe8dGgxJyGs4OZfvJSv+ZGNVPbCG9
GZ06CFhhdS99F4WA5cJPtKwWgDyvv6y5kIRR2zBIzKD4+VGadxpW82cfWWUF2r3f
GcFDUoPRxsYjnybTBtheRC/MOsxvkrqAw3v8kk3fQ9vQq/tdOvF/NkPs2ZHv49RX
Jfme5jsu6aNXK/C0Nu+OzXxoJ9qTHZwk72QABq3wSAnwyGfAqNMjXA4pK0S+0ONy
yHBfGYGOZ1t+kk4DrlpyVwLtJd+bqySVBJkSbv90j1Zidm5g66KuLItk0bZ6Czfy
0hqbNjyN/K9a71HjtRFnQdnjLVzNzjJUpzEGUbstSOmYw0H7uIU=
=fOfG
-----END PGP SIGNATURE-----

--mm3hcrhuq5td4yoy--
