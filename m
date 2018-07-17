Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33740 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728279AbeGQJVA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:21:00 -0400
Date: Tue, 17 Jul 2018 10:49:27 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] i2c: recovery: rename variable for easier
 understanding
Message-ID: <20180717084927.rz5lonzsw5ousuvh@ninjato>
References: <20180710222722.7852-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eiafcuwtundpitog"
Content-Disposition: inline
In-Reply-To: <20180710222722.7852-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--eiafcuwtundpitog
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2018 at 12:27:22AM +0200, Wolfram Sang wrote:
> While refactoring the routine before, it occured to me that this will
> make the code much easier to understand.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixed a typo in the commit msg and applied to for-next, thanks!


--eiafcuwtundpitog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNrZcACgkQFA3kzBSg
KbbG2A//dqKwUl9dXcO15YkefQqioKc36rIPYY9fH5vhnuWnMFzeOdRnXqBSbZGB
sfrguulICLlqQOqZhy1UOOT0GIz4MAdIiwFFiN36D/2RDOwf74ablYmN1cH8McnK
4WTDUIrUwaAmUnD1647ml1eHyWgcfOpuyw5RkLmntPZnF9M84ia1W8jtqr4OiQ8I
qsZrnjWSpi3QQkLDrkgpLcTgzUyTr7Vx43kVoPPJSflPRuDJQaKwADSxevg/OUyC
tjNuiEJ+zo44uK/gdWwDQ6lJQvGjr+o+NAkIi8kmKVPIEMIw0g2A4Jv6DJr/BRnl
i+nuFnzCrwCT17K6vjrX+FxVanvk/kgH0SzUxF2lEBWOTMQ7TYy9JECqCM3pv9QT
W6p5WmevR9wsehIf/WrJ0e8FBU44B67QnLdRaEg8euTVRrQmVCovSQeok7RxLZNe
dUZ6g/KKNB/h87v972gugMFrUJBNuhdWoWYmxwN/F0XH/IaIKekY+eLKvTvfSyiY
h+jnEAcHyo/wK15ANH9Ex6W0JqovAYiCeecXMGUsOyhtYMELtTer1NF9dGNjq14A
XWInyLtniZGP2jupx/TpuL6m9TU9lrmUbK7jhheIrKbJIAeRNENakZ1w7t3IlRw8
O9+jIIVCO8hdJfVWvBvcNFGfVno7FodjsLlwrklK7wJOCAIiP14=
=jbll
-----END PGP SIGNATURE-----

--eiafcuwtundpitog--
