Return-Path: <linux-i2c-owner@vger.kernel.org>
Date: Tue, 17 Jul 2018 10:44:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] i2c: recovery: refactor recovery function
Message-ID: <20180717084418.633ygemoyh4sapxz@ninjato>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yrcwlerfsj6muoq7"
Content-Disposition: inline
In-Reply-To: <20180710214217.1336-4-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--yrcwlerfsj6muoq7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2018 at 11:42:17PM +0200, Wolfram Sang wrote:
> After exiting the while loop, we checked if recovery was successful and
> sent a STOP to the clients. Meanwhile however, we send a STOP after
> every pulse, so it is not needed after the loop. If we move the check
> for a free bus to the end of the while loop, we can shorten and simplify
> the logic. It is still ensured that at least one STOP will be sent to
> the wire even if SDA was not stuck low.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--yrcwlerfsj6muoq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNrGIACgkQFA3kzBSg
KbbxFw//dplUWHTK7q6UepHqn2RCVRX6Xtx4DqGx/OyVLX2rvTEI8PO4rEVuRwR/
DpAfTAgVcJOUY/Rb21kOJ2hkk6Avx2c9M++rUhqVmzE/IW2apZXeG2ylbkwG5aAD
fQI7YTTlaPBejD173aV012eYK374SFp09bxWBp3djVHZIpQoH22eBpvEy5gCTGgY
RfE01JXrJb2z0QrporRThvydLxMVFkNTh8lmFcV2yN4g/3OoK+0ks/7TfqdQu4bK
WQOSrsfcP9cF3XtBWOvbpzO9euKl2TwHsFb6caLOvvbBTH/2Jxcj/c5NKvaJn5FS
AIL04agFp1uyya5nHxbK4BWkU5mH3jXBdfu3sH4G7bHFiFuSIRHfabkxC7Rj6aoI
tdwEu9EZvkUWOcVKcb3k3sJbNEGEJLMyEwNtxrleLnZHo+8O/ZEwdPiiQlVT7dMU
34E2YyXiGCEiw4SoMiaWG+YvKU1QfjhQgb0lHGM8uiI2uEVHzMXzrWJUOpDscwF3
le01YpkcXGR0ZHBMwWfowAtxo8Xm+V8QQNqeo5+IqEFrIW1ZB9p+fCKvbcOjcihv
K22AfhQ+5jogIY4jY/g2vLuBjOMSFXb/jutfbwKYa9aJS8s0Om4tI9arGYVWHv9r
bSTLxwqb7iXfn5PeWM4lIMTQ0bgf4y/2ZZI5v2S8SZj01B9zEhM=
=DeG3
-----END PGP SIGNATURE-----

--yrcwlerfsj6muoq7--
