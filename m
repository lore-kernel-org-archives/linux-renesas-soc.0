Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38642 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbeKBEgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:36:16 -0400
Date: Thu, 1 Nov 2018 20:31:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v2 1/3] mmc: renesas_sdhi: handle 4tap hs400 mode quirk
 based on SoC revision
Message-ID: <20181101193152.GH2433@kunai>
References: <20181031231340.1958-1-niklas.soderlund@ragnatech.se>
 <20181031231340.1958-2-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hAW+M2+FUO+onfmf"
Content-Disposition: inline
In-Reply-To: <20181031231340.1958-2-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hAW+M2+FUO+onfmf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:13:38AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> Latest datasheet makes it clear that not all ES revisions of the H3 and
> M3-W have the 4-tap HS400 mode quirk, currently the quirk is set
> unconditionally for these two SoCs. Prepare to handle the quirk based on
> SoC revision instead of compatibility value by using soc_device_match()
> and set the TMIO_MMC_HAVE_4TAP_HS400 flag explicitly.
>=20
> The reason for adding a new quirks struct instead of just a flag is that
> looking ahead it seems more quirks needs to be handled in a SoC revision
> basis.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--hAW+M2+FUO+onfmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVKQACgkQFA3kzBSg
Kbb3eg/8DDFHUUvb3LBYu4qjEJ4aEtQpaFtXWUEHdgxKYfZhe3urM8FeEuDcwnz7
FqxzKF2jqMr382dUxhSc9nsyOHJ4jBXt9NkPGCt/adodP0xRshQV2Z4Q3p6JL8JI
waYG0p+jIA7iUtOiK0477pTUvpbG8d0deshTrrfxjwF813kob5qrmtiPG4eKF8xq
GtQW3DiSCps8eOLVBoPbmfPCGaz3tbDssUbwcFLS4xzbOp8A87uaIvDg6FXhSXmv
Og3KY659L6z+uwAbMpYx7U0iYRPIfY7u9kIX9XTX2UZ7vGW8wv0dGoDBfaSaK4+W
lpHbpj78q+CULOmmS6IyJNG/1GrqDZ3tJTASxwAxUysXz0agH+muW+6vLrAJP02x
LVuLfrQE50OXRVRarK/Qi8KbrcDs0CPB1MV3ZXWv4YDPXEqVys3Qkmn+/VAZyG4j
UNE1tMjihJRWMs3NQRp+yzNVqWDQ/Szz5KskE6BPT9MClYz0XxhJv0Srf5mKsvzF
gw5dMUqsn7/2Q/0qQft4FUI++tJtlnsx/xvicN6GZ03OJCxyuaaHLi+AfxGU8yKs
4olFcOfUh3G7P0xPLTaBBgYX8sHsoFoq24y5ZH6/g8Wuge9ovC8IwFjS7lvTwvRV
W+8/nUuX+vQM0iySieaGr+KDHnJeM/Uj+z64phTlTYDDem5XLnM=
=KNg8
-----END PGP SIGNATURE-----

--hAW+M2+FUO+onfmf--
