Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 19 Nov 2018 00:02:51 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77965: Add CAN controller
 nodes
Message-ID: <20181118230250.GA2553@kunai>
References: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <20181118173327.4704-1-marek.vasut+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 18, 2018 at 06:33:26PM +0100, Marek Vasut wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>=20
> This patch adds CAN{0,1} controller nodes for the R8A77965 SoC.
>=20
> Based on several similar patches of the R8A7795 device tree
> by Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
> and Geert Uytterhoeven <geert+renesas@glider.be>.
>=20
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org

Were you able to do some testing using EXIO connectors? Would be nice to
know what was tested.


--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvx75YACgkQFA3kzBSg
Kbb/yA//Yvj3p9t8oLC8/1PJmIlWvLE4aF0y2dbbZiKhUx8OlISS6ui8HRdWoiQn
VfcFqGAg0L2au/E3oOFm3YPxfs8sGXE6Mvbbe/I4UmZahAdZPc8n/lKNtPMsmWQi
eizgmnWwVcJhr1y1q2aTTE57P8mvGoxUKBpk0SPWDi/4jSAzI3F10fG5kbjar7Z1
ZmXtWXOwJwKDOl5O8Jq7ByOcCw6Wok+5Cdh1cDWBu83qOMM5gPfo3pV0ltBHyPEF
ZZcCc6+3vuTadmVGjin092i/NEyS/ebB4TrgsU7MgcJo4EUON6N3DjZDnWRx2OH7
orHGcGJBr4XArGA3c6ICQYS0ylX+GjjBSG3rUhbSB1IDi/D+OwJJ1apDkf77ZOxy
wcfXXEdT7sDqloo8wk4BZSm0WzJbmV7P3/nE/+ASzXwBSmH1C+bC+1C0ym2m4WdB
An0nivxK7GaiH9mLbkEdo+9BK2Cm+ZqtOmLGo8cBs8TV8ZZAaaEbNl2MblR2itpE
WNUqxYEdHe4bCembUO3AfxTwSfARxpYpxwxuze26dB8N1c+sv6MIg6MoQU/QUXFO
+lxiCobt/u5hHA9s6NlrSZS/swcqtsnNVQwSSTrYhWtKotvQsuRcgSNRHSJtq9jY
RwolWXP9AckdSqw1QBjAEhqtKXTqB79OJv+DvpgDxKYo9F3zUEQ=
=hMQ9
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--
