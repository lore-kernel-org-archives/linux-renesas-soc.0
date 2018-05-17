Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Thu, 17 May 2018 16:11:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 0/2] i2c: mux: demux-pinctrl: improve device relationships
Message-ID: <20180517141142.qlt4ekvvvsy74gvh@ninjato>
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zh4wr73l3dzxiv4x"
Content-Disposition: inline
In-Reply-To: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zh4wr73l3dzxiv4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2018 at 01:55:42PM +0200, Wolfram Sang wrote:
> While researching some PM behaviour within I2C, I found out that the i2c-=
demux
> driver does not play well with that due to broken relationship with other
> devices. Patch 1 ensures the right parent-child relationship. Patch 2 mak=
es the
> connection between the demux device and the demuxed bus similar to that w=
e have
> in the mux core.
>=20
> Tested on a Renesas Lager board (R-Car H2).

Peter, I'd think these demux patches (and the single one later) should
go via your tree. Let me know if you prefer that I pick them up.


--zh4wr73l3dzxiv4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlr9jZoACgkQFA3kzBSg
KbZkvg//bx3t7mYgKAxaDRBJTT0toxUpvWV7qsWskAKmUkHAlsroY4I2i9BVQx2x
BjXo9NnuPb6KnPFp+ye6QEQM3YUsGAY4kVTkbJyyzfHbAeZxXEDLep9vxnckqDik
kPAsPFJdIJuMfFPqNX2nB5fJ4qVfzupnitQhhv/MOAHG8MeFD3IS3Wk3lPYScHM4
C4D+qqQaNLdrVvFxKMMmbnlmn+mfgzGsveoWKIp9nCIbZ4AQZLQcX6EDQ9aFs8Rt
b/xCPb0XTR2jXHX1j/FHZbbbchxI/Q+IfuYqKUBWd4VvRTC8anm+Iev+dd/+pTz4
m8rcWkXFfp/y3XMucKg+piDwb7GzgjJ9OKFYF/BGEJ29B4bF7ne4LVCWFoz2XDTy
JH0Hpf/fLBctS9veBRhnS8Hb4nmyVRackRhwoCEvTzClQHTCDyKtKncQVZOWw2LE
Dq2CoxoISAp1sG898oE8LaKAMXnfDLWxYfjHpF3o6UU7GcDiuLjOXi77/WtxLOO1
PUXyBie32Dxghh0QkwPRkUog7A5E9/pcFJVy903VoPAKuKsYDQt8IWpmYCSId5yr
if7f1pjRxTvDHZNFC32+JvGCM7lONYmiAb2iLU0RgvSVkbf/a9UrjqL2TQublPvd
4AwXrukkax3BZyRTj327mWLB2RNA6gIXdCc7EDR9Mw4r1PvHMK4=
=WHzg
-----END PGP SIGNATURE-----

--zh4wr73l3dzxiv4x--
