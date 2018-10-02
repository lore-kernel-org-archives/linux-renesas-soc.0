Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49750 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727188AbeJCFjr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 01:39:47 -0400
Date: Wed, 3 Oct 2018 00:54:02 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2] mmc: tmio: Add initial setting of interrupt mask
 register
Message-ID: <20181002225402.GA812@kunai>
References: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline
In-Reply-To: <20180926150026.668-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2018 at 05:00:26PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> The initial value of the interrupt mask register may be different from
> the H/W manual at the startup of the kernel by setting from the
> bootloader. Since the error interrupts may be unmasked, the driver sets
> initial value.
>=20
> The initial value is only known for R-Car Gen2 and Gen3 platforms so
> limit the initialization to those platforms.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
>=20
> ---
>=20
> * Changes since v1
> - Limit the initialization to Gen2+ platforms by checking the
>   TMIO_MMC_MIN_RCAR2 flag.
> - Rename the constant for the initialization value to reflect it's only
>   for R-Car Gen2+ platforms.

Those changes are good! I wonder, though, if we shouldn't move the code
out of TMIO core into the SDHI core? This seems very Renesas specific.
What do you think?


--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluz9wYACgkQFA3kzBSg
KbZ4shAAgX6pckecNJzBBHwVPZ3ocum/Y/JuQy/eHYgZMvWYh34GAnpAVogj63ze
wjxAAJDM+nx4Z/N7Vq0HFwbzJOojuVfwo8U5pyMZ8FhsmFnfEjJtspFItmCn7wYj
GiEHDPJ8ckY7C/oZ1NW9S1V2eodm0N4m6Zr1HeYiPno1WpgfFYXamVQ4J8iIDwnm
aoydtN9lOTr4HFM7iKc9XzHyMSu+IkQxvFT6/TtvnNH7eiBgwC/DHusO4AS68EwM
19TLmQlx+awRN0V862NTZ0M9rr3YobLzS6dRzK9DD705EcWLIjdzXJ8wuNUC3VNh
6X4kpw6aDucVQigzF1COjpvVksJuFxETcJat5xsWkpZZv0IPf1uoxkl+gK4N0dhH
mFaQf896+j2qf6NtFvfRYZvrNhv5gyFVwJDe1iNtv8TpBdpZy/rnEWZmOLdHlOc1
A03i6NAOdbm2WJ4xlALUoiMEvx4SZrZKZZYlWOIq/WOaQ+lku9j4q9znKjmdIioP
kG/JCanh3opaoIel4rRSr/QM4habi8Z9dd1wuFkOO7YI8c6iabEJZhh7Y8r6h2vL
WpoLG1CqlDjGoW4BMIOQOtL+IZu2bl9DjSKsPe92FtbITtKumkGbmHoSdxRD0Ut9
/aRp7H6bDGcaG3+QXpArvxDkoGUJsNwjrcMyB0GmLc5XGLOI+ko=
=neyu
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
