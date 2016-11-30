Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 30 Nov 2016 09:45:03 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, kishon@ti.com,
        sre@kernel.org, Peter.Chen@nxp.com, wens@csie.org,
        yoshihiro.shimoda.uh@renesas.com, b-liu@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        chanwoo@kernel.org
Subject: Re: [PATCH 07/12] usb: sunxi: Uses the resource-managed extcon API
 when registering extcon notifier
Message-ID: <20161130084503.v5klzl6silp6323s@lukather>
References: <1480485460-2663-1-git-send-email-cw00.choi@samsung.com>
 <1480485460-2663-8-git-send-email-cw00.choi@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j6lqhgavrhxtdjiy"
Content-Disposition: inline
In-Reply-To: <1480485460-2663-8-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--j6lqhgavrhxtdjiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 30, 2016 at 02:57:35PM +0900, Chanwoo Choi wrote:
> This patch just uses the resource-managed extcon API when registering
> the extcon notifier.
>=20
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--j6lqhgavrhxtdjiy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPpGLAAoJEBx+YmzsjxAgzhwQALAQn0DfF8/InflvzuNveuQA
vwaRBz/VJQsZPAjD3a0JHzaaJFtTJIezntb4dnOO/U5yGwKXrgmeWdkxLiWh06j1
J5JswBANHB7z88Lil2zD4Jf4wwbwTu6MG2+F5zWuEUusiJD3c3s9pnFIQjvbVzO7
LJqA81NYymz46oYq5KD3lER/zcqPHNo99aYPCXb8veGTloAwJHBto1sfOCcfeqLg
ZT0GK9coPsLHRZrgJaJEWhxpFNugxJ4+WAq5suA/XpNBfBDBVA3gxxzV8Drvx4Qe
sOW8JAuUqXstmPaanh1ims/qeflgsijCRLxpZDg99uwS08EGJn3Le15kbiyhnqGE
klVCoh3gHKztP5WHz8Sd9NCwowRglglGbMyOQAjA6B+lA8XM07ZFnR6Wrngbcepo
J5l1tYuAoaBgBchJubh+paMo/rGK4FTbSflgNoK3YXt3CX4AW0Tg0hbC1cCag+Ru
cPHtglrAXzvy/hqdRBNxl9gEBLeCo2IAm1jc42v64dtkKZRPxV0to/9hpTZE1j7Q
4ofswXk4kADR/0WCdG0q9eEPsQoFpmYn7F8/ClMtRoZGiisw6ic5bnBd3QJg+kT2
9UAcDm0moXC/iqb0Sb4eIXS7p9KfxOHNmkXDzHuzk9xLk0QdYFciXPYUgmk+rHvD
80obQxOJe+19L5ozmEeM
=A8h7
-----END PGP SIGNATURE-----

--j6lqhgavrhxtdjiy--
