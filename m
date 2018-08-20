Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbeHTTzU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 15:55:20 -0400
Date: Mon, 20 Aug 2018 18:38:56 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
Message-ID: <20180820163856.cqp62em4ccerf7x5@ninjato>
References: <711ef434-1208-4a9b-1c0d-519395251531@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e5p3cyapiqihjxyf"
Content-Disposition: inline
In-Reply-To: <711ef434-1208-4a9b-1c0d-519395251531@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--e5p3cyapiqihjxyf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 07:54:09PM +0300, Sergei Shtylyov wrote:
> I have encountered an interrupt storm during the eMMC chip probing (and
> the chip finally didn't get detected). It turned out  that U-Boot  left
> the SDHI DMA interrupts enabled while the Linux  driver didn't use those.
> Masking those interrupts in renesas_sdhi_internal_dmac_request_dma() gets
> rid  of both  issues...
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for fixing this issue.

>=20
> ---
> The patch is against Ulf Hansson's 'mmc.git' repo's 'fixes' branch.
>=20
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |   11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> Index: mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- mmc.orig/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ mmc/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -51,10 +51,12 @@
>  #define INFO1_CLEAR		0
>  #define INFO1_DTRANEND1		BIT(17)
>  #define INFO1_DTRANEND0		BIT(16)
> +#define INFO1_RESERVED_BITS	GENMASK_ULL(32, 0)

31?

Also, RESERVED_BITS is not quite proper. Not all of those bits are
reserved. Maybe CLEAR_MASK?

>  /* DM_CM_INFO2 and DM_CM_INFO2_MASK */
>  #define INFO2_DTRANERR1		BIT(17)
>  #define INFO2_DTRANERR0		BIT(16)
> +#define INFO2_RESERVED_BITS	GENMASK_ULL(32, 0)

Same as above. Maybe we even need one define only?

> +	/*
> +	 * We don't use the DMA interrupts,  but they might have been enabled
> +	 * by a bootloader,  so mask them to avoid an interrupt storm...
> +	 */

Two spaces after ',' looks odd to me. Also, no need for "..."
I'd even think with a name like CLEAR_MASK, the comment could even go.

> +	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO1_MASK,
> +					    INFO1_RESERVED_BITS);
> +	renesas_sdhi_internal_dmac_dm_write(host, DM_CM_INFO2_MASK,
> +					    INFO2_RESERVED_BITS);


--e5p3cyapiqihjxyf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt67pwACgkQFA3kzBSg
KbbXtA/+OwDUCb00f/cCHXbZx7q22Z2a1dOMPML9cyOvEXvXxuV++6rmDmOkmAZI
1Ya33BSYsdu4CprlBt2c119Z1VSMBXgGpFPpv8JeVx7V6tcqoGngeY7Ft3Pg9LsG
5EQTFJJKkxFeHeNCx2Kp8j8BXh8RPz1IEL4aUeu66GbQQONc2xmE4X16FSicUZH2
k9odj2AdBmH8RUto47WJt2bBJwvvwFmWDaghbCY7n6uLeeJIwzugoS2QwMZfitBG
VZNA2qCqSMVudv0u1KeUC4z/UIiTjvHvX+GgyfMA6f0LYNPagxdFgRrlGPsNiQjC
iVlzR2dOw9VbAnWgHj0ElFAmVaeC07HnIAd02zs0WEcRnEg3g3rOsARo4QoEbUTi
yCk/465xaYg3drSe/w85RPK+sP0kA7HabYiSGROnEoN+wAIQWH577emjOjI/dGH6
O3rir1D4p/BuodX3qzHlp3kSZFVj4romIa7dCuwkEguiZWzRg5CByQ+jOa6nORTo
XF01CBtQ72qWV2llE83uy2L0cpsvQVDxaNCEqrOKsgsji064ygq9dMM4clDips6h
2RgRdFuSc5hm17cOSf2AR/Ru3SrPhclxtav+Dqc+86ka21gejKL/MB+8srkDpbnk
SIasyc8xy1/VU64xa704ucMJLxV43voNcYjF6Qmwg2LPEJB/gIA=
=KBjP
-----END PGP SIGNATURE-----

--e5p3cyapiqihjxyf--
