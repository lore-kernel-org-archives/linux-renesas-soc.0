Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46150 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934489AbeF2IKL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 04:10:11 -0400
Date: Fri, 29 Jun 2018 10:10:10 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
Message-ID: <20180629081009.ftfo2f6w4l2etump@ninjato>
References: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="542uselhyucmx3d5"
Content-Disposition: inline
In-Reply-To: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--542uselhyucmx3d5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2018 at 09:56:36PM +0900, Wolfram Sang wrote:
> It seems that during the conversion from gpio* to gpiod*, the initial
> state of SCL was wrongly switched to LOW. Fix it to be HIGH again.
>=20
> Fixes: 7bb75029ef34 ("i2c: gpio: Enforce open drain through gpiolib")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--542uselhyucmx3d5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAls16WEACgkQFA3kzBSg
Kbb7Tw/+KsfYfVoFvqJdHTdOB0sn0t6ekvxe3U/XAw/eP9WZ8k68iPiYpxIqHU3t
/Ce+JIVv/WcdDBoF7Alu6yavplkFwIRb5mGhncCppLnybDRPR3xN8AtOngqz7gux
g+TmmyznZeV88Of05I4N7+YciyiCAadN/SWdxnJBkQ568RGMy86nA5IhZwyyHIBg
tZpDCBQM0O1g4cm/Njo0viwnfj3vCN5Ox0LhLAu+TBk4EJS3WZ0pSsOQFQrC/VuG
v/jxkadVgZrQZOH07dhUOxn5xwEfnpHPGXojKiJQUHWY72iMllbl8PcR/9o0twrY
DsGOx5aEj2mREvks7KV1OzNb7/O9RZ1rmH6PI6UFobwnACxUiIzqJUgp85PDCTRY
poI6fUADGmTSIkAnD1As/sZIMOpmKM2zZZIR1eCHiMs9uNRCyM6QgWRD3ptIfHeL
h9pVROuF7P0PPcF7aXCxgeq7sBuLaop4mijAS+6xgGCXip69Me5HvBxMHu0pmquT
jTnBf+W9Hqdt6gQbOAJzcFM/q0QEdgUerXyqE+CejAI+gDU/CiwbIcKMP1fDamPj
o6ZIsQ9U1B+7N1mGrk/0sB9GmWIoPrU5eJohG/oC7Rsyrxt27WqA9vFLsrAlJRDy
sFYNLUxvk4DYDLDUIX/bBHQWUIzLn4loH/o7IPpJSNKSc1r3fys=
=5B9h
-----END PGP SIGNATURE-----

--542uselhyucmx3d5--
