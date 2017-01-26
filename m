Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47235 "EHLO pokefinder.org"
        rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S1753095AbdAZU2Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 15:28:25 -0500
Date: Thu, 26 Jan 2017 21:17:02 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170126201702.6kb62spuvx6jgll2@ninjato>
References: <CAMuHMdVQVX9T7kxo-akbJQdcTwV2hA4188T57KBMGVdCFYw3jA@mail.gmail.com>
 <20170126135453.GB2718@katana>
 <20170126140643.GA11104@verge.net.au>
 <20170126141656.GD2718@katana>
 <20170126152413.GA12534@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jswxju5xvk23gcgs"
Content-Disposition: inline
In-Reply-To: <20170126152413.GA12534@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--jswxju5xvk23gcgs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The problem I see is the following logged to the console
> (which makes the console semi-unusable).
>=20
> sh_mobile_sdhi ee140000.sd: timeout waiting for hardware interrupt (CMD13)

Just to make sure: with the HS200 enablement patches present?


--jswxju5xvk23gcgs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAliKWT4ACgkQFA3kzBSg
KbaclRAAg477bOZIfi4QImrjC10AdsWKuofyYmnvOiFIU6SEsnpR4QGtTr0if467
r0yVhQyrtDG3qgU9WILBMd0bOx7FPsyGAyTcAYlSn2ARIN0IIzMGYuPBKNwj1K7o
ZUlimfHseqG/9yx36rRbt6rZG+Lx7/IvV+CQc2ifLHZE97YFCAb8uq/MWBC2g610
JTkSTFKgKcCfrfGqRtWphVk0+L6MiSanTtos4nl3vmMgCvC7HVPYO44M4zFOM5XO
nBo+lW1zZpnE/wNckcpRa614z0ooPNMLEmIjUEy+DPwlGgXQGeQtuoNRHlNwQEhD
k1VZChq01zIrbMebtTXLupg1ykPADHTxQlrdPqWrHOPNLK0H+ovNmctDXrXunPTs
+fNwJ1OWNJ0wjXWfQLh/tFVkLV/g+kSkTkq4kktwXQn/5Gla67h0Z3ZbLs/26uPB
euHUZJV/bwZsR+qK/J04Q9NsmsPiBGp099wA+CUnq4v0Y5I2XO3ZZmJG47x9W7pG
pPoogrZS5ONO+r2euel42mIcea7PN6AP6NMXhZffDOrnfXnfigYbvYLfelS9la0Q
6UJDP6jZM9lO1kWAKPDb1G6BiNx8nvWZfp/MtsE2Xhl5JUuJHKz6+iXiHsXNQc1A
MbT4zjWO6excPWzr0PZZL0xCvM0lNoHOmfxMn81p9+cBTQRrte8=
=WKqz
-----END PGP SIGNATURE-----

--jswxju5xvk23gcgs--
