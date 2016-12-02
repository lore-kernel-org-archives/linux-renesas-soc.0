Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:27296 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752580AbcLBQXW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 11:23:22 -0500
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>
CC: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [RFC 1/3] gpio-rz: Port to v3.18
Date: Fri, 2 Dec 2016 16:23:17 +0000
Message-ID: <SG2PR06MB116500CB10B4B9C5CF4490598A8E0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1480693434-9415-1-git-send-email-jacopo@jmondi.org>
 <1480693434-9415-2-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1480693434-9415-2-git-send-email-jacopo@jmondi.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/2/2016, Jacopo Mondi wrote:
> Fix invalid return value in gpio remove function
>=20
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/gpio/gpio-rz.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-rz.c b/drivers/gpio/gpio-rz.c index
> a933dab..cb8f785 100644
> --- a/drivers/gpio/gpio-rz.c
> +++ b/drivers/gpio/gpio-rz.c
> @@ -175,7 +175,8 @@ static int rz_gpio_remove(struct platform_device
> *pdev)  {
>  	struct rz_gpio_priv *p =3D platform_get_drvdata(pdev);
>=20
> -	return gpiochip_remove(&p->gpio_chip);
> +	gpiochip_remove(&p->gpio_chip);
> +	return 0;
>  }
>=20
>  static const struct of_device_id rz_gpio_dt_ids[] =3D {
> --
> 2.7.4


What tree/branch is this based off?



Chris
