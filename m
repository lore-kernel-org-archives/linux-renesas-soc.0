Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56361 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750880AbdCNKtI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Mar 2017 06:49:08 -0400
Date: Tue, 14 Mar 2017 11:49:04 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] mmc: core: check also R1 response for stop commands
Message-ID: <20170314104904.4ig62cy2w6fkpqzm@ninjato>
References: <20170314101501.25463-1-wsa+renesas@sang-engineering.com>
 <PS1PR06MB16924720592DB11B43DD5AF0D8240@PS1PR06MB1692.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cmml6os2oa7mb3ka"
Content-Disposition: inline
In-Reply-To: <PS1PR06MB16924720592DB11B43DD5AF0D8240@PS1PR06MB1692.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--cmml6os2oa7mb3ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > So, since I got no complaints about the RFC, I'll declare it a PATCH no=
w :)
> > Shimoda-san, is it possible for you to test it with the SD tester you o=
nce had
> > access to? I could only test it by setting the ECC bit in the driver ma=
nually.
>=20
> Sure. I am able to bring the SD tester from other department tomorrow.
> So, I will check this patch tomorrow.

Good news, thank you very much!


--cmml6os2oa7mb3ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAljHyqAACgkQFA3kzBSg
KbZGvw/+Jyhd93LOZmJXZd6waWXtxwg6vruQhMICOydAIkbMkIArYn0UJo5Mxloe
Q5XXm3SxjNyoLDbMFnHXuChuqpTxaMRHK1HbN5YrlnUTdFW/ZpqNk0a2gWLlBZ8O
u1sAsvW8FuMM8lWOxAGAYFWrmeuNSuq2FI3Cj2+2TVqw+90nlvwBzUpbWa5dGi3z
Pmk/BYW9pmDo9dFt6j+3Own6Zg71JWiprYTn7Eb5mg6AMsETs+YytbbJip34Me9I
eYiYK/KH4M1EI6+95556kbdi0Bg8e7BKO/CCgr+obSKoemKZWp8lie1gTNcd+Uxg
x4qfjObpDuXLnYbcpXHm1LfQH7F1OO6YYb0Eq1Ww8DovcCVZFBcY8TfBSu5YDwxt
hHrADDWCuJpHNrwwRO8i7VuwFHoEHrRuvRNuzhnnQ4B7mDt28TNjeDECjHe+sL0B
BcYRNPtk56wESG71+WFn+FuBUdpw6uz9U205LNvqVcUPHsqPGFNp03Vk0K/ZxTA1
54fNpdJ9WyMvifWEnJaBjXpkHXaEMsH6ZKVsTS5Jz+qrR9cxHHnaGFa1FYiojR83
qw9y+YWx5OJK/yNwpcemqy8VxQ9pmvrIpWP+LpP4GYIgrXgFEK4mEMn/N1GPgmkm
s++XK/qMfiGFDL2HNLbbKXwNQRemPy2Ag2l78AHREqBrBz7TyZ4=
=nydd
-----END PGP SIGNATURE-----

--cmml6os2oa7mb3ka--
