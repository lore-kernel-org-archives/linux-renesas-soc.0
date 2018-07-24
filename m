Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:55858 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726457AbeGXLsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 07:48:46 -0400
Date: Tue, 24 Jul 2018 12:42:54 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/4] mmc: tmio: Fix tuning flow
Message-ID: <20180724104254.oaggeurkkvnumbch@ninjato>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ydpebhzlsuxqquxo"
Content-Disposition: inline
In-Reply-To: <20180717145216.16840-2-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ydpebhzlsuxqquxo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2018 at 04:52:13PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> If the return value of mmc_send_tuning() is error other than -EILSEQ,
> the tuning fails and process goes out of for_loop. The correct
> processing is to judge their TAP as not good (NG) and continue.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Re-tested this with Simon's HS400 patches.

Actually, this patch is needed to make HS400 work on my M3-N board.

Simon, did I get it correctly, it worked without this patch for you?


--ydpebhzlsuxqquxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltXAqoACgkQFA3kzBSg
KbZuxhAApzCOkxHCvm8F+yLZ/BUV8saEEnPNsWC8tQEky6UTwyULnOaOJdc6jR5m
LKZqVSV+gamKFVBl0wGw76TsGfZAAg1ieD7Raru1LR0iaZR5oznTkm/kfAlpKu+5
IadUbKPy/4Z6x1QH7JNu4rxKUFyGJNoFoWzhUhRsQF3+uubqR4WVIF/CWH88MSds
O7eGBjBuFRfZnkBbbVpXTU4t1UkjiPi/h+Qg6N2PB7buKpsr7Hq/sC0ERIU88nzO
rFXQSwiGGwF7FIl7kNWIzHzdNJAww80YvRttZCuUciZkDIBIUgZHl0fSN9C1zTLx
S8l2H3KkXDCTs6t5IYLwhemkJG7jFIf41xkr47qU50NveTmFHFq4EvwlalbLha8Q
+zIzoUvQCIbIesXoqB0Ju+0MFaoNUJEvxmaaQ+Ei2DjwOCmzWSjuamtJKYfXdPLU
GWCwFzGFCIEZm7JSe7bAZtSg4EAsQ/6aq0dgRUAfLpx6VJuTw+taSUpj+5f77MeG
0ALgfeztWZY3hfnT8gOLTN9KxaUfqkC/RGWcX9VRVidGZ55HSjQfMoI79Oda2kQi
cKxC+gozCt53ShCDRI/aav0ArsBm6ngxLshb+1gzdDGWc7HGmfk+XpQ1/fYbmhtn
v2trq5lDWjhRwjo+7md5wMvqKD6lUShrDlxGEqdcQr+fDPh9VP8=
=19AG
-----END PGP SIGNATURE-----

--ydpebhzlsuxqquxo--
