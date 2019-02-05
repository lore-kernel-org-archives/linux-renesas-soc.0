Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109C3C282D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC53920844
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 13:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfBENit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 08:38:49 -0500
Received: from sauhun.de ([88.99.104.3]:57694 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729363AbfBENis (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 08:38:48 -0500
Received: from localhost (unknown [46.183.103.8])
        by pokefinder.org (Postfix) with ESMTPSA id 961DC4A16DD;
        Tue,  5 Feb 2019 14:38:46 +0100 (CET)
Date:   Tue, 5 Feb 2019 14:38:46 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v2] i2c: rcar: refactor TCYC handling
Message-ID: <20190205133845.GJ12401@kunai>
References: <20190205133725.27688-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Content-Disposition: inline
In-Reply-To: <20190205133725.27688-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 02:37:25PM +0100, Wolfram Sang wrote:
> The latest documentation made it clear that we need to initialize the
> TCYC value independently of DMA. The old code used TCYC06 (wrongly) for
> non-DMA transfers. The new code sets TCYC up independently from DMA.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

The latter SoB shouldn't be there yet.

> ---
>=20
> Change since v1: improve commit message per Simon's comment.
>=20
>  drivers/i2c/busses/i2c-rcar.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
> index 498ba4b87833..dd52a068b140 100644
> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -39,8 +39,8 @@
>  #define ICSAR	0x1C	/* slave address */
>  #define ICMAR	0x20	/* master address */
>  #define ICRXTX	0x24	/* data port */
> -#define ICDMAER	0x3c	/* DMA enable */
> -#define ICFBSCR	0x38	/* first bit setup cycle */
> +#define ICFBSCR	0x38	/* first bit setup cycle (Gen3) */
> +#define ICDMAER	0x3c	/* DMA enable (Gen3) */
> =20
>  /* ICSCR */
>  #define SDBS	(1 << 3)	/* slave data buffer select */
> @@ -83,7 +83,6 @@
>  #define TMDMAE	(1 << 0)	/* DMA Master Transmitted Enable */
> =20
>  /* ICFBSCR */
> -#define TCYC06	0x04		/*  6*Tcyc delay 1st bit between SDA and SCL */
>  #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
> =20
> =20
> @@ -212,6 +211,10 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
>  	rcar_i2c_write(priv, ICMSR, 0);
>  	/* start clock */
>  	rcar_i2c_write(priv, ICCCR, priv->icccr);
> +
> +	if (priv->devtype =3D=3D I2C_RCAR_GEN3)
> +		rcar_i2c_write(priv, ICFBSCR, TCYC17);
> +
>  }
> =20
>  static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
> @@ -363,9 +366,6 @@ static void rcar_i2c_dma_unmap(struct rcar_i2c_priv *=
priv)
>  	/* Disable DMA Master Received/Transmitted */
>  	rcar_i2c_write(priv, ICDMAER, 0);
> =20
> -	/* Reset default delay */
> -	rcar_i2c_write(priv, ICFBSCR, TCYC06);
> -
>  	dma_unmap_single(chan->device->dev, sg_dma_address(&priv->sg),
>  			 sg_dma_len(&priv->sg), priv->dma_direction);
> =20
> @@ -461,9 +461,6 @@ static void rcar_i2c_dma(struct rcar_i2c_priv *priv)
>  		return;
>  	}
> =20
> -	/* Set delay for DMA operations */
> -	rcar_i2c_write(priv, ICFBSCR, TCYC17);
> -
>  	/* Enable DMA Master Received/Transmitted */
>  	if (read)
>  		rcar_i2c_write(priv, ICDMAER, RMDMAE);
> --=20
> 2.19.1
>=20

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlxZkeUACgkQFA3kzBSg
KbZEpQ/+JFg2XgGQy1lOaY+HBhBDmLVSY9CJj+wbXYoYutqJLqAiM0/vFTztnRBh
E8YLiXaN+veitw6duGJdPX/emBG9Xjfl0fVzAncV/r9pjKl+2ejRF/W4y95cwG/W
r0+TAQQHXJOMPSfdJBhtbSDVvTcapfKVV0jEX/f3OIk8BzKLlqozCuK6isobU3b4
KwxUBCCtKP40fR+XweAQ3yLtejsxOgAn52CKtTK4PAQt9qQ10wak/NY9/Sa+1wIl
6VkhJMk+XA5TftLcemtGbpN6932ScczN7k87QI7LQF8R0c1y6z5sYn7DEirn5KUh
3mAszpELXwRcDIQKP/FjrF4X1t8nTK6Q65rBDjQ3mspBvZ52FWVFms+P4ok4fdcs
fYVFAzvHnOckea5q5qDGcoirhHwD7Zr2R+XKNw46a5eRETS/GgjOqJFcXuoax0ND
oNxQ3tga65q1d7BU176OIKrjPlbySllVbCiyoYAJHPUfaTcr4xccyTpGjPzbnfJd
uCu7pgpSvFqGEcBDtQmgsp8oHF1lwjinjihat60xShNwR3+C1S/pAGrht5kn5+gY
lPkWbCETBLyTaMM6L+5R0TD5NynDNWK53mhMv4RnObXxjc2wV5sDZKVQQfRTOlUW
ZGqFjlIV4E349yfjutjhPJX9/0bYHkttXT+gnzEJRQJgECUIArQ=
=d3oP
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
