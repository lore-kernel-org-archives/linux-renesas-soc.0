Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58328 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726744AbeGLQCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 12:02:04 -0400
Date: Thu, 12 Jul 2018 17:51:52 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not
 available
Message-ID: <20180712155152.lbpsbd6b5ai73bd6@ninjato>
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ka6liicic6xwhw4u"
Content-Disposition: inline
In-Reply-To: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ka6liicic6xwhw4u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 06:33:19PM +0200, Wolfram Sang wrote:
> EINVAL is very generic, use ENOTSUPP in case the gpiochip does not
> provide this function. While removing the assignment from the 'status'
> variable, use better indentation in the declaration block.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

So, Geert implemented get_direction for gpio-rcar, but this doesn't help
my case sadly. Because I2C is open drain, get_direction returns 'input'
:( As mentioned in a previous discussion, returning '0' and '1' from
get_direction() is confusing. But as it looks now, it also is not
enough. Or we'd need another function from which I could determine the
OUT_OPEN_DRAIN state.

For the short term, I will remove the sanity check from the I2C core and
hope the user properly set up the GPIO. It would be nice to check for it
somewhen in the future, though.

That all being said, I think this patch is still useful as is.

Thanks,

   Wolfram

> ---
>=20
> I got puzzled by the EINVAL until I found out that gpio-rcar simply does =
not
> implement it.
>=20
> @Geert: any reason gpio-rcar is missing it? I would need it for the
> i2c-gpio-fault-injector.
>=20
>  drivers/gpio/gpiolib.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index e11a3bb03820..18719f64e80b 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -210,15 +210,15 @@ static int gpiochip_find_base(int ngpio)
>   */
>  int gpiod_get_direction(struct gpio_desc *desc)
>  {
> -	struct gpio_chip	*chip;
> -	unsigned		offset;
> -	int			status =3D -EINVAL;
> +	struct gpio_chip *chip;
> +	unsigned offset;
> +	int status;
> =20
>  	chip =3D gpiod_to_chip(desc);
>  	offset =3D gpio_chip_hwgpio(desc);
> =20
>  	if (!chip->get_direction)
> -		return status;
> +		return -ENOTSUPP;
> =20
>  	status =3D chip->get_direction(chip, offset);
>  	if (status > 0) {
> --=20
> 2.11.0
>=20

--ka6liicic6xwhw4u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHeRQACgkQFA3kzBSg
KbYGjA//QucxcAgrdPKkRpqcWGG9luwzmI8T3oklLq2l7SiKrD4hyfyQmEYAF6K1
rhy79CYyfWPioVBzk5PHN0kAjAhEGr8Iwcyv7VvTif8YdHVbvTuX23MHbECjRHmq
jqxitIU3LwQrHuNlJjOha3BCszNYZOhwmlq3K46R5Azzecpl3Jn6af6YGR9S4OA4
2DFrkVYJzFIkm5ZYdlTovaq3EE/ChezhHjLx6nMXooS/rTPKZTpXN9VF+16OCp4y
tvCpX4mSi7Rw/aeKcQTLnWZM/C/8KCnXRugx4i1zBBVMeH3sMzj+8/inO8ffwRxE
x4nqctVlWeXMDkDbIVFgVtgzD5AORWmaHsFf1DWR5ELA3bK5Jyb8Gz0FaSfaynsb
8z4zBsq11Fz1Mc4pYoxPBUWPFhu3TYd+9fIGi84xbyJcJutAMovtnwabvRuM/MzA
7/Jd7n/bsp8U74mcylK4qh04cylTLKzDAZc9Pw1FDqRj1h7w80PSnO8Q4tAl4iUJ
w1q762YkrOgE5TzT+c9FFHjzjNhvGkf9mYBwkpdpDpC+XYhff0IENnlTF0nWeiWe
krYiXnbSBMN4FpmHEmlqCtfQ9Ll/fj1vHpTRvOcGNcjmOlu5YWdS8+Dkl26/9Pju
MDNNUOMqS+pKhZSjwpNU6cieS8kI9MuHYvggKFcdiuXu0Pr11L8=
=RDo8
-----END PGP SIGNATURE-----

--ka6liicic6xwhw4u--
