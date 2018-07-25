Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38562 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730292AbeGYVdY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jul 2018 17:33:24 -0400
Date: Wed, 25 Jul 2018 22:20:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not
 available
Message-ID: <20180725202005.lflrjvz4aubqskq7@tetsubishi>
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="25mzax2tvpwy2454"
Content-Disposition: inline
In-Reply-To: <20180712155152.lbpsbd6b5ai73bd6@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--25mzax2tvpwy2454
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> That all being said, I think this patch is still useful as is.

Linus, do you have time to comment on this?


--25mzax2tvpwy2454
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltY224ACgkQFA3kzBSg
Kbaf2hAAr7FptalvQK1QgEFnpCIcmXzqRCug5bdNmY3jWnsH30vkQjIIZBvoD/uT
5trjds1kafOoQSEgrBRzxaSjZb167NpJSO9uJqM3cwx8kyOUmXLX3ryJE3rmO9D7
S9VGy1C9S0xr5UlEf44vF7VH+9yeDGb5Q2IYovLxhDp5vcX/ydXl+4V6gMf+P6Cm
dzQgCBxnl6zHqZ/AaeW+ip0SFF541gsy1bBZaDvrTQanxOTHQSYKEYJWJJUMvVxw
eqUCwWfxDpSq50ljDDYNLn7JBh2uRlakoyfmZQnSct/Ot0NciuCKWTvhupaNv/5B
pd7MWrGi1ZIbIcvp/FJMCKdPKHKtSz4B8IsQN1DHdx8LOvper7LXy8g9FXOzYyXX
qD1W3Q/CD7Or3fBNOgoy/lLIsQKwOrLA2i8cQO7Nakbthd2naTH3IJMuEtPEnvW0
VAQ+EJQObCphHVJTDPMMjwOqSdhhOpvk9YlOylRY/FaNbgCfcPLUoi6ILfCJVqfd
U/iBzsrvECZUhE1JdKD/3YkTxpQhmElj8hbHw56FxWt8shQAFFnJUDJo/8JKJhlt
HTBc84NBOZ/zIJt785ppsmpzGCS5t3Op+vtocjkGO0+N3nJ0AmK3TxGxdPQTHeLu
UpCMiuvUoxE1h9eJ9GukZ7Hqa/ymzZNfju8A8QVUipI5Qs4OJJg=
=PrZp
-----END PGP SIGNATURE-----

--25mzax2tvpwy2454--
