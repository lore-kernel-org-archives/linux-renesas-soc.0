Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:59612 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727370AbeHaNvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 09:51:23 -0400
Date: Fri, 31 Aug 2018 11:44:39 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] mmc: renesas_sdhi_internal_dmac: set scatter/gather
 max segment size
Message-ID: <20180831094439.ldljak3bnmehh6vs@ninjato>
References: <20180830213843.14680-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWTPNxUQ+Go-CPe3KZqr9eoLTaegbvE2OdmwHhBi6n+hg@mail.gmail.com>
 <20180831075703.GG28374@bigcity.dyn.berto.se>
 <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rhwxbaancjexfv4x"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWa-c1QcYN_moyck4J1Dte3LyEHfRZ5Ai915UX82CxbPw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--rhwxbaancjexfv4x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> As a comment in the other thread said you should not set it multiple times,
> probably the best solution is to:
>   (a) check if dev->dma_parms is already set, and if not:
>       (b) allocate using plain kzalloc() (with a comment why!),
>       (c) not free the memory nor reset dev->dma_parms (with a comment why!).

Quite clumsy if done per driver, or?

If this is the intended behaviour, then there is something to improve
with the dma_params API, or? If something which is meant to have a
lifecycle same as the device but needs to get set during probe/remove
lifecycle, this calls for at least a helper function which hides all
these details?


--rhwxbaancjexfv4x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluJDgMACgkQFA3kzBSg
Kbaj5w//Y/NqIe0KcEY7tobNHJc6H6axM7Qj6/mKJLygX/Dv/ylSOds88DXv7hpu
Ckx+yofOcpnWag/6qXkyvk9Cm+iA6SFjEVkOmJW90bYxOJPUy7GihutIWvfwhkdD
x9w7iHqwMaQkadj3gYHdVNobc4/V49UKhOzLdEIh/ube7BypIEVq390BRsBJQGWc
phxA/HcdkTj7z0Ax2lLR3E8Hc/ekVwhMnjM3blP0uKl/Lt169CO53IMWEkmwKcIL
s58K6XJbkmaGa125WKyIFs3px/iLy6EFwu6ihW1HbR89eon0GOS/obLoTW/UZWCf
FVk0kJAUPO3Rvl0eS+Z5oQgskgPCia24W7pHjHd8FsSn57Om/UmDPIwLI4meZoNG
TXG4tTSKLl7j18dLlCmHfxnGBAvr1/3pdiFKFTJ2M+xW4yUZa2MTVK1jxYqfgseA
GNVBXoT1yYjYvrbnzyIRGvPpq4bja/9v838JO4lNAlM6Gwq8HSsaWO3tVyfb/r9S
dds9WdB1EjWN7R5PhycOGQQaIp+26xDb6S3p0c9PTMbMH+J6yeCHba8eqDceK5RP
B9i99bjEFnbWKVQkt07rEa07JkrhfbW7ylh0iTjFwVa0zwcGR33yEl8Fn7lDX2ju
U+DpGASdR2tLCWeXQY4AGImTk18FK3CXQZj/cFr/EDMmRnvsFOk=
=2Qx3
-----END PGP SIGNATURE-----

--rhwxbaancjexfv4x--
