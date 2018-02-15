Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:51462 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755297AbeBOKD6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:03:58 -0500
Date: Thu, 15 Feb 2018 11:03:55 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH V2] ARM: shmobile: stout: enable R-Car Gen2 regulator
 quirk
Message-ID: <20180215100354.57mctt6775ukmpmn@katana>
References: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dlwrq4ebpl7w2eer"
Content-Disposition: inline
In-Reply-To: <20180215100208.24646-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--dlwrq4ebpl7w2eer
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2018 at 11:02:08AM +0100, Marek Vasut wrote:
> Regulator setup is suboptimal on H2 Stout too. The Stout newly has
> two DA9210 regulators, so the quirk is extended to handle another
> DA9210 at i2c address 0x70.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--dlwrq4ebpl7w2eer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlqFWwYACgkQFA3kzBSg
KbY6hg/9FZF0LGWG8rppy/pHbhZtnwvIRANPYgXrRhRSmbQzGVRRbta4n0p8O0h4
F9vEbS9y2SWbztnihjImrSUScWVOz6jVFtg3ZGGt1Pi3Dh2HvnCUGGFZI+a/FukT
nVOv5lwoJO/B6HwcvBqf0IgVAt6YHLdSEuVsl7yyrl2nxkXCioJKNfk4hXgE5zjQ
CRya9jOCr2dzgfsxu3RmtfV/bjbrZpehUaKBA/fWny1egMvbuQKTN1/Kjd4wd+oa
NmXsXh/ZpWhAV8fx1MmzMk/u1R3MKtZD7kQ9iWWwpEHuRDoqos194mUTOkYXfB3V
qIFAvbnIouMbaztzCQvnAOF2oNrQ6p1TX65TE7tu+RTmX1ndV5jcFhWljxFD+T8G
WIzh8kY+UNX250PjnE/E7Sf/0INoTRZbSGA9XfV+h4GKgVgMvDR+DV1KV4pWY4AW
o2HVJwWLqEORadVjQB5ORCVV62qS7RNId1oFlhv03fDTeEiZQAi28pWejLj/Kk9z
jmfaNNcp1Iha6nywF2gZjcl8UVeEyi4wdATBKFJidH4SSCaW38OYx32CWVrTlx9t
RVDxEr5Ci3Xy6zEY5WDqHysdpEh00f6UcnIpYajo57+sk6SL3HpT0xURNA1bL1PF
461pKzqT9IZjpyDKNjtWIf9nAr8N2XQsFNWYO2Lwpn004GoE6bM=
=8txH
-----END PGP SIGNATURE-----

--dlwrq4ebpl7w2eer--
