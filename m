Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60526 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbeHTT7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 15:59:01 -0400
Date: Mon, 20 Aug 2018 18:42:36 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77970 to
 whitelist
Message-ID: <20180820164236.26nocbvtr5scp62v@ninjato>
References: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ehemadftwerbfxi3"
Content-Disposition: inline
In-Reply-To: <fd225e1d-5215-df96-055a-07c9a14f41e7@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ehemadftwerbfxi3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 18, 2018 at 09:08:26PM +0300, Sergei Shtylyov wrote:
> I've successfully tested eMMC  on the V3H Starter Kit board. R8A77970 SoC
> has a single SDHI core anyway, so can't be  a subject to the known RX DMA
> errata...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Nit: some strange double spaces and '...' in the commit message:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

And out of interest: was this an HS400 eMMC memory?

Thanks!

> ---
> This patch is against the 'next' branch of Ulf Hansson's 'mmc.git' repo.
>=20
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -293,6 +293,7 @@ static const struct soc_device_attribute
>  	{ .soc_id =3D "r8a7795" },
>  	{ .soc_id =3D "r8a7796" },
>  	{ .soc_id =3D "r8a77965" },
> +	{ .soc_id =3D "r8a77970" },
>  	{ .soc_id =3D "r8a77980" },
>  	{ .soc_id =3D "r8a77995" },
>  	{ /* sentinel */ }

--ehemadftwerbfxi3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt673wACgkQFA3kzBSg
KbYR/Q//TDe/OfGXZGjDt1fwKp/ZUuyECJkuUmc+LsUCotL0dahV32pcWTVhhCiW
oE8TyQhRQNtzUbs9H74ZbhMj5Q6UxWBRImONAklNeKpdrOlKi6NRXLb0/SzLvtAj
lQWgZsUry8SPLd56a7FV2KqsrX65xrY7vpFa5ds/Y92VYO897/mdUU47/Myt935S
fIb9HWBXWMQX/9v9XVZ51oFItvOgZ+nXf4SSiLgis9I8KHK+R90v8AmQ86p3hzT/
xITfww2s8f4o7Cra28Yk8k2ZJs+0t1ZFuHGUeNowenjKHHq/USkHkyxZWowjXSbp
zvflGPtJ3q/iJHTViiud4GdK4foIOqqDDC2kf/QXSCOoy8pdIu7GF1Rcvz/CuClT
RZ90/J/TcJLWENLwu1mx0v8kKWNEkjSF01zj+Xr0L/MALUcYZ6WyybAXktaAeiMG
JEhp47tya8DICFnmMyrrn+mxCKa57GM0gmT3hfvjSHp5vvb/kWO7O7qb7bY8H70N
64PK/e0HmF/xCLHP98kDGzI46ia7vKq4C0OSJ1VrQoRGf4SO0ifLl8cNVCm7dj1H
n7BMRP4JNkHJEm0llLzrmvumIfpBO5LNNZ7VjHXcovg4Ma5jG8gKzkq4WY4vkanW
BeAkTyX5cZNVXrXXBsr/Kv0vXYhv/rwBV0Yu+5WIbixFNJMJGqg=
=cTs2
-----END PGP SIGNATURE-----

--ehemadftwerbfxi3--
