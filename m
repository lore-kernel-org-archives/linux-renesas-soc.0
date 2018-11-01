Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38796 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726628AbeKBEm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:42:27 -0400
Date: Thu, 1 Nov 2018 20:38:03 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD clock
Message-ID: <20181101193802.GQ2433@kunai>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
 <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="K9fy5ol1Oes4Q/ix"
Content-Disposition: inline
In-Reply-To: <20181031232518.2490-3-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--K9fy5ol1Oes4Q/ix
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 12:25:18AM +0100, Niklas S=C3=B6derlund wrote:
> From: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
>=20
> On H3 (ES1.0,ES2.0) and M3-W (ES1.0,ES1.1) the clock setting for HS400
> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider vale for the SDn
> clock. On the effected boards the one currently selected results in HS00
> not working.
>=20
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--K9fy5ol1Oes4Q/ix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbVhoACgkQFA3kzBSg
KbYfQg//aH4OVsSLzTGyoyKYYUumglO/QIZcEmOhEAeHeHvyVzZ6lndFJx57EeLT
J9dleSphOFjfVfZK616cVLCLtCfQhx2PIHp3DMhq4ajJkH4fGl67RBV5PYZprXma
nN9lB+8MGkFFASbfU+Kc31aN3NphMagUCCsNJ8ptq1VYv2+Cfcd6SMb3ifoDMKSl
YFBiJKv028w/AgbE9EvaX9YA4t6OmbyJ+MHZB4xHQbb7h2W571pprYuxn3pZK8oF
i03Ghgs4yqwgCyWMOuml1HgZgbiGDjTTPLC09Y7k6S3xKwC41fQ3xBuoprJmTrbv
ot7eJzwqUPy2C18YaGgaw4oSVeSY6O9RA63hH0bB8kRxCRPGW1ILfbPIP306A7NL
Cs7qRK31j4KlVy/IhFAmCoZOQf7TqgOpjIL3eWdiQIkeimAyWwY+vWiyzSN6yEJh
ceVdRt3ILghFKSqk3dKwXIXFgRAPmTlMyf4hEMMyS6XZoQIw76+JVMERojUrwnqN
KQeGMG373SFnuNnjVtCX5NvyukK30AZFk/rBDiFFZUJuf5qrx7VTHJ7CIKEHknue
lanF0aHdo3nxxqx205sjbD/E0Fi2C+XeNqDKgAb6EWVYmBTLwRLzZbajWmk7ysYq
H/Dh2BgYaA3YTiWu9Ua94lAvYhi15p1wuJkYA1v5IyVo6uN6TaQ=
=gP0J
-----END PGP SIGNATURE-----

--K9fy5ol1Oes4Q/ix--
