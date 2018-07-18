Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730749AbeGRKXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jul 2018 06:23:35 -0400
Date: Wed, 18 Jul 2018 11:46:29 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 4/4] mmc: renesas_sdhi: skip SCC error check when
 retuning
Message-ID: <20180718094629.ttdsuzj6nxacvv3a@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-5-niklas.soderlund+renesas@ragnatech.se>
 <20180718085408.eydhelufuhgtyhxj@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rec3q7kowx7gkddc"
Content-Disposition: inline
In-Reply-To: <20180718085408.eydhelufuhgtyhxj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rec3q7kowx7gkddc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2018 at 10:54:08AM +0200, Simon Horman wrote:
> Hi Niklas,
>=20
> On Tue, Jul 17, 2018 at 04:52:16PM +0200, Niklas S=C3=B6derlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> >=20
> > Checking for SCC error during retuning is unnecessary.
> >=20
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > [Niklas: fix small style issue]
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Sorry, Niklas, I got confused with the messages, that's my fault. I want
to revoke my tags here which were meant for another patch in your
series. I actually wanted to write a comment about...

> >=20
> > ---
> >=20
> > * Changes since v2
> > - Added check for HS400 as it's now merged.
> > - Added tags from Wolfram.
> > ---
> >  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >=20
> > diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/re=
nesas_sdhi_core.c
> > index 777e32b0e410e850..a21b347424f67c52 100644
> > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > @@ -444,6 +444,14 @@ static bool renesas_sdhi_check_scc_error(struct tm=
io_mmc_host *host)
> >  {
> >  	struct renesas_sdhi *priv =3D host_to_priv(host);
> > =20
> > +	if (!(host->mmc->ios.timing =3D=3D MMC_TIMING_UHS_SDR104) &&
> > +	    !(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS200) &&
> > +	    !(host->mmc->ios.timing =3D=3D MMC_TIMING_MMC_HS400))
>=20
> According to the BSP this needs to differentiate between 4tap and 8tap
> variants of HS400 support.

=2E.. checking exactly this.


--rec3q7kowx7gkddc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltPDHUACgkQFA3kzBSg
KbZ5GA/+NA2tbNCd84TxvlmU58r2br5RIzVnnxfkgXFUKcq5+E/t6fSJuERSpQpN
zcsJ0S+++WLtn72zHXJVa1VGXBPQI0yRYJyf8J7VIcMmGqEe8iV7YhdzGsTZQFY7
2Y7iwyjn1+HMTUVSyO2T0JOZT5w4w6hr/+5J9ES3TuyaQR6Ia1DAKkLq5awtoIXn
Ah3KvzhkBI4u4F66cZdK8FIfgHc9Nt9DwuyrQKoKE1P/jkEAGPQ1Qrf1qihK3o3p
7yaoQOAK/ShBmMyq/UUL2bXnFjEOufEQ59tOPCDYizfHtqzZstmHbcmp/3+VdsQb
Fh52GX1VC5XwpbxYBufKc4NGRP2c0OjbpEMtIWHT2ZKmJfxum53q+22HaNAdhA+V
dV8aI9Kdw4S9XVrS75gqToGxXYrv+OX4lW0QQVMNLTFwgXV6vo7zk3DGNfSvG6jW
Jr7YgzvWWLU3waGomOemBmBAp84QwWdyO8+cQDHHmGDJkyIFR2+koeprc7XJztJs
ylDiJusItUZVlCYmLzONkZhqKgNky1LvyQMh1H3SetpMr1/aUVtpoo2jeYzdf36Q
SOFZ6H+7iBWFCI8ftF6HHFDERwXPMnnvwIJIgUmpKjq/buptzzUkgcnsrpkSTkDf
c/9pdaX6ZXvjzg/TuCSEas/ghq/f9Z1Im7V10zcl8WyVffwurYc=
=1/Dr
-----END PGP SIGNATURE-----

--rec3q7kowx7gkddc--
