Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57606 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbeK3WqP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:46:15 -0500
Date: Fri, 30 Nov 2018 12:37:14 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] mmc: renesas_sdhi: extend quirk selection to
 handle ES revisions
Message-ID: <20181130113714.57t6fuxya6wuz5oh@ninjato>
References: <20181128161829.27266-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k3etslkga2x7e5jo"
Content-Disposition: inline
In-Reply-To: <20181128161829.27266-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--k3etslkga2x7e5jo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 05:18:26PM +0100, Niklas S=C3=B6derlund wrote:
> Hi,
>=20
> Recent datasheet updates have made it clear that some quirks are not SoC
> specific but SoC + ES version specific. Currently the quirks are
> selected using compatibility values but whit this new information that
> is not enough.
>=20
> Patch 1/3 adds support to select quirks based on SoC + ES revision using
> soc_device_match() and converts the only existing quirk. Patch 2/3
> Removes the old method to select quirk based on compatibility string.
> While Patch 3/3 adds a new quirk from the BSP which blacklists some
> known problematic ES versions for HS400. HS400 is not yet enabled
> upstream so blacklisting these ES versions is not a regression of
> functionality.
>=20
> Based on mmc/next and tested on H3 and M3-N.

For the record: Tested with H3 ES2.0 and M3N where HS400 was sucesfully
detected. Tested with H3 ES1.0 and M3-W ES1.0 where HS400 was rightfully
discarded and HS200 was used.


--k3etslkga2x7e5jo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwBIOYACgkQFA3kzBSg
KbbSDRAAnGeSUAbbfvpMLR0ytii6ZwfeEskuCgBoua55L9fapAPJIbLWSwlHhyKX
IKeB3bZPYsvHliF75RCUOmR/WLk3dCk9SNmbUf2hMTZfu7fHOCHEbkwedVN10Rs1
JEXXuu2ONIuanH8NRN2sEOi57D4xGzjXiq2lc6LXY8kzof7HQpCt6JGw79tc7kjl
mXnpj3uOjVLD+yPaoAyIxoiSkhAQENede6pMlfmuDoqmaVrsDs/3OlfU4TBDg3VA
HBYZsZ+otCSnYiO7DH8Y8hN2shafOEmYgU6NJQ2jbRPWJWJQ8JRBCCsp79hG9aW8
I16oeTRVpsd34n8C9VpkGrbXOYh/GTY5wrFqs42bDcTz97SR2loDfpSQ7YaDPnDN
ZiBamGcrBE4VEbcP6Kk1Pti4v5dgAoPhZbJerGWH8vlaEpl63PNw6DOW4QNMLSq0
FuexAfnqkqHUlzUbaEOuKzixMtkOCZv5BHBAxkfQlXKjH5C73Zbj4jp8ip9ThYa6
LSRGiqv60ihGe5L9bZ/it8xLBRhP4Aae6ysMOc1Ne9BIhs1ITxgcYeu5iZVTF88L
yxst4zDs0zVbM0m72Fawjz90dWOcav+/EglI00f9vDEiHTAP512w1xHl2menlOyp
t0RXAVq5cTU7yN8+JlfT6Kriclbh3/gYZq1deZmH07PYhBUzyd0=
=a+zT
-----END PGP SIGNATURE-----

--k3etslkga2x7e5jo--
