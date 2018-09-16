Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46988 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbeIQB0k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Sep 2018 21:26:40 -0400
Date: Sun, 16 Sep 2018 11:43:27 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] power: reset: convert to SPDX identifiers
Message-ID: <20180916094327.cu7dyt5mpxthae7p@earth.universe>
References: <87sh2moy9j.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nka7hdrlljgaahv6"
Content-Disposition: inline
In-Reply-To: <87sh2moy9j.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--nka7hdrlljgaahv6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hi,

On Fri, Sep 07, 2018 at 02:15:08AM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> This patch updates license to use SPDX-License-Identifier
> instead of verbose license text.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/reset/rmobile-reset.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/power/reset/rmobile-reset.c b/drivers/power/reset/rm=
obile-reset.c
> index e6569df..bd3b396 100644
> --- a/drivers/power/reset/rmobile-reset.c
> +++ b/drivers/power/reset/rmobile-reset.c
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Renesas R-Mobile Reset Driver
>   *
>   * Copyright (C) 2014 Glider bvba
> - *
> - * This file is subject to the terms and conditions of the GNU General P=
ublic
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
>   */
> =20
>  #include <linux/io.h>
> --=20
> 2.7.4
>=20

--nka7hdrlljgaahv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlueJb8ACgkQ2O7X88g7
+priYw/9EUyHeHKeNa9xr2gO9SqLjZbmFqP/GRVAXeK5+tenCIiw0uDWeDuidGU8
gr3WntlcnieqJs1SV/AnHqEmo+QnC/rLwIBulX0ysL51kh0bKXVJLwF4YVjiykyJ
mTDXXVbHm6oT9SX38f+qwT/46dql3mO48QSie4vTrkn1CIhZ2Oe4IKN841IeIA6/
RGCAEXnbJh8rgS9XF8MFfDGUo4/FLbHPhvXevuVCxihOvYx5OMVZUhv2qZDLU1oG
EQIGXSsu7eEr0pY8JoFprQxxoGHPCp587GEB70Om3dz/Rr67pVmcIJFSlL0/nDrz
exnOkJLXh05dmebY9ZbRCuRhZxf6y5ozBhww8eCU4yqPKXhoVEROHk6A6Bjn3kCt
mdyuD2RC19VoPxealc3Msip0JB9flbCnMUjJMeeampgARNB8Qd4pHLuF/266X2jj
MY8XSm2oJMN/oG7r5VOPvlxdQupLWtQb4L7YHLq8Z0+nhmYFJzne8loavLV3shNn
dQeBDoOzO3aXLRfebX3EECjKQEdtdeQcOL4cqLM128LxUFIzsQ5mVhOwng5/gaKF
zURXT7O1fnZ7E4GTwzcUz5tNf+xYnzD+ydt3L1ENvmUWmxwR9kCBnR51W4+FrCr8
VyE+rHPnsRXgyBSWX9Um/aMsAK2NcpU9WQjntJfgeL026xU/zow=
=lYGo
-----END PGP SIGNATURE-----

--nka7hdrlljgaahv6--
