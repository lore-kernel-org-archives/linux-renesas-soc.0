Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEgh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:36:37 -0400
Date: Thu, 1 Nov 2018 20:32:14 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 3/3] mmc: renesas_sdhi: disable HS400 on H3 ES1.x and
 M3-W ES1.x
Message-ID: <20181101193214.GJ2433@kunai>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
 <20181031231340.1958-4-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mPTHnM80CEnHQ2WJ"
Content-Disposition: inline
In-Reply-To: <20181031231340.1958-4-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mPTHnM80CEnHQ2WJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:13:40AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> The Renesas BSP confirms that H3 ES1.x and M3-W ES1.x do not properly
> support HS400. Add a quirk to indicate this and disable HS400 in the MMC
> capabilities if the quirk is set.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--mPTHnM80CEnHQ2WJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVL4ACgkQFA3kzBSg
Kbb8cA//fFj2wpf52L/2n6Cd05DqP88eOe0cjM742JwGZZgMFSGeOmluJJczWOpM
gfQL+W24y8TZFV7VUrAIS6CQjEBH2rcrAXef8BGcKZMA02pL1rstzLg+8ABQZkEj
yBSEWU2voYCr4/nB0PjMXmGasSFW2OLJLL+lWUv5QV6OLOl10XThitFQwXtTP211
x66HRUu5dLIYmHQDjddgUM0HrESXlvBr+tyn7GNfhXwRwwvH4kwIjUzzanCHE8sZ
VB8V/DC/Rg5Zp2gi54xQhrDv4qk3DVOCEFM5ej64qtSCup5aHhm4Iap9gbM9gGSK
kUhNfATWezGeTZvbca51a4CkAZ3iTnQL44jlcGhdfg3EtODNDq4gVCJ8XasQeFMU
uDzNZMpcQZeW45a2dlRXDEMlwCgqM+ZoD1aS+Q52vkmXSGdjPTVgACHAb5c4gi40
U75HOwzy52TRlM7Dc+YW+dhCrHyx1zExhLtjzkUJm0r9+53o72Agvdv2XuW6yUD9
wuuIGgqxlU2kJ2MNw005OBTx6NijAUL1gW9RDVpxpV8N1TipT3JwA6WIqRGZ/yZe
EDIlGJ8dDzbDWn9Ysz85GTv/U97sCqrywEFoCs2TdubjCgQ4cWLwyW+aRdB8JEHk
VnNwf+jbD31vvhoawBtgyuoJv/Pu072nbGGiDDkY4qj0cUz7/zk=
=ZVMf
-----END PGP SIGNATURE-----

--mPTHnM80CEnHQ2WJ--
