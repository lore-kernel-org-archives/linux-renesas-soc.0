Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:60788 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726228AbeHTUZR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 16:25:17 -0400
Date: Mon, 20 Aug 2018 19:08:48 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: tmio_mmc_core: don't claim spurious interrupts
Message-ID: <20180820170848.r6apoqynen54y3dl@ninjato>
References: <f2295f99-2354-a2ad-5013-0501ecb0d3a1@cogentembedded.com>
 <20180820165528.nuf3rmckuu7d4zqs@ninjato>
 <ee36da1b-e2a6-41d6-2ec9-08a091621166@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r5jlitrknvufmuvr"
Content-Disposition: inline
In-Reply-To: <ee36da1b-e2a6-41d6-2ec9-08a091621166@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--r5jlitrknvufmuvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Should come after Yamada-san's patches, I'd think.
>=20
>    What are these?

A more complex series adding another SDHI user.

> > BTW Sergei, did you test with SDIO devices?
>=20
>    No. But I really think the current code is borked. If you don't have a=
n interrupt
> to handle, you should idicate that.

I think the patch is justified, I am not talking about that. I just
wondered if you tested it. So, you are not missing something in the SDIO
code path which you changed.


--r5jlitrknvufmuvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt69aAACgkQFA3kzBSg
KbYL3g/+NIQ16/tFpCNm+bSOH+WaX5MYCfhbTOkp30MzUKOuULYVLWYaJzno9Bm3
GpgQAZZdiGDsuVDIUEbWx2/LJZQwlixM3BVPgvqGXn+ZEXRSA5M4ApN+nPjTXDPo
q4a5hImMRh4Ce0HMlYege3pQU9Ncy1v63j8vQxp4pu36arqj0bzsJnIPF47vN/Kq
ySwHB3q8Ek9SDXSABEL7ja86P9rJ4RWbjd23kvKBaxjKRLxQqchpQ+3ejNpzTkoj
N/o/woWenCF5JbADbDNWFPjjjXUOswtovtb3g596w8PSyuT2lvZrQ1nmyVruJPyz
8/CzgsgWgkGW5Exy01HaneGOp46zxPU1dzc88oR/o/+ZMd13pjVcp3SNWzojnhSA
NlDq26QNMJ1fvb3xee1pKUulO+1xBY0VB/igJ2Isb1+Y4rSa+z94ePvVq/iLRCmS
SYbiaQamxxExxibcQQIJg2H3FXZn7ix8J39O/odeNHp3e7M3kLZhdLcNA5ejjctU
Kh+I9t0OkRESyGj+W+xfIyKJ3o70C3/eLUWA3NmGXGe8/kWRzo7Duj9N+Ta5OIkA
dHXL6SwrG0mCZVIvy39mP0KKi947w1P0FqKYICEyp6culk6QImpC71ZNHVjpY+IB
Nj97KmDMuHzQgJWsNlelsHrRFNRMS51aPA2JkGx7mft8Eh6A3NI=
=8KYZ
-----END PGP SIGNATURE-----

--r5jlitrknvufmuvr--
