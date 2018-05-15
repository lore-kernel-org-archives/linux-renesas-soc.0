Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:42708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752002AbeEOQTY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 12:19:24 -0400
Subject: Re: [PATCH] drm: rcar-du: Fix rcar_du_of_init() stub
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <20180515155736.3379-1-laurent.pinchart+renesas@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <366cef21-1be2-834e-203d-eb66e684e519@ideasonboard.com>
Date: Tue, 15 May 2018 17:19:19 +0100
MIME-Version: 1.0
In-Reply-To: <20180515155736.3379-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="9D7TGpkbHqmfAFVWG94CRnJdX0VjfcsSn"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9D7TGpkbHqmfAFVWG94CRnJdX0VjfcsSn
Content-Type: multipart/mixed; boundary="KfBdty9EcDEPOhyXshZ7Bpa22wtzdnPol";
 protected-headers="v1"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <366cef21-1be2-834e-203d-eb66e684e519@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix rcar_du_of_init() stub
References: <20180515155736.3379-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180515155736.3379-1-laurent.pinchart+renesas@ideasonboard.com>

--KfBdty9EcDEPOhyXshZ7Bpa22wtzdnPol
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Laurent

Thanks for identifying this fault and posting the fix.

(+linux-renesas-soc)

On 15/05/18 16:57, Laurent Pinchart wrote:
> The rcar_du_of_init() function is supposed to be defined as a stub when=

> CONFIG_DRM_RCAR_LVDS is disabled as the rcar_du_of.c file isn't compile=
d
> in that case. However, a bug in the configuration option check makes it=

> a stub when CONFIG_DRM_RCAR_LVDS=3Dm as well, which prevents legacy DTs=

> from being fixed at boot time. Fix the configuration option check by
> using IS_ENABLED.
>=20
> Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encode=
r nodes")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_of.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.h b/drivers/gpu/drm/rca=
r-du/rcar_du_of.h
> index c2e65a727e91..8dd3fbe96650 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.h
> @@ -11,7 +11,7 @@
> =20
>  struct of_device_id;
> =20
> -#ifdef CONFIG_DRM_RCAR_LVDS
> +#if IS_ENABLED(CONFIG_DRM_RCAR_LVDS)
>  void __init rcar_du_of_init(const struct of_device_id *of_ids);
>  #else
>  static inline void rcar_du_of_init(const struct of_device_id *of_ids) =
{ }
>=20


--KfBdty9EcDEPOhyXshZ7Bpa22wtzdnPol--

--9D7TGpkbHqmfAFVWG94CRnJdX0VjfcsSn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEkC3XmD+9KP3jctR6oR5GchCkYf0FAlr7CIcACgkQoR5GchCk
Yf2Uqw//VCL5C5oV7KHbuyQ8Uq3V0Iw9Jlo7cHLzC+ppi2iOJpQPlRM6w9Zsgzpa
mzDJPvgsFm1+KWfxhlJeUIh9cYlmtF03+/LWhPp3279eDFE86cRhAnCJKM/R/Qkg
ffAijr9/EqrKB6vJVxnNu/J4ft/rcVmGi0x/vTNBvAy/ArfVK3Z2Xlzlm/XXo3Dc
gVkQEGevSq11uBD0hfHPjTJ54nEilu8LQpyAVi1HceAYsdpPzMpmYqqrp2ONFBdA
pxkXqlQkQXc3jbm8DxahxL901Zdk2e9sAk9GuIqYheIJHQaTtPlI0dNDuJ4X+K5P
nQPc6SlE0npiLDD5g4F3l+5up9EtBbWdVou6mS/Pq3qs71tOs0mCfCNDYKCE9Oy8
nW2utwBagSGd449d+GyKa1N9rgIlojbo2AWKTg2X6cwtVz5kL1zQegWnHxr1E0EF
apyceElivM4dT9zB1bzCz3l7mFrPLWEKm74uHvRCe/zjHKU4mZlCetqUwUbYazHc
PsRJYIQ71m356tA93iFEb45J+zD4JpQ0NXNGZeeckNETO1Us2hQ4GqFoNryj8BJk
an1lEUKzHzr4G9roL87m/LQIY/Ww9O2ZUmO4xkDOILmA7FaCVY9blxXDD2LywvIM
stX585BjExQH3VoB96vCVY3e5tKMPuvFEuSPmJcgYRidh5c6wfA=
=rkjt
-----END PGP SIGNATURE-----

--9D7TGpkbHqmfAFVWG94CRnJdX0VjfcsSn--
