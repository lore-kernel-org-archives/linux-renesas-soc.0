Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33552 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbeHTWYC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 18:24:02 -0400
Date: Mon, 20 Aug 2018 21:07:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/7] mmc: tmio: refactor TMIO core a bit and add
 UniPhier SD/eMMC controller support
Message-ID: <20180820190709.qilhem7bjqnvgtt2@ninjato>
References: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ab4t57ivvbv4cfvz"
Content-Disposition: inline
In-Reply-To: <1534403799-10594-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ab4t57ivvbv4cfvz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


So, today I did test these patches successfully on a Gen3 board (M3-N)
and reviewed half of the patches. I will continue tomorrow with
reviewing and testing more boards.

In a nutshell, things look good so far.


--ab4t57ivvbv4cfvz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt7EVkACgkQFA3kzBSg
KbZ/xQ/+OE7fO2CGMJ4PGq3vAqAF2m5wpTSY1iD1NkbwTjgdZjy1MmWQxPMSNkxV
TRZt4mI1Ddc3i3amYW2dO3saS3yRqwyr5yMpis9Z25oQqd9ckP6rZLI3BQC5gfoh
EokKJPhVrcbjGypgzbXEEzZ6Bb/wfwfplryIVtmN9uEG8ixnZizgMsYhvhIuDvGw
CAuJwtELp0jloGh2UIGCt/ly1uy3m8uJqgPtGf5gs86D42oa5AQkc2XvINkaQjbL
ZqM6DRNBHhjiDvnW/uWKwhuSMuGJCIiOlfQbATK6hJoro0gqdqIVHldbCTXKcUsm
BfMKZjIUta6kyWxKCld9DE90zVuEAWDxqzzS+E1QtKHZ/+oHsKa8eBn9BNT6RlML
wKJ8M8Lrs9idgpL/bI9WJOImLF9kRBOmnvzLXpfzZ5VqAzdDFt82FRSZRjOmahH5
2s8M70uNhNmYu6XNtpuZRaBnU0R3LXl/9UNglcrw17088VH7ZEirDeXOBJkzwZRK
fH9AO2wQOflpc8N8N/pxNyzv3LBwqlF+tEle8gcY3E0RlvJDUUjA/4hRAQKlmxa0
/bGBXFSqpMBmqcxsiUktzTFiNrGWGPHwlYTvSLfI7AJIGYqncCERVifuCJd3WnnO
zGkl/if/cQSeaDkFrCzylH6oRJlPhbSnuelIaAl2rVPrKqVfdAE=
=8e2t
-----END PGP SIGNATURE-----

--ab4t57ivvbv4cfvz--
