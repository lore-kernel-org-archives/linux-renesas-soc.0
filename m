Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60748 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbeHTUSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:18:55 -0400
Date: Mon, 20 Aug 2018 19:02:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: mask DMAC interrupts
Message-ID: <20180820170228.xf5e3lpovwav5zqo@ninjato>
References: <711ef434-1208-4a9b-1c0d-519395251531@cogentembedded.com>
 <20180820163856.cqp62em4ccerf7x5@ninjato>
 <027a20b0-5047-2d89-76f7-55dec7a67dba@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="uwrbrfjzoryhny4e"
Content-Disposition: inline
In-Reply-To: <027a20b0-5047-2d89-76f7-55dec7a67dba@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uwrbrfjzoryhny4e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >>  /* DM_CM_INFO2 and DM_CM_INFO2_MASK */
> >>  #define INFO2_DTRANERR1		BIT(17)
> >>  #define INFO2_DTRANERR0		BIT(16)
> >> +#define INFO2_RESERVED_BITS	GENMASK_ULL(32, 0)
> >=20
> > Same as above. Maybe we even need one define only?
>=20
>    No, I think 2 separate regs deserve 2 separate masks.

Whatever. I am not into bike-shedding. It works, too.

> >> +	/*
> >> +	 * We don't use the DMA interrupts,  but they might have been enabled
> >> +	 * by a bootloader,  so mask them to avoid an interrupt storm...
> >> +	 */
> >=20
> > Two spaces after ',' looks odd to me. Also, no need for "..."
>=20
>    Both are my preferences. Yes, I probably should have worked in the
> typesetting industry... :-)=20

But where is the continuation of "..."?

> > I'd even think with a name like CLEAR_MASK, the comment could even go.
>=20
>    Disagree here. The register #defines don't provide enough info on what=
's
> going on...

Masking out all interrupts at the beginning is pretty standard behaviour
in my book. Well, at least, please shorten it to sth like "Disable
interrupts, we don't use them".


--uwrbrfjzoryhny4e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt69CQACgkQFA3kzBSg
KbbkRBAAjeecZo8bLqk84AUywnCpAmXcCCOJXWXLBO/3XfnM5xxeRYvhigQLThDs
p65fMjdiqYxBj7+qzyQLSDsgZdTYxwqGefgG0R+Q6/eS25WcbVthJp/E0sDjtrGH
IJftF3rvmfs6K0Nq+UnEN4czTk3DykZwp1nt+9CIq50iA7XPDXuvR90t2gIQdoQV
2w49nMJmxxlKGl2QjvfLZA1cvBJASPeSfNnuXL3yPMo0iUJ4gCkSxxt4fv8Hk16s
Zdt7iaCVRBshY1+i92k7EzbgNxmj+HwPLGQZ0Kx7FNdvl1BhuENXqFgKbu2e7Ltv
nBfpKe7QXyKKmeeUxCjrrLgtAA//iTv6LKusedfG/Xxdf0PQFl+++s1pKp2fyygc
VRKMVCqOPDHyCQM6vvnAuhJBalPM2wLzMA0lf2oc4MKFUiksp77vzbQY0EpqkBLY
+JOpr6Bmm68CHVzaImnzexgnttnP1quGJ5yOOC6TEamkLwO8pkAXrr5to7xKplU5
AaPkTM//pfu7OmmwoY954PlZA9YuI7Fh/fSP9WO1GMeIRW1VRIzwdINcKGig9/8i
gH+mRNUF+Lr1En+Lvhvw9kWBp0YxiZ/1hAmt+G57FIiTMwf7DB0PMu7GzlPvoOA2
cxFnysxAMa1UOyrvwvDmnaKnkSAsW7oBMmgZAVoFbhvSRxSsfcE=
=pecU
-----END PGP SIGNATURE-----

--uwrbrfjzoryhny4e--
