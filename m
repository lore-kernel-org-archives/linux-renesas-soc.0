Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:49989 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbeJOPho (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 11:37:44 -0400
Date: Mon, 15 Oct 2018 09:53:31 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] pinctrl: rzn1: Fix check for used MDIO bus
Message-ID: <20181015075331.GC21294@w540>
References: <20181012104036.28829-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
In-Reply-To: <20181012104036.28829-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Phil,

On Fri, Oct 12, 2018 at 11:40:36AM +0100, Phil Edworthy wrote:
> This fixes the check for unused mdio bus setting and the following static
> checker warning:
>  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
>  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'
>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
>  drivers/pinctrl/pinctrl-rzn1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
> index ce05e3a00be2..f688f3a29dfd 100644
> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -195,7 +195,7 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
>  static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
>  				     u32 func)
>  {
> -	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> +	if (ipctl->mdio_func[mdio] != -1 && ipctl->mdio_func[mdio] != func)
>  		dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
>  	ipctl->mdio_func[mdio] = func;
>

MY understanding here is that the static checker complains because you
are comparing a variable of unsigned type to negative values, and
indeed you are treating mdio_func as signed in the driver code.

mdio_func is defined as:

struct rzn1_pinctrl {
        ...
	u32 mdio_func[2];
        ...
};

Then in probe function mdio_func gets intialized as:

	ipctl->mdio_func[0] = -1;
	ipctl->mdio_func[1] = -1;

I think you could safely make mdio_func integers, or either define an
INVALID value ( > 0), intialize them it that value and check against it for
validity.

Thanks
   j


> --
> 2.17.1
>

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxEd7AAoJEHI0Bo8WoVY8TcUP/3x3qv+fAcYiqJL6wZ9Gy/cB
hyW+YFeJxQFm6F5Jle5SDGTFxzvo8zsHT/BV2FHiBxrVZyeLPnLC8JtXlD+SqHeT
vgojwmsql66wgt6AEbY9nnO6mSNl8xsyC6t0QmYvj/hFRpY9m9mBNHYDtY6/mM9Z
blSL+jZNFCwF09qSzAFPet8BwGFhoYHrt0zwKTHKSBDK8Oe2I75mGq6A91GiSWGS
bvp+pq/1PR7lcMgLA6Ip7ruc2P5ZsNUF90sw1eGjOfcjnaylrxZqqaYOYyTJHIvp
LbsFRjtexm0fWxdcYmDb658VF22o4u+17XzOyUH2WOou7RRqDlC8Mo6CVO1HKzeP
EaTrhTfdHHPYlIn2sGhbNP39QNSSopYpe4ZJVgMQfvQ4JGOZ634Ea/FMvT+/k0tm
e5d2JlJm7BbR3CNCDgi2A/KkeTToBAC+gEClbXhvhOKxUmRxc8jzvv7/rCkka9Ux
kF5F6Eprj2yoQgdZL2513vrWFcHZWSSBedPHDJO0Fkn7J9v8u1LwtLzqM3d4Cj7a
Vt7Ux3rMjGM0TGAshUxGJNKnXnY+gKgRGzGexwB5/Xn3c5L68ZMXvswYbOlWdQ9y
7ET3O5AR53usU9CgaF+U7VpQSHRL3QNyK7M6tDJQ3NwjldCmWi7zCd/3glqQB1Cg
OeMEUXpNOGEJvuedZR5O
=kkKv
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--
