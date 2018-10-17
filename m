Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:36766 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726961AbeJQURK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 16:17:10 -0400
Date: Wed, 17 Oct 2018 14:21:41 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: Delay between stop condition and start condition
Message-ID: <20181017122141.GC3813@kunai>
References: <TY1PR01MB1770A54E9823E9C6D0FC6986C0FD0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20181017103208.GA1589@kunai>
 <8db1b1a0-6669-0d4e-7511-6fb44e309a4c@axentia.se>
 <20181017121607.GB3813@kunai>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zCKi3GIZzVBPywwA"
Content-Disposition: inline
In-Reply-To: <20181017121607.GB3813@kunai>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zCKi3GIZzVBPywwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> be fixed in its driver. It probably could be a generic driver, or?

Wishful thinking. Setting the passthrough mode is probably not default,
so it is device specific.


--zCKi3GIZzVBPywwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvHKVUACgkQFA3kzBSg
Kbbiyg/9GDdxaIfcWf6aepa6F1qjvXN0wfCRUGEg97sd/L2gUdBNN/JE+5/raznU
05dZjpVkJHOl1mZBKs5xl8q0WAVkg1OEaDXKucV6BGKEGdIIuT12nziJ/860qSHv
nQ3v4pCTpZCDu6ZV64rbEytaNKxAE2pWMIwmAh+kishrLPjotzC1bjH5U1U451Uc
ZrdC0ojEHLkM1h2dv+IvPv8LEbwVlCiR5v+5j5e52Aq/MVh8duOpy7qiLYyQR20I
NGpdhkvCF7xN6llbCp9ZI7vQumk89E+bXWsWgDizbHMhkWJRlkC1Z/Z2mCBRmxGm
NcFjbAddF1onbNqiJ8m2kUHDbMmNt+xE06CEWQ6FTqtmHx2jfm7dXzFdVUFOgJE8
QtpLMy3aiCIEoAuriGZ526jm2gnkIW3OGoFJIteaEO1aLY62rQrRSyrWQHljuEUg
QKLFskEOwqV2OoxNTl7N46u5MrRo8Ab8+bwuq/LIlD0g+f3pnMXBrhqfCOD1Nyvu
S/Y35ndiZILXT6rJSaDIfwtk0gH5ymNy4kZt0IwToQrnGJkKgP48/ueLuBbebSMR
aDFz8vpPY1uBDtsZFbWnTef/gmIVwvAVmMfinyqZBRDMcLBHDTIscDoJg/m+ocg7
Al4CgFrOh2/vfPUDqMza454ERJyMJlH4uX7S1YKbFtCbSCDy5Q4=
=CcQS
-----END PGP SIGNATURE-----

--zCKi3GIZzVBPywwA--
