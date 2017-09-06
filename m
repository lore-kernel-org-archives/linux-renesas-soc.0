Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:46287 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753890AbdIFQhb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Sep 2017 12:37:31 -0400
Date: Wed, 6 Sep 2017 18:37:28 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: alt: use correct logic for SD WP pins
Message-ID: <20170906163728.p7r5h6cx37evpbfb@ninjato>
References: <20170905172631.31083-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVrbiWJcodEfRhJG3w9Pdk-9hZMov5fLewhkf-mW14n2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vtlmuzkz5kwl5jwv"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVrbiWJcodEfRhJG3w9Pdk-9hZMov5fLewhkf-mW14n2g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--vtlmuzkz5kwl5jwv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Doesn't seem to fix this issue, though:
>=20
> [    8.792344] sh_mobile_sdhi ee100000.sd: timeout waiting for hardware i=
nterrupt (CMD19)

Of course, not :)) But it was still wrong.


--vtlmuzkz5kwl5jwv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmwJEQACgkQFA3kzBSg
KbbYpg/+MArGvJCvimqFsT28kubPpRRFGqfOrEvnjfeEh7SLtAuUoqs3dKRFUkMB
QsU+N5bm6JAN4GZ+Pf6Z5/bpmk3Yn6BgHU82hCpXTTT9f5ytMm5kTXfSBQ97CW7V
MTjsgwVerKR1kcYpn0I7FgIWOunC04pkZA86ckkmHYEPLC7njwPFOFrB3ZVSTnnl
JDLjIGsL+Kr2pimUr8QFk0lFABGBJ488ITEH8ym4rwHki1JQINAr6bE7nNUu2FiA
wKWQ287Yx9Un4SEsfVN7Q76h8qRU1f5rpmHvr27mQ3Sn7J9bsDKIUwTi7sgOGgKc
b+i0gr2GWNBSrtuokW2ElsGdsHlg5sciA3c5loFjy/mfTqzuwVUKimy7yXQTPERq
Z5KAXXsSdeBFMvkpAHHTlZoEPBOouSVmKocRHHPO0FCrhSPR7IKtT1kJ5gvDRkmJ
ZayKyUFMQY0yjbAF6Or+nST+5vLqQI2BzfSNm2OX9mzXHos/behmrVsH7HVmhYI6
NYPGNnj2I5vv5/rV1w4xxkTgC79bp4mZ73NOq6lz/6DW0uOOxYlBzYQh5+5b4RH9
P4Lia1FpOTIPlKmVcaRQ0m2mP32TVD5pFqJjBd085ZzlAwgDoh9gKK7L1+FQNkmw
kZ5C6qnTzPg+fClZfyAcnMBEkWm2u8uwd9ugdTaIz/G4Hw4R5BI=
=Alex
-----END PGP SIGNATURE-----

--vtlmuzkz5kwl5jwv--
