Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54360 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964986AbeFOBee (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 21:34:34 -0400
Date: Fri, 15 Jun 2018 10:34:22 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a7796 add missing SPDX
 identifier
Message-ID: <20180615013421.clsr2ftqjoo7txww@ninjato>
References: <20180614015607.7066-1-wsa+renesas@sang-engineering.com>
 <20180614015607.7066-3-wsa+renesas@sang-engineering.com>
 <20180614072932.oneux4ep25okr63w@verge.net.au>
 <20180614080919.3llg73cu4ydfjk3d@ninjato>
 <87h8m4suz3.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ugarjc3hly37wtdv"
Content-Disposition: inline
In-Reply-To: <87h8m4suz3.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ugarjc3hly37wtdv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Actually, I posted SPDX patch to ALSA ML, and one guy taught me
> that, Linus want to have C++ style comment for "all" source
> headers.

$ less Documentation/process/license-rules.rst

===
...

2. Style:

   The SPDX license identifier is added in form of a comment.  The comment
   style depends on the file type::

      C source: // SPDX-License-Identifier: <SPDX License Expression>
      C header: /* SPDX-License-Identifier: <SPDX License Expression> */
      ASM:      /* SPDX-License-Identifier: <SPDX License Expression> */
      scripts:  # SPDX-License-Identifier: <SPDX License Expression>
      .rst:     .. SPDX-License-Identifier: <SPDX License Expression>
      .dts{i}:  // SPDX-License-Identifier: <SPDX License Expression>

   If a specific tool cannot handle the standard comment style, then the
   appropriate comment mechanism which the tool accepts shall be used. This
   is the reason for having the "/\* \*/" style comment in C header
   files. There was build breakage observed with generated .lds files where
   'ld' failed to parse the C++ comment. This has been fixed by now, but
   there are still older assembler tools which cannot handle C++ style
   comments.

...
===

checkpatch also warns if you use C++ comment style in headers.


--ugarjc3hly37wtdv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsjF5kACgkQFA3kzBSg
KbbGmxAAonrAYEQeibV3jq/kgi4XSTpjjWH01vebKXwPKrgH2SaSf54evbZicwd5
Qx2lbtAGZqbI04UwsikowqNq0hh8gwHlfP+5zNOUt9+2OGv7OfiWsfTsCfoXGqS4
dJeyrrZ7jZ24Z99aBYLtR/wdGWB3oZCa5HSmy2LThUY+SQ/W6G38I3+DKurnXQCe
ZqUpqOWErkmenfRBFOcTQgpR2iwSL0BcqvQat/yy9juwlAhtxMkQhnYcHq5egxV9
BlnidWDd3q4lUgVeIxxCtLyZvetCb/s/DJUu4EOkTEPIGn7bfKFgJVXfAPT7zFCr
tZ2Wfkeckq0Mn8gwbEvarSl1cqosjuyJAdj3OrhB/oYwWhhPZxETJuFFPQu1rGql
2htffocVveRSZuo4vV5c1C8mEcuRphVW5Yq5Tp9QiOL/SL6ZsHraaiTji1CXNLyk
56UUKQzOscJeH3fYY7sU9+DWOAp4hVZ7cfbuLT4rFt5y36aHJhdiGgDDNf466hWg
lvZFMOEHxbAdY68gZ9IKx1WwOXSVfWGKDX/i8v/juXM2zeTTHrWj38+bWX9odFFW
WwOEjOsy5IlNY1aDqPgvyoFrSP2j3Dc6Bd7CCKx/8lMePVE+Ob/gOPvDWP9Otj11
w2Wl/GHXPyhtCuEJPhISG/5bg/rRJwagIP8CvTSoTRuoq1tLMJs=
=8GwJ
-----END PGP SIGNATURE-----

--ugarjc3hly37wtdv--
