Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40406 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728789AbeJEXOp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 19:14:45 -0400
Date: Fri, 5 Oct 2018 18:15:20 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [RFC PATCH 2/4] i2c: core: remove level of indentation in
 i2c_transfer
Message-ID: <20181005161520.wos3xiws6a6buzqz@ninjato>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xafkmw32vqpj7us5"
Content-Disposition: inline
In-Reply-To: <20180920161423.13990-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xafkmw32vqpj7us5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 20, 2018 at 06:14:21PM +0200, Wolfram Sang wrote:
> Using the common kernel pattern to bail out at the beginning if some
> conditions are not met, we can save a level of indentation. No
> functional change.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I think we can have this clean up already.

Applied to for-next, thanks!


--xafkmw32vqpj7us5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlu3jhgACgkQFA3kzBSg
KbaJVQ/+KcUmPYHAYdhYi7zisp5SRbI+rnAmVdxxENIX54y0iWjf7aTUfaMGrSU7
BYYh0MnwSP4/Xjib7tmoG8av+KrN7Et/ioZy72gPX0uaKpgQQ+iSiSNDNoetPMyj
3UO4CqkY3hXrIZsInRQkOObdGr+J0tPKCssBWZyuSsFIUw5dZOahxXYSvMGynq83
eT/NQTsyL4zCg4B7ZeF7MkvMJaliGzBzcwegRwKh87wbrKazrCX/xcvfeMpOBo+k
3E/P0YI9DJqV5YXumZlPQTB6iEW90YUk6QWR432jQA5sLn187LjXsYV1rVJckRqO
lsPTFyc4uwiT66lOntVJDVfxxPn+7xN2bQFERZ7N8XNaSe5pIannauGSIxsap7+m
gTpioxzH9TRefIuJK8m1sk6om12kSouCd5Hehz9bkPbzGSP4t0CvzfhksEUdJZ5b
NVkzVPGnJR5MQxhOoSy+HVe2LgXs2f5auzJKaE1w1okgwaE0/E2PhI7H/QcZDpLM
z/oG2GFZBU8uegYkCDe4oN0xvFFGZ9y0mjd3z5hPoYS8LE+Atk2KXzg/LGORgLzh
VQMnJ5hcsMX7uxpOpZqjRZsj26PRxJLXLsW8OHR21LPG0sy47YG1W5mxgDaIki0K
n3iQioXl7XcaYqQBnCa+mlqVRrUPu45AErfY08jEFcd16/8gy1E=
=SWIr
-----END PGP SIGNATURE-----

--xafkmw32vqpj7us5--
