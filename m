Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40590 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754034AbeEaIbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 May 2018 04:31:31 -0400
Date: Thu, 31 May 2018 10:31:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
Message-ID: <20180531083129.qtcxoiupqeh6xzg3@ninjato>
References: <20180529105847.15663-1-wsa+renesas@sang-engineering.com>
 <20180529105847.15663-2-wsa+renesas@sang-engineering.com>
 <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="slj2nmp7edo7rn3h"
Content-Disposition: inline
In-Reply-To: <TY2PR01MB2297BC5F12034143657590A7D86C0@TY2PR01MB2297.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--slj2nmp7edo7rn3h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Shimoda-san,

> > Subject: [RFC PATCH 1/1] i2c: rcar: handle RXDMA HW bug on Gen3
>=20
> If possible, I'd like to replace "bug" with "specification" or other word=
s :)

"behaviour" maybe is a better word?

> > +	/* Gen3 has a HW bug which needs a reset before allowing RX DMA once =
*/
> > +	if (priv->devtype =3D=3D I2C_RCAR_GEN3) {
> > +		priv->flags |=3D ID_P_NO_RXDMA;
> > +		if (!IS_ERR(priv->rstc)) {
> > +			ret =3D reset_control_reset(priv->rstc);
>=20
> According to the datasheet Rev.1.00 page 57-69, we should do:
> 	reset_control_assert();
> 	udelay(1);
> 	reset_control_deassert();
> 	while (reset_control_status())
> 		;
> instead of reset_control_reset(), I think.

I was following Geert's suggestion here from the mail thread '[periperi] Ab=
out
BSP patch "i2c: rcar: Fix I2C DMA reception by adding reset':

=3D=3D=3D

>> reset_control_assert() + reset_control_deassert() can be replaced by
>> reset_control_assert().
>
> Do you mean 'reset_control_reset' maybe? I am not sure, I don't know
> this API very well... but two time *_assert looks suspicious.

Of course. Silly c&p.

>> In addition, that will make sure the delay of one cycle of the RCLK clock
>> is taken into account, which is not the case with the current code.
>=20
> I guess this is why there is now this patch in the BSP which Shimoda-san
> mentioned in a later mail:
>
> f0cd22525f73 ("i2c: rcar: Fix module reset function for hardware specific=
ation")

Exactly.

=3D=3D=3D

As far as I understood it takes care of the proper reset mechanism with the=
 delay?

Kind regards,

   Wolfram


--slj2nmp7edo7rn3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsPst0ACgkQFA3kzBSg
KbaqBg//RN2eMHqMJ5dbFeWqWXxIY82UnP5sBhHhWPE58h1sLItBSLqyo3XH8gos
ngBRS6e65qGzrsOVhX6hi37fI2rFC2RAS4Lq6pqFXzWnUj+Iw6up3WXPJWzJA9pf
nbclmDvK9jrLzFDkOnXZ7XigQ209mUIKz76IqFyJ91sJwSPtpW4FySVeINz9q6wH
uIGbiq/2cQYnljLpiPKR4uaotnJfBFG9UWiAARfk0alIjxJMLO3djdwMmKkU+285
xdIJr2PEn5I+3iSAWg8Jt+UPQhKTDyns7qQT//cMzXN+5zyA+3+LqRmEYnmVUb4J
7hZ8rHi5qjTVSSJihzBfusFgwJQqUKpSixTS3VUgnUkD4SOr5dP9eMkRLZr8WT7i
rSCQCz4G7tKvNI1bpEMZBVTgIx+wkxeFF2tgT5tjAePnIJUrZ5SQr7FdzfIlPYXe
94GOpBLOmdohsDQm159Clxrd7Rrc7bJMZqbfhhqzfe8m8Qogy3oRRObMiBem6exm
B2rB074qIQBQHJvSHIKqB6TqKlVCuYYaywkc8n/w2/yXwVf2IFAkZBak98R56q4o
yWpQa8k0gUJmCv8AWnFvziBWGVdoQWYOvtmjwu1EpWuzM8q1qNJv+K2cEyeSBwL6
IJ4M7paYGQYcnVARAsUXm1aYlTeO3ekY7oUPA3/VRcndA6OVFas=
=26HN
-----END PGP SIGNATURE-----

--slj2nmp7edo7rn3h--
