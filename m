Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44510 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727532AbeKIUoX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Nov 2018 15:44:23 -0500
Date: Fri, 9 Nov 2018 12:04:14 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dien Pham <dien.pham.ry@renesas.com>
Subject: Re: [PATCH] mfd: bd9571mwv: add volatile register to make DVFS work
Message-ID: <20181109110413.GC1031@kunai>
References: <20181003135841.4984-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5G06lTa6Jq83wMTw"
Content-Disposition: inline
In-Reply-To: <20181003135841.4984-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--5G06lTa6Jq83wMTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 03, 2018 at 03:58:41PM +0200, Wolfram Sang wrote:
> From: Dien Pham <dien.pham.ry@renesas.com>
>=20
> Because BD9571MWV_DVFS_MONIVDAC is not defined in the volatile table,
> the physical register value is not updated by regmap and DVFS doesn't
> work as expected. Fix it!
>=20
> Signed-off-by: Dien Pham <dien.pham.ry@renesas.com>
> [wsa: rebase, add 'Fixes', reword commit message]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Fixes: d3ea21272094 ("mfd: Add ROHM BD9571MWV-M MFD PMIC driver")
> ---

Any blockers for this one?

>=20
> Grabbed from the BSP and confirmed by the datasheet. The register is RO
> and reflecting states depending on other registers.
>=20
>  drivers/mfd/bd9571mwv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
> index 503979c81dae..fab3cdc27ed6 100644
> --- a/drivers/mfd/bd9571mwv.c
> +++ b/drivers/mfd/bd9571mwv.c
> @@ -59,6 +59,7 @@ static const struct regmap_access_table bd9571mwv_writa=
ble_table =3D {
>  };
> =20
>  static const struct regmap_range bd9571mwv_volatile_yes_ranges[] =3D {
> +	regmap_reg_range(BD9571MWV_DVFS_MONIVDAC, BD9571MWV_DVFS_MONIVDAC),
>  	regmap_reg_range(BD9571MWV_GPIO_IN, BD9571MWV_GPIO_IN),
>  	regmap_reg_range(BD9571MWV_GPIO_INT, BD9571MWV_GPIO_INT),
>  	regmap_reg_range(BD9571MWV_INT_INTREQ, BD9571MWV_INT_INTREQ),
> --=20
> 2.19.0
>=20

--5G06lTa6Jq83wMTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvlaaoACgkQFA3kzBSg
KbZmyQ/9HdBVCRii9XEPQwsnVJVfjBRwXDZd42cdiN7Oid//ecgUav6omCPP5U3M
uPw3FHXM8tbTqMw5pTkc7SresKAHgcP8xnoZpjwdBt2p8EPTAhAHjbYX396jTaOR
qLOIhMD8PgWm0/4Swo5XylkPI5eQ54D8uLPYTPbWe1BZ4ZsbL2g/TLjAHpo7Xxdn
wcrJw00+RhB55s5Mm8obz4Yt8zk4KNzWC/5dd0dsbBUtEd6sxT7dspN7kD532uUv
CRYj3+IEhwEdbTX1Ez/d7Ha5s2d/M6g3DYDVjdg6R5lWvZ498H5Wmg0KZ9lVxSjL
n9ZqxtLrtPHAHCdQlHoaQeR19J5pSZoIhrPf/zz22YEJq6IqLEkSQW7X3ulFJhCY
042TzL2zzGcTU4V06YSZoeiPri5BhPYwhNkAdz9cwmEazU9DhJEY7F7htzLQmZdW
u2uiSjZ1KeKDDBbbgxvDqPE2Wxl4hDHE1IHpYD6TMk6KoF3Et6TsbxTz1ZunFBN5
YnyT+Q76D0u4r5U4eutULrvfLaBaJsnW09APAhw3y1ufrWGSeVUxLFcQ0J+EG3HU
BhmO3+lEiRkRrqGpSXWv2e6SzwQpE/1/wENxoZHYCf5sDllqccqYyL2ef9CXfjRd
fyshKJR7nDr8dV1ySzx5hP5I+KkA+Woz1WMnXK0DREQtfnbys1s=
=0IVk
-----END PGP SIGNATURE-----

--5G06lTa6Jq83wMTw--
