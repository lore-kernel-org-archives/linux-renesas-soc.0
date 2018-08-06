Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46170 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732391AbeHFW2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 18:28:11 -0400
Date: Mon, 6 Aug 2018 22:17:27 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v2 2/2] mmc: tmio: Fix SCC error detection
Message-ID: <20180806201726.x57vjqenztn4thlo@ninjato>
References: <20180806142847.25971-1-niklas.soderlund+renesas@ragnatech.se>
 <20180806142847.25971-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fkvcbwifbhwffeyh"
Content-Disposition: inline
In-Reply-To: <20180806142847.25971-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--fkvcbwifbhwffeyh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 06, 2018 at 04:28:47PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> retuning is necessary.

Basically good. As of patch 1, we need to clarify HS400 handling. Maybe
this commit message needs a tiny update then :)

> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
>  drivers/mmc/host/tmio_mmc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 261b4d62d2b1061f..268c4a3b728c775f 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -919,8 +919,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_h=
ost *host)
>  	if (mrq->cmd->error || (mrq->data && mrq->data->error))
>  		tmio_mmc_abort_dma(host);
> =20
> -	if (host->check_scc_error)
> -		host->check_scc_error(host);
> +	if (host->check_scc_error && host->check_scc_error(host))
> +		mrq->cmd->error =3D -EILSEQ;
> =20
>  	/* If SET_BLOCK_COUNT, continue with main command */
>  	if (host->mrq && !mrq->cmd->error) {
> --=20
> 2.18.0
>=20

--fkvcbwifbhwffeyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltorNYACgkQFA3kzBSg
KbaoWA/9EjIkYs7RkLf05GVpjK8DoIZByM4hUfpOQKD4y1lZEes3aKKhDWZ/+YOb
qnDEmNEmbsb//rQgZ/b4IJrNR3fsUv5NfqSUaJctLQ8r22hDV7untkrTUDfHyykF
1D4rVzD3ZzY3T/EDXlR2rcxw91yyyp3LB9A+M2ZARvW7FVmVlTxwyPz5qhIYAxIc
mfp45vZTx1KSWhg/64uMTSXgDWtHCth5V3nj9viFds+7mjNeBwZ9MjQG2UlGRD2x
6gMuYGnDMqE+Dj1AZglkfj7kdK2vOSWMuanjOJvNRSHB0B2CzqddpQ7mbVjlAGpG
sr0fF6zsfnOol0cvG14gEyed6+vOeye1hWIsE/vmrUUZ2mM2GC+VKfawZX6Loige
krhlL0fi3z+9aj4M1ASp5TWqqkm+jZoPziqYo/o+4+bpgF7j99XFyBI2iED+DMaR
RPnt3SE1i034SDIhhfUmubxcLW8kUWwUz5xbrvMc3qne+X87Z1xT52Uvdx1G8Fam
ZcfwmQ7nqGfVtvSCMpkkKITd73pTcYVwNoftBojkoc0o4z4fVh+VhpJStQlrJ59I
Vwa79nwWIS32qyC0WIgiFK69BMDvt2uDfL0nu/Tk8wDqYmmzaxHxjyDqxtzBFQRc
MkUbcobt3D1OOe8GVkDcntEudwMpvP5lbTZNPsAVfDCECkm0v4Q=
=iYG1
-----END PGP SIGNATURE-----

--fkvcbwifbhwffeyh--
