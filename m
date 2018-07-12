Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:58546 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726962AbeGLQl2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jul 2018 12:41:28 -0400
Date: Thu, 12 Jul 2018 18:31:09 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] gpiolib: use better errno if get_direction is not
 available
Message-ID: <20180712163109.siy7dcqktifm7rhd@ninjato>
References: <20180711163319.28004-1-wsa+renesas@sang-engineering.com>
 <20180712155152.lbpsbd6b5ai73bd6@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hjw5uvwinoj4plyh"
Content-Disposition: inline
In-Reply-To: <20180712155152.lbpsbd6b5ai73bd6@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--hjw5uvwinoj4plyh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> For the short term, I will remove the sanity check from the I2C core and
> hope the user properly set up the GPIO.

For the record, this patch is here:

http://patchwork.ozlabs.org/patch/943115/

Forgot to cc linux-gpio.


--hjw5uvwinoj4plyh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltHgkkACgkQFA3kzBSg
Kbbugw//ZhdHdTkLNdEMh1FpT/NG0ctQ3ZGpXw9bxxAtXKENIEGUM0pe5Z8YZmD6
i4nD8UvSfvJzYSr7CRiTi7MYjO93Xu5G2TOmG6vbQQ/wFQBVzgAHCaltPFNrMQ3M
xcGzaUEKrzsFbKT+BZ/L95Zo5oJ3wMQSmL9DVtZJp3C+Nm58jOap66FcrYjy9gWY
WY+grcdBBcX15Ea3J2yvRMT9CqIvui7z0wEcaE/aiXLXLhHMMiZZSml6zAN9ElHB
G0bK+6MQY3u6KTfoo/hHw5PBBfpeNELXW3g8yz95R0STKs9WmJXUA5Z7T9MD5E3v
RZEBaUuKL1lcHXYHWMYy7C9q6LTrqPMyRSoPg+vbndvjfMyEfxgjYK4cXU75v5DK
0Eoqzl0uwc5EYWU0ZHDwWu9jcGv05j+Hg4lKWVM4nSxHhgbid1IbqUSqKfNhJEbK
0jsUuXfw2wSQ5qdsdYxbC4FWwOf+Hinjm+Ii4Vz/9EMa/7RVcjvC1HSdtnlkx9ao
eGlX9kSN3NrHNF7i3UZsmeEvYy41ZiXZoc4paVwOEE+6biDAK8F0guIVCZbKmVr4
ZHH0SaMmY+bCLiILh3hhKIEESPPuOVcdMPE2xJHmiNacN3TNfd4870ll6vBaiKwI
yJbuXbAkOPYCEeVC8wPVOia71yIay8xjQA1Y251KXBLKjQBYrR0=
=02RG
-----END PGP SIGNATURE-----

--hjw5uvwinoj4plyh--
