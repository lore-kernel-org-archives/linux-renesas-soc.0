Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752547AbeFGJTn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 05:19:43 -0400
Date: Thu, 7 Jun 2018 11:19:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH 4/4] mmc: renesas_sdhi: Fix SCC error detection
Message-ID: <20180607091939.c5jbc4rnvsfydqjt@ninjato>
References: <20180606204724.26055-1-niklas.soderlund+renesas@ragnatech.se>
 <20180606204724.26055-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jiihzppp2gknpr54"
Content-Disposition: inline
In-Reply-To: <20180606204724.26055-5-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jiihzppp2gknpr54
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 10:47:24PM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104 and HS200 need to check SCC error. If SCC error is detected,
> retuning is necessary.
>=20
> In addition SCC error checking during retuning is unnecessary.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: fix small style issue]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Same here, needs more explanation in the commit message IMO.

Thanks for working on this!


--jiihzppp2gknpr54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsY+KsACgkQFA3kzBSg
KbbbGA//VEaQ5WtXyebIBE0/VGhbidQART2S2iLF5hZur4q9Bkw/UBJMUKNtKSP6
ZMbW/6OVC9R31eTfOpy3StEGNR0jPKHR74B84LygiSdZQK26BFm4SCsZJLM74yme
Dvgiai8Ix6s9s3JtBVw8NPPJXpzLPogaTXwMFn80Pk8ml8+iXOhARdKuKBIOmwgB
/gM/1l/ZO7Uhua59qyrBHVKTJPDZGf6ygQHqiru7zFQWaZtPJW/8xlZsfqPVXya1
GbWhMNxBYyyoLUgG5jk+VgcEoRXFmsA35chYqRFo7qahM8eJIFulBxuQV7E4NhWz
8rZ44tAZsXg7c2cLoYFb9EcJd6zgqigUNH4g59dmAFKIQmF/W1fbIEa7T0Rp+R6Z
ToaDtCX2+dnrYacevUjOVYKarY/qWedqLUaNU7plhLLZ51aFd5fO/60OkeNPWUYg
4fqunWnheYPrt0rALeJepC0acQvT333NMQEUTgr0lkRS1MSz1P6mk63RyGaIwu2p
rqWNVX4TATE8vc18do4G4Kqa5wAcNxy7su7hJGz6KmWSJS33CoKL+Fpo39i3WjQ4
uRKbkC9JiBC+mfk3jux6a2oTlg94f6TCIL3AH91nB56f0cxAz4VUbk/gNWPXO9ju
vS3tAejeBEhmVuO75eWICV9cpppwLTgHyBVOKN19NSpfl4Ec864=
=zGGt
-----END PGP SIGNATURE-----

--jiihzppp2gknpr54--
