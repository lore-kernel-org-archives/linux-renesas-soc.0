Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52820 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728252AbeH3N7d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:59:33 -0400
Date: Thu, 30 Aug 2018 11:58:11 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v4 3/3] mmc: tmio: Fix SCC error detection
Message-ID: <20180830095810.uawp2pcdecq2wt7u@ninjato>
References: <20180829233207.30646-1-niklas.soderlund+renesas@ragnatech.se>
 <20180829233207.30646-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7fqfelhh6kk5tmtd"
Content-Disposition: inline
In-Reply-To: <20180829233207.30646-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--7fqfelhh6kk5tmtd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 01:32:07AM +0200, Niklas S=C3=B6derlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
>=20
> SDR104, HS200 and HS400 need to check for SCC error. If SCC error is
> detected, retuning is necessary.
>=20
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> [Niklas: update commit message]
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--7fqfelhh6kk5tmtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluHv7IACgkQFA3kzBSg
KbZ7YxAAhVeEL+cJBX+yTwJH89ZNk2o2I2r8UGy/34087NlNaFnK9iimA2eiiCfZ
UzlbH9JzvQiNGrPoiEyLTPpHv7zEoi7vlrkU8Dlx8Ws/WxQczoLSh7ZmII7l70wc
lna87oZG1b9zHtH1HBLlSXWGsFiFVUDhozp95qyPNLe0LreJQcMH4wPPDlUkM72S
JZBDc03HWA9rei3bvLTG40MozdMr3GeH2Yl2JQWOFzcvMM6mzF+1BvLgl58HDLF3
zJa/10mNWVJMLKHadTkrKr7Q17K7aiofWR1QyDjG45IjRO9GpWlMcDDG6rVSIcpq
Y9WoVPd2M0qb6uJjwdnOURia4xGlxxLcBqVyZvnWZZsZxxPnIH9/t+70X2uFXnms
Ny0CmSMVXq2ZfKwr+a6vUZYdK8MGBgwvB7ZYT9ALCwFF2rxgPm90jMLrLcjrqLHr
Hv5rKq9i6T4ROtSlTb8hjsPn0g7+2wwzTpTjrxeMpKxguKypHkQbTYy2ObtifuvP
dmOc2JcLw09AaCYjxhMneP3rXUv4sEfr1yo0TptHw5O6TkaLim+Zvw6tj6X6Hf6L
kGkBziqo/II+hkysekKhS03Q7KFPx610BXD5zwcr7CVNB/9hn7dr3M/A10RZok6w
ZNJMlP4J/Qm70EsOZyokKyg+erPMGK4YaAyDoNqoDaJa2N+KfwM=
=O7Ek
-----END PGP SIGNATURE-----

--7fqfelhh6kk5tmtd--
