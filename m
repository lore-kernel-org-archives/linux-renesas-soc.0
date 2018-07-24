Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54710 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388390AbeGXIug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 04:50:36 -0400
Date: Tue, 24 Jul 2018 09:45:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
Message-ID: <20180724074524.v6vixziojbao2ez5@ninjato>
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdXCysjhXin0+cWijnJo2+G5kDCNJ+MgpWqCxV5UvwEfbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dfhwccqs3coffif6"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXCysjhXin0+cWijnJo2+G5kDCNJ+MgpWqCxV5UvwEfbA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dfhwccqs3coffif6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> However, the figures at the top of Sections 70 and 70.2 indicate SDHI is not
> available on R-Car E3 (and H3, M3-W, and M3-N)?!?

When you look at other chapters, "not available" is usually printed in
light gray. I am not sure what these different kinds of styles mean in
chapter 70, yet I know that SDHI on D3 is a little different (no HS400).
Perhaps it is an indication of that? I can't really tell because I don't
know much about SDHI von V3x.


--dfhwccqs3coffif6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltW2RQACgkQFA3kzBSg
KbboVhAArIC9dlfC0MFPu+kQxBNMYuT01V0De369U1+cQKi6Fc8tGXrm7CgZ+LVX
DK4Nhw6NmuZ65K/VDIHz6w6XXDGkogUln1ycYpaB4xKL7p8YdMFpVqGc6YKWhEYf
DaQYupbUXDD7sI4HmtVhiqF4gdIIoeEEZOuB7UJSPzrSMlcjJmRNixBIzgGKk3Rw
MRYYrCnI+QAemLC9WopMONDRUPdePcLMYgyxScA5TvGotxP4X+LG9y4TGF/+IuwZ
1HvKC2J0NQ9CVXujZYuidC3wiuUq6YXq84DPo2lJyaJ8evXVcri8zHnlhvuDcOXt
5hi8JqvVbb2hu59Wc7eAO9MZskywBIxvSYr9TlrxWG+FuyH7oRl1LJvJsxTWCSQM
A7DVr9CCSb9fKrfo469Kf+/8Pore86pbbvAX0IcSC9o2AzM63uroFI0+u5XkVF6p
ThgftMOtU0WjMV9HvPX/9Y+zGVo7NP3BZW52T/n/xBBJUYwau6vSbP6/0Tjqg2mu
73EFmLkcl91GQDnSGkq+3UPNHVWhR9kDPwGv2O8oIdEfXFepODhzc8+jGX/0Ku1f
/noim4k46dXPYLmT1bfXSIRuD9h0/MDTM8O3XNtBDa6MSUHi+t8XIQiSVB80lh53
gejTLHbgyG/xH/cpGN4GhEQOKSI4dtfM2ORPc/aYejp3gQ4Lxlg=
=qCoh
-----END PGP SIGNATURE-----

--dfhwccqs3coffif6--
