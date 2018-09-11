Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:55873 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbeIKSbU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 14:31:20 -0400
Date: Tue, 11 Sep 2018 15:31:55 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/16] drm: bridge: thc63: Restrict modes based on
 hardware operating frequency
Message-ID: <20180911133155.GV28160@w540>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="gvPGo+RAdjC9O5ul"
Content-Disposition: inline
In-Reply-To: <20180904121027.24031-5-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--gvPGo+RAdjC9O5ul
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Laurent,
   sorry, I might be confused but,

On Tue, Sep 04, 2018 at 03:10:15PM +0300, Laurent Pinchart wrote:
> The THC63LVD1024 is restricted to a pixel clock frequency in the range
> of 8 to 135 MHz. Implement the bridge .mode_valid() operation
> accordingly.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/bridge/thc63lvd1024.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/thc63lvd1024.c b/drivers/gpu/drm/bridge/thc63lvd1024.c
> index c8b9edd5a7f4..63609ba16b6d 100644
> --- a/drivers/gpu/drm/bridge/thc63lvd1024.c
> +++ b/drivers/gpu/drm/bridge/thc63lvd1024.c
> @@ -45,6 +45,23 @@ static int thc63_attach(struct drm_bridge *bridge)
>  	return drm_bridge_attach(bridge->encoder, thc63->next, bridge);
>  }
>
> +static enum drm_mode_status thc63_mode_valid(struct drm_bridge *bridge,
> +					const struct drm_display_mode *mode)
> +{
> +	/*
> +	 * The THC63LVD0124 clock frequency range is 8 to 135 MHz in single-in,
> +	 * single-out mode. Note that the limits depends on the mode and will
> +	 * need to be adjusted accordingly.
> +	 */
> +	if (mode->clock < 8000)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > 135000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +

Are we talking about the CLKOUT frequency? Because that's the one I
see depending on the dual/single output mode, and I assume we're
checking for the mode->clock of the DRM mode to be applied to the
connector (which receives an RGB stream from this bridge).

In case we're talking about CLKOUT, I read

"Dual LVDS port IN/Dual TTL port Out Mode:
 8 - 135MHz(CLKOUT)
 Dual LVDS port IN/Single TTL port Out Mode:
 40 - 150MHz(CLKOUT)"

If we're talking about the PLL input clock (RCLK) then used to
generate CLKOUT it's indeed defined in the 8-135Mhz range, but
I don't see mention on it depending on the mode.

>  static void thc63_enable(struct drm_bridge *bridge)
>  {
>  	struct thc63_dev *thc63 = to_thc63(bridge);
> @@ -77,6 +94,7 @@ static void thc63_disable(struct drm_bridge *bridge)
>
>  static const struct drm_bridge_funcs thc63_bridge_func = {
>  	.attach	= thc63_attach,
> +	.mode_valid = thc63_mode_valid,
>  	.enable = thc63_enable,
>  	.disable = thc63_disable,
>  };
> --
> Regards,
>
> Laurent Pinchart
>

--gvPGo+RAdjC9O5ul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbl8PLAAoJEHI0Bo8WoVY8QswQAKrwuYiCQpGQXNl3ZMzyRPSC
j/0tlL+lXvyjwuz5vGCLhHSg4Zgm4Mk9KAdsPaFNt9gwiz9uLZNIF22gD6tpGjDi
XHhg6cb3/lQqlhmlqV4xQRml0EtTbmA50uNPQyKoBFg40nDQAyCwnU6IiDXUY9Ql
/NUhzrpKeHTWUMroj8D6LKivlg/MeOYBHBmg/vsuNdxBof/GRYFtXf+fbIV962i0
46P/my7ir4GTFzUR6p8XS3OkGDzuOxlplPf5ly5jK4nTxcHnHWC+/zz1zH4MInuK
3RJagFW+KtGfbNno1gqQn4NSRwxS3isyafO99p4C5BSv6AxmTXR07jvDx7o44xKu
aeH8Rxq/G6O/nL73sT6xXu1hexEK8RCIA/h1W27IaHcUVOiSwDWLv2nNAKMejrmx
oAdYDvCu4K0Z4R7oAX+N2ymVVPeV1aRG6+S7oWY4TbHazCnePL2ue0a6N2E7EzOo
Fn1Epgfgu1iPhdYqPgivGfQpFglNNXRvZ9EJ16mmCPat/dhVMwreAAriKplJOkpA
G04YV1JYls37S9lM/bDeOpsD8JD3QbEE5rAlWtaAneXh290uDXQ8y+TDDB1UoEkm
CqvHcxss4t1ghvbg+vEtmOMTAYU2/yQDsPEGfdL3LedsPANkXdt5/+LB8egypiB7
xEKmLlR/dTe2lkCdKjFk
=rTt8
-----END PGP SIGNATURE-----

--gvPGo+RAdjC9O5ul--
