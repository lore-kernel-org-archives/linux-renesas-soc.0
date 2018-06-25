Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44530 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934199AbeFYOaE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 10:30:04 -0400
Date: Mon, 25 Jun 2018 23:29:57 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
Message-ID: <20180625142956.egsm4nzc5ithrlsf@ninjato>
References: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fhap5ojs3zsuju7l"
Content-Disposition: inline
In-Reply-To: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--fhap5ojs3zsuju7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2018 at 09:56:36PM +0900, Wolfram Sang wrote:
> It seems that during the conversion from gpio* to gpiod*, the initial
> state of SCL was wrongly switched to LOW. Fix it to be HIGH again.
>=20
> Fixes: 7bb75029ef34 ("i2c: gpio: Enforce open drain through gpiolib")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> Linus: Or was it intentional? But then I am missing something... I found =
this
> by trying to fix a regression. I can't scope my use case now because I am=
 on
> the road. I recall SCL being unexpectedly LOW when using the GPIO fault
> injector the last time, though. This made me do a fix in the underlying
> i2c-algo-bit algorithm, but that sadly caused a regression :( So, this ma=
y be
> the proper fix. RFC for now, until I have my scope back. But discussion is
> welcome.

Linus: any comment?

>=20
>  drivers/i2c/busses/i2c-gpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
> index 005e6e0330c2..66f85bbf3591 100644
> --- a/drivers/i2c/busses/i2c-gpio.c
> +++ b/drivers/i2c/busses/i2c-gpio.c
> @@ -279,9 +279,9 @@ static int i2c_gpio_probe(struct platform_device *pde=
v)
>  	 * required for an I2C bus.
>  	 */
>  	if (pdata->scl_is_open_drain)
> -		gflags =3D GPIOD_OUT_LOW;
> +		gflags =3D GPIOD_OUT_HIGH;
>  	else
> -		gflags =3D GPIOD_OUT_LOW_OPEN_DRAIN;
> +		gflags =3D GPIOD_OUT_HIGH_OPEN_DRAIN;
>  	priv->scl =3D i2c_gpio_get_desc(dev, "scl", 1, gflags);
>  	if (IS_ERR(priv->scl))
>  		return PTR_ERR(priv->scl);
> --=20
> 2.11.0
>=20

--fhap5ojs3zsuju7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsw/GAACgkQFA3kzBSg
KbbZKA//etAobVNJ38Ba6RphktfEd8uoLvQbCoFr9RfytvYAjww1PoMM2MklAg79
DGNV/aYmFqc6Xu8tTJIcOMBhPDwt67yAPVF7mRssCnQo/h9ymFBG1MLgzRCBxO9I
sgihrj6HkZ1Oy1KX6uetEjQ+Lj+LIu56B+Pt7xcwstOru7gxIyTe71HO9z4TpUON
/u7aqxaPlaG6F5mTR1nO38d4bYcVdVb6fVhdeOH2Hf+hnMTqQVWzJXqkYN/m82Nw
4hrLH4nKUHr4E6xilbZRfvHuGYTfv3ZTnxCu5u+h9OBRFBBjllJ0ROEkmMgGy0nX
CkXmtFEMfY26oPTKEoZfJD9QQzuDGiMLPCHDG6bBKx7u8dzZjfcJq1+KviIY54Y6
z45j7AX/D14k+n4mM9aK/yMOOLyut4HyemsB8yypfBoRbufHe5Y+TXW1K7pJCoA5
b2dMYtQAS2NNjojmhsMRlan49+pCYrRxLTqtYFV0rWe2FDcz4HWPT7UgAUt7TS6C
sLCJccsy4LaVGJJZpIUMOq10Sdi1N54PmhPCwjwYZRfuljjUuMfA0I2UpMiLLPPL
cttw6QrUJX9WJqUbEYazwr6d5jccyjNc8/vYAzBeBwMQd4Fu/CuWiZUedyuxNUM8
qHR9S0gVEeGSf7VQXUrVRBVlDLKucLmgmqil/ASLEmWWpFrCtBQ=
=ZgGD
-----END PGP SIGNATURE-----

--fhap5ojs3zsuju7l--
