Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60602 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726077AbeHTUEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:04:42 -0400
Date: Mon, 20 Aug 2018 18:48:17 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] mmc: renesas_sdhi_internal_dmac: fix comment typo
Message-ID: <20180820164816.frilascvu5z5o2oa@ninjato>
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
 <c83a18f4-8901-b631-9ba9-ab102e216b3a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hd77stil24yyuiwz"
Content-Disposition: inline
In-Reply-To: <c83a18f4-8901-b631-9ba9-ab102e216b3a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hd77stil24yyuiwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2018 at 11:20:23PM +0300, Sergei Shtylyov wrote:
> Fix the typo in the comment to #define DTRAN_MODE_CH_NUM_CH1.
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

=2E..but I really think those two patches should be squashed. One patch
per typo is too fine grained IMO.


--hd77stil24yyuiwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt68NAACgkQFA3kzBSg
KbZf+g//cgz+zexmeULXXQpqSdVcQHITVnwU0nVbfVREc1R2SgbfUpBROzEQZK88
+39hRGq8JkFwM3bm1m1tdAm9Tg/JMZtvJkMIfYxaki3nRfaCCsnZtYJC/ROmKSRV
8FpNYPWzw+DSa4eKJd0DSuQqlqnsfaCF2uNJZS7ByPhVl7Do0/D7RtI2iULwAlDA
y1FeHPkzjP+uKwONm+EF0xpM2b254TXh2NdTSY3x5ZBkkZI0JYSN46FRDQp8AWgf
AoTTXspS7sPefsUGtZoEmZGD8sP3WerMaguORvMd/T4EUZg/JR1cRxRziEPqeEZ2
Lrte+FFCFJVfwRNqzpIOm//0U3shjaYk6Aw8d10x+wKP3Pht9MTG90UoWxe8QBgb
FzUg8/yZyWq+GuxDSKEkgp1XmtmPutYhLO8g4t3q91wUScxltLmyYhRm8aevIlWx
+lKY7r45x5v9hE0EtZwO40lcpp7/suFSsb/XYLZ+LW38kAkIBxu5NRa+WbsnxJXO
hXk94eLlU4Dcqw+I7VGINGtkZZT/WYbjOiAR/lO0LiQSQJjF4APCmIHE+XVHoV6F
R6UMgoHykSpwYAvdmB0tfn9lxqhAmGMYftdt2shhUIiVZVvUMpI8j/+y/5yWwqs8
5n4I7iZQEXYwuMb7JJBKOBjjNsHYIhz+f68wdcqpPWHjguhJ6v4=
=PZ2J
-----END PGP SIGNATURE-----

--hd77stil24yyuiwz--
