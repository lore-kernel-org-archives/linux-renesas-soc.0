Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43103 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbeJOW5v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Oct 2018 18:57:51 -0400
Date: Mon, 15 Oct 2018 17:12:06 +0200
From: jacopo mondi <jacopo@jmondi.org>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: rzn1: Fix check for used MDIO bus
Message-ID: <20181015151206.GE21294@w540>
References: <20181015150147.23295-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="DqhR8hV3EnoxUkKN"
Content-Disposition: inline
In-Reply-To: <20181015150147.23295-1-phil.edworthy@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--DqhR8hV3EnoxUkKN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Phil,

On Mon, Oct 15, 2018 at 04:01:47PM +0100, Phil Edworthy wrote:
> This fixes the check for unused mdio bus setting and the following static
> checker warning:
>  drivers/pinctrl/pinctrl-rzn1.c:198 rzn1_pinctrl_mdio_select()
>  warn: always true condition '(ipctl->mdio_func[mdio] >= 0) => (0-u32max >= 0)'
>
> It also fixes the return var when calling of_get_child_count()
>

Not really, since you skip the assignement if return value is <= 0:

	nfuncs = of_get_child_count(np);
	if (nfuncs <= 0)
		return 0;

	ipctl->nfunctions = nfuncs;

This seems more likely to be here to make 'rzn1_pmx_get_funcs_count()'
happy, as it returns a signed integer, but since nfunctions is only
assigned if 'nfuncs' > 0, then the cast is safe there.

I would keep this unsigned, and rather return an error if
'of_get_child_count()' returns an error of any sort in 'probe_dt()',
otherwise assign 'ipctl->nfunctions = nfuncs;' unconditionally and
return immediately if nfuncs == 0. This makes sure nfunctions is
initialized even if there are no functions registered.

Anyway, small issues, this just doesn't belong to this patch, but it's
likely not to cause any harm I guess.


> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v2:
>  - Don't use implicit type conversion.
>  - Fix type of return var when calling of_get_child_count().
> ---
>  drivers/pinctrl/pinctrl-rzn1.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pinctrl/pinctrl-rzn1.c b/drivers/pinctrl/pinctrl-rzn1.c
> index ce05e3a00be2..4998463c54a0 100644
> --- a/drivers/pinctrl/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/pinctrl-rzn1.c
> @@ -112,13 +112,13 @@ struct rzn1_pinctrl {
>  	struct rzn1_pinctrl_regs __iomem *lev2;
>  	u32 lev1_protect_phys;
>  	u32 lev2_protect_phys;
> -	u32 mdio_func[2];
> +	int mdio_func[2];
>
>  	struct rzn1_pin_group *groups;
>  	unsigned int ngroups;
>
>  	struct rzn1_pmx_func *functions;
> -	unsigned int nfunctions;
> +	int nfunctions;
>  };
>
>  #define RZN1_PINS_PROP "pinmux"
> @@ -195,9 +195,9 @@ static void rzn1_hw_set_lock(struct rzn1_pinctrl *ipctl, u8 lock, u8 value)
>  static void rzn1_pinctrl_mdio_select(struct rzn1_pinctrl *ipctl, int mdio,
>  				     u32 func)
>  {
> -	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != func)
> +	if (ipctl->mdio_func[mdio] >= 0 && ipctl->mdio_func[mdio] != (int)func)
>  		dev_warn(ipctl->dev, "conflicting setting for mdio%d!\n", mdio);
> -	ipctl->mdio_func[mdio] = func;
> +	ipctl->mdio_func[mdio] = (int)func;
>
>  	dev_dbg(ipctl->dev, "setting mdio%d to %u\n", mdio, func);
>
> @@ -810,8 +810,8 @@ static int rzn1_pinctrl_probe_dt(struct platform_device *pdev,
>  	struct device_node *np = pdev->dev.of_node;
>  	struct device_node *child;
>  	unsigned int maxgroups = 0;
> -	unsigned int nfuncs = 0;
>  	unsigned int i = 0;
> +	int nfuncs = 0;
>  	int ret;
>
>  	nfuncs = of_get_child_count(np);
> --
> 2.17.1
>

--DqhR8hV3EnoxUkKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxK5GAAoJEHI0Bo8WoVY8AyAQAI5cgF8rZm22ckAInAnGMSfi
2GggeEW6zfF+/O/tAW/Ck/cl0lNA7oop519j81hONpQK0C6BIVlfB9ivQHkUa+6K
e/NDLwiUTXLRFEqEj7pw9zppD+Y1j1xBNIaDiQxr7y756INPEgPHgvEY5Rv/2+PM
On6DvDuCRXYOvX0dCkH2l1UOOt066D/N5dIfv4o7G8/apSdnZsZiaNEvNYT3n74K
2XzF6U3sEDU5jK62u8D+2+PhkfG8VCZPH5joH6EDRcpqwIOgMiv4zLQ4h3oDTTmc
IYrNIYc9QLBzBeSnhY+617vnszgPrMH9vwYSeMHhUorMLwkC7d36vEUF7TVJnczi
y6U/J0GlmwWNnr4vfbiYAa6aburSuldyXZtrVJaZ97LEClIfLfoT/ZKiKV6+Gn8q
DmMJXv1wZBY8ToLdIOb0ZYrnnWWZhO3UzMHzV+fIW0x0p2u4WmGlLRGjx4OGKJTB
FOGKiEzoCfkIa2aYX13LkzBKOnFvZJkMmd/DO812QjhTngFcOy9esBnM/Pv/l3Vy
qBA6jB/aXKMOswQLE07FDsWvsilk1LtwhfEt8SM7755bcCg3pN/LmT2MyW+ayR+y
3eswF/Eksbmj3dcxMGiND1ou9Zq48McIerhl14yGXvKrnjmz3xFCaDLGO7xEiANL
ev20CIM+2gJzSRnuqftk
=Cohu
-----END PGP SIGNATURE-----

--DqhR8hV3EnoxUkKN--
