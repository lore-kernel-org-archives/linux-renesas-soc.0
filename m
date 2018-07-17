Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33824 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729243AbeGQJ36 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jul 2018 05:29:58 -0400
Date: Tue, 17 Jul 2018 10:58:23 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: recovery: make pin init look like STOP
Message-ID: <20180717085823.ghg657jfc4x2zol4@ninjato>
References: <20180712174919.14447-1-wsa+renesas@sang-engineering.com>
 <06ee47cb-16d0-99df-e18b-80e5a6e4eae9@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6ar5prsyq6lxba7i"
Content-Disposition: inline
In-Reply-To: <06ee47cb-16d0-99df-e18b-80e5a6e4eae9@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--6ar5prsyq6lxba7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> instead of changing this "1" to "scl"? Same-same, but it looks odd
> to use scl as argument to sda (at least without that comment about
> sda following scl that is present inside the loop below).
>=20
> At the same time, your version make the code inside the loop the
> same as this initializing code. Oh well, your call...

Yes, I wanted them to look alike. Yet, I agree to your comment about
moving the comment. Will update.


--6ar5prsyq6lxba7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltNr68ACgkQFA3kzBSg
KbYsJw/+IbrIYx5P1TXlGSHrTvrBU6n5zfZMGDYCdPMSvtHFQh90Tudmr0F4In0d
d1cJnROiEWRCQmWyFUqcNNi6EsUpLDw7hy3kYDlyCkOURegMN06Z+V+yAIIfCQ5j
1EQxRRUEegIQa/m2lVwgT/sJ1r/SqkXIyUiNhDD9Ey4b3GEqkPX1cjkbo13YPXXt
x1yx4f1LqH1kGntrb0Oyq0n3/Y/BfAVE45plht6GzAYDfW3i+1Cs3crkVvghnCct
1o0ZGcl1zixgZPpdUBKYmvMW2+0SSthKyMYHuWDmqD/2n4fRHbVxvFi3JwPiI1+t
1yFxrf+keZT83ZSPUlkKyUsSIpCcsFlyCAIH4wZ9V9QnnATzXpqNwxBuaaCAiRZl
cE5MRd36JHHgukYDH43M5ljqDMvdCJFEHtuR6yUVQnVpQaoUFMI2KTJPmF2xadNT
1qxoEJHtiBQKfTRNkpLHXLM3XMplyKGzwekTEn5MLKkIEJGk9kmCP8UakcGMZ+oL
ysvM9Poe1la47r1+bhho85GAe0prRvjRtAVb8Je8BgjAEzY9G4cvt/iiZ4THjweI
+clUBj6qT3FUhe1lDYQkiCRvOt+fXZm8Jl48Gf8BQBG+xTjZokWeYNuymc6Z6RjU
iXT2GJJmMFXPHZOT+LIMcM8L0f4caaiyXlAWeNgO8hwceqjwss8=
=clG7
-----END PGP SIGNATURE-----

--6ar5prsyq6lxba7i--
