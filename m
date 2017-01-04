Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36341 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752704AbdADHG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 02:06:58 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so89967929wma.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Jan 2017 23:06:57 -0800 (PST)
Date: Wed, 4 Jan 2017 08:06:54 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v2.1 04/13] drm: Add data transmission order bus flag
Message-ID: <20170104070654.GB5729@ulmo.ba.sec>
References: <7f668e382fa001811f961abfb398c9c9@agner.ch>
 <20170104003926.29683-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
In-Reply-To: <20170104003926.29683-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 02:39:26AM +0200, Laurent Pinchart wrote:
> The flags indicate whether data is transmitted lsb to msb or msb to lsb
> on the bus.
>=20
> The exact meaning is bus-type dependent. For instance, for LVDS buses
> the flags indicate whether the seven data bits transmitted in a clock
> pulse are sent in normal order (msb to lsb, slots 0 to 6) or reverse
> order (lsb to msb, slots 6 to 0).
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> Changes since v2:
>=20
> - Rename the flag to DRM_BUS_FLAG_DATA_LSB_TO_MSB and add a
>   corresponding DRM_BUS_FLAG_DATA_MSB_TO_LSB flag.
> ---
>  include/drm/drm_connector.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index a9b95246e26e..712f255577ea 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -160,6 +160,10 @@ struct drm_display_info {
>  #define DRM_BUS_FLAG_PIXDATA_POSEDGE	(1<<2)
>  /* drive data on neg. edge */
>  #define DRM_BUS_FLAG_PIXDATA_NEGEDGE	(1<<3)
> +/* data is transmitted msb to lsb on the bus */
> +#define DRM_BUS_FLAG_DATA_MSB_TO_LSB	(1<<4)
> +/* data is transmitted lsb to msb on the bus */
> +#define DRM_BUS_FLAG_DATA_LSB_TO_MSB	(1<<5)

Nit: "LSB" and "MSB" because they're abbreviations. If I end up applying
this I'll probably do that myself, and I leave it up to whoever else
might apply it whether or not they want to be pedantic, so:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlhsnwwACgkQ3SOs138+
s6Ghyw//dD1BGfEBdyqpYc0O3KMeIluh1h3cngIB7noc3EhajNgZ5os1P9Ucg67b
Jz9UdaddKww2odrxqle2eOtbfdE1qWK8A81u0VElGXML086i0rovxNVE5LlQb5ag
KIzDovNxRb8O2yQi0s4pvmi5rA81rzuUgHsEBo5KFP1DmTjMiBpNjbmFaXb7tgWR
sg6bQKBTZvAjArJPkDkaqWoedj1pWKZundSI5Ks+YCWJAwxaPBxirOBwTixqSBEO
eBLOVNYVkMpt/tOI9Vngp/6fJEIQAM1bMEYpSGkKoF5Sn48bUrga9FoQcGLc0Lmg
owLgsGEfrnlVZhfgpK2seHc+raG0X4NfMFe2NO6tvnXmRQoLgFZkW7DTnwVpWK/U
dlAZQxXiG3sHgERzcb20dMBHmym7eo1Mo695fMZTjHZl4XVRTBL+r0ZkkvF+KCaG
r/Bh21VIflPJAFy2QukHo1QpVnoof0nBymoszWUU5ME+xM/JH+BDyVlQhR5o7Ak+
KkOSlkNVdBx/a+YDL4hdRd1mlTpfU7Y1c9diyVkOeYq3ueaMmGNRrsmGAO4H8gkU
ZcZOrtiivnXCheyJEELHwSCE+dyKkdYW5K751nQdkswDctDftmSRxQeCJaVXISjC
h2HeT7ESTfhUeSnNAdILFylNwS4KqK52aDJkmWLSuhFpyjQzoms=
=iC8G
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
