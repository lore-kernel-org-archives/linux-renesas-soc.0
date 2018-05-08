Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59294 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755722AbeEHVTi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 May 2018 17:19:38 -0400
Date: Tue, 8 May 2018 23:19:35 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] i2c: busses: remove superfluous ignoring of children for
 RPM
Message-ID: <20180508211935.u6td3uvqeepbsqe7@ninjato>
References: <20180429184104.6680-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mrhqxazy5xgjeqir"
Content-Disposition: inline
In-Reply-To: <20180429184104.6680-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--mrhqxazy5xgjeqir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2018 at 08:41:04PM +0200, Wolfram Sang wrote:
> These days, the I2C core ensures that the embedded adapter device
> ignores the PM states of its children already. Because the adapter
> device is an opaque logical device, there is no need for drivers to
> repeat that again.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--mrhqxazy5xgjeqir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlryFGcACgkQFA3kzBSg
Kbbmzw//R3eQOJDHSyXdr5xZwdgtQy5nR2scHw8jq7s/DOdzZ8YitsFRLXWJlk01
3nOdEzpIrRVHrpZtLOV/j0BpGp47aupNR49SEYg4JWfL/soozloL57wkQ+5+cBLD
LxncWjqwM1ERjwpKlRcWwZ0q7FUjE2tk/SIN50Gb70E8b6tKrrLUwtFvVVoDynZr
6jVEW76IuAIX/Pxq0u50WqdeSQOmHkF0ZHOiDrG0CwZar+Z1ujA86dhEzDKxyWGk
3NRKBW8MSgpYdSGtsDfQx5E6wN/lLCvmTC3deU10sB84bx1UO2YnTjmrvdh14RXc
Cdz5QBmLgl9ca51bny6HZMFdklgHMpnjb4dn7SEvOw9k9kGGtqsnxqs7zWIUlht2
RThCL962zD9gFrwY+SOBuJsE01N9c772HWynzZDrMDE/yihd2bgjQaPPdKNDq//F
KBjTtTW8IiS4hfdlRDAI7pR91t7qba/R0ZShchtOZTYwPdc1Zhf0SCATTn5ht3DU
3qQXw6jdFcgxga0TP/3kJgScf16I+OTTelXDcsO9w46OS9lgBlEW2KhgdhcT7QU8
M3D0Am9y0+nfw3NysT2gi0+f6oZo+gV/hrekVQiBSbz+EEANnQKWscmIZ2dfVqZ1
pPdUleVHRwgdaz9imXyJzT7zurooHkXtmkqf4LQCsZBM7QGo8Zs=
=wCPa
-----END PGP SIGNATURE-----

--mrhqxazy5xgjeqir--
