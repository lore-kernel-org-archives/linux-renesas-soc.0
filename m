Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:50283 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751604AbcF2KjP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 06:39:15 -0400
Date: Wed, 29 Jun 2016 12:39:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 3/3] arm64: dts: r8a7795: salvator: enable UHS for SDHI 0
 & 3
Message-ID: <20160629103909.GA1793@katana>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
 <1465229307-1961-4-git-send-email-wsa@the-dreams.de>
 <e34fd0e6-603b-584b-0aa6-09aa46ada041@de.bosch.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <e34fd0e6-603b-584b-0aa6-09aa46ada041@de.bosch.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Could you kindly share the recent status of the MMC support for RCar3? Esp.
> the eMMC support on the Salvator-X? From time to time I get this question
> from several people ;)

Nothing changed since last time. Meaning that it could work in 4-bit
mode (haven't tested it, though, and am on the road right now), it
probably won't with 8-bit.


--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXc6VNAAoJEBQN5MwUoCm2dkEQAJdNdJXXTmNg+iIsPwhwIY8O
bIVgHC+B8I0NptZTHYK40nOJb/ttuUopcEilgXHJCWyyODAtFH4pYGn6dCHW7loK
IfmqzqKwSE5xrnYGA4tbyDZCYFL5spA6MG0Rnm+RO1HRsfh4EvqqIbFhN8fvrIhr
fbINtO3H7YpPsKcpp2LzQWNV5Mx+gDnFxmQgGj2x/shI+RvNJa44DXS7EVoJZybv
xTYDAkGp8kaNN/BPR8H8GQi0C4zCUrYFmObfgBYO7ZNvrBecVxPwpHm9cabEtksD
oPKQSb8k/ZhnAQx7ns3ssFFLwFcQHZAB4phwVS0IuevCMCiEskAht+LTWhBOrSqm
bj7Gjf6cb37FvGfVQeinNzJmqycwXV0Eq/IlZbUOq6GZTtiVduaOh3frwPsfMKCS
60+NTZ39kY1CQgZ+VPgdl7a1eTawfa/hmlodOHmu2xAdrP7+DVtev5OGl/sAy75m
dKL0bwADuvPvn9NbVEh0ORo+VNWgkfCjdBx0caJa9xx5USp66iXCCkN67LzaNbD/
s8wM4p9ylxnqaBPpy+Mg6oedft1hJuU9QBng7st109t2LY2JO8H/9iyDfL9rNWLo
X6fE6+SFvW3n0RFzKQISx0Y3aRiyhSBq5x1utlhX8OpGj8Fhw2PfUOBHYJ+ky/9G
PTjvV2/YJjIPLvn0LLRI
=f8/V
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
