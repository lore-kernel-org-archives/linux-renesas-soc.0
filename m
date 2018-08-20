Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59100 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbeHTQG0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 12:06:26 -0400
Date: Mon, 20 Aug 2018 14:50:53 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Subject: Re: [PATCH 2/2] i2c: rcar: implement STOP and REP_START according to
 docs
Message-ID: <20180820125053.tsgx2cuteewlcgm4@ninjato>
References: <20180808075928.31107-1-wsa+renesas@sang-engineering.com>
 <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aiis4tm7d3hxa4gs"
Content-Disposition: inline
In-Reply-To: <20180808075928.31107-3-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--aiis4tm7d3hxa4gs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 08, 2018 at 09:59:28AM +0200, Wolfram Sang wrote:
> When doing a REP_START after a read message, the driver used to trigger
> a STOP first which would then be overwritten by REP_START. This was the
> only stable method found when doing the last refactoring. However, this
> was not in accordance with the documentation.
>=20
> After research from our BSP team and myself, we now can implement a
> version which works and is according to the documentation. The new
> approach ensures the ICMCR register is only changed when really needed.
>=20
> Tested on a R-Car Gen2 (H2) and Gen3 with DMA (M3N).
>=20
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--aiis4tm7d3hxa4gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt6uS0ACgkQFA3kzBSg
KbbX/g/9FxrWEcjwL0G3OnIf7y+hOISEnO/UJ3Z1K+HrLLMRWTI1Mzdln9m9OEfc
CAxzu0YeinIF/JaHBC/QLXL9xNzNIqnBrI5q9u46c0PF45Irk9daaCurHo0PA7Hi
a0SNfeorj5tdiIWVBjpYfI1KemBNG5ud5KYsEV74vIGwXgyfG57N4j6OReHnbEN6
/m3l/EEZV5yaXNG0QzKXsuj7qd1weYHQBOoH9fULx9MwZ7ZXWYWe9EElLdZXWaK7
Til9yppStWNvlwGJZX2/S6WHEXgLlDShTosjswiruqfM/PfopvaPRkJ+aIxbqjlv
Uz+cUIfdtQytm9Th5W663JA7zVJkivu5F9I96Fb4HezN6j7JBESdIk4XsSguCILB
P7Tmz5m2s9z3nSPjUFMiC4uLFEdmsaiu568wV45hB9vZgfn1quI5AilvN1lcxCSs
nTLXvxJKoUkkP80Uhy0pJ4KjpU7WzukGVev93HBencb/+EAQIvNibW0K7Xa1dn+F
8XRykvrfsTWShaHuuzTjxt1VwI3lMpAUmXcD8tz/eygmZypA1xdvZuORcOV3il0u
CitEFQD7kJ/gfsV9hYcAfk8ZI4fslMdiH6F6qLmPVzVvV1ii1ji477GfESBXKv1+
mZuNaInN0hg7XZP4xCLUmYmgkXihb6ZKHj4N5+9ry4l0p6zg6H8=
=+o0K
-----END PGP SIGNATURE-----

--aiis4tm7d3hxa4gs--
