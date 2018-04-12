Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:53388 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752428AbeDLLLb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 07:11:31 -0400
Date: Thu, 12 Apr 2018 13:11:27 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Nguyen Viet Dung <dung.nguyen.aj@renesas.com>
Subject: Re: [PATCH 1/5] mmc: renesas_sdhi_internal_dmac: limit DMA RX for
 old SoCs
Message-ID: <20180412111127.iyvxe2xvemlnpj4v@katana>
References: <20180410093831.1759-1-wsa+renesas@sang-engineering.com>
 <20180410093831.1759-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="knxvkkd7hd4qnmcw"
Content-Disposition: inline
In-Reply-To: <CAMuHMdXPOJMEMt9o3gTk5OzpQm4p=3M8tdmP0Vm3o9WrP9Xq1g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--knxvkkd7hd4qnmcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +       if (soc->data)
>=20
> This non-NULL check is not really needed.

And if we match using the Gen3 generic compatible with a non-whitelisted
SoC?


--knxvkkd7hd4qnmcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrPPtsACgkQFA3kzBSg
KbZM3g/9HVXxOSLgy3fHi3Rh3G0BFP6VsGNt+ob/8SDtbDMJg2qdvyk1J+3IFD54
9wt2JvKqdvY27+t7wZjYSNdUeMPOHroxr3TR6HgYP27r2aEdsTJlAZ8R5U+6Jqlq
YVzGUUu1d8+6bcmVIyXMfsxXMmmd9AZrYxWjoGxGCXdM+RXqDNDXet8fovlAwupr
N9hb92EZvq2VuhWmcWeytpXVT+9zJxof8b9jMewNqJri3KMBRMlrWGeIPBmyYY6/
wzAk7jAvBeLDUF5irlyaRzHhTgAYl469qMhCvgKU5qNqX1yltF4ep1J6rdA4FdhD
jOtD6i5UPFTCb7quba47uPnHLHKeND+va1Auzya9mAxYgtiEFjpJsNV4vWtvbf2g
Z6l7BsIuLqcbnUePePEMBuPg1mWbdBMC/Md2R3gn/BGG2G1SIxRYAnpEPGwc8oVR
KtTL0hgO8NATPYyuReh+Ly2AXy8pB5CEov+eIpI7N31jNqIQmP1+p3LqpyuGexI6
n/Ae9PWF3I3cN0TI3dFozfoCOpH/6GdoUAqaEp5mgZiHjV/igHfWAxKDfUyik3Ln
Kkww6S0clQMlCkbOqm9GVxnAtnjMyJ80x2JpHbIy5k3ikiaJQOjPWnPRE6Qagt34
VYFwhC3/wZcCiq9ZumypzGtItx1IgHbfQC102SFlWrDS6E32h7g=
=XVH3
-----END PGP SIGNATURE-----

--knxvkkd7hd4qnmcw--
