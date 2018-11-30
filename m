Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726473AbeK3Wug (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Nov 2018 17:50:36 -0500
Date: Fri, 30 Nov 2018 12:41:35 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: set state when registering SD
 clocks
Message-ID: <20181130114135.25iiwsxnbjpkqcj2@ninjato>
References: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xvlpyqnmutf6w6xd"
Content-Disposition: inline
In-Reply-To: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xvlpyqnmutf6w6xd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 29, 2018 at 01:15:38AM +0100, Niklas S=C3=B6derlund wrote:
> The driver tries to figure out which state a SD clock is in when the
> clock is register instead of setting a known state. This can be
> problematic for two reasons.
>=20
> 1. If the clock driver can't figure out the state of the clock
>    registration of the clock fails and setting of a known state by a
>    clock user is not possible.
>=20
> 2. The state of the clock depends on if and how the bootloader
>    configured it. The driver only checks that the rate is known not if
>    the clock is stopped or not for example.
>=20
> Fix this by setting a known state and make sure the clock is stopped.
>=20
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Tested on H3 ES1.0 and ES2.0, M3W ES1.0, and M3N with eMMC and UHS-SD
cards. Proper clock speeds were selected and performance matches.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--xvlpyqnmutf6w6xd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwBIe8ACgkQFA3kzBSg
KbZsDA/7BSFq/RejRGuYjdewlu6aM4aQUluR5r6iprJJ2zuuj64cGcuLdnhDtPcy
UiMDcpt5UxfdDRcaNflxb+VpyH62BcD1yTeRsZxstTPxIr9b6pgDqQdfeCo0N+k1
nHZ+nAEUFHxsgdvQDM6vua7V0O1n8IPpUhEC+Pk2t2QkmQSBwNVaCqk18w47Seho
8/sDjzVuhIO4eyRNisRmfFOv0gElmG7QNfas4s/H/+WB2jOKIZe+AF21OlwO2n4v
w3qTpxlBke09V3IEN5u5Xj93SFTOULGPTKjfvzlsbCaO+r4QdzZLGr4P2wErSgMW
Th0X0pgEYSqvOxKYHb64vZIiFKKfMNIHsLl/24fcDs3tfq+ybPKjEvQ3Ms7rzolw
d6YUSrJQD4A9SeLdUqvXMRdFrT/e/Bwkt7xr60UP5Gzcf6Aeg0X7NovBYqCG+ibl
dt+bobKpUWCYOfgwlhOEXZGIWsMKFis9C2jQL/Ekv9gxOmre/LIU1te7KCkH0Txs
yS1kaDo6rhMuuMYrkiIC/LA5zR5eXB6vIh0Bv/PoHX1G1MkYYc8aJyFMj/Fy5+jT
ngB+4Jq28Y8OicCxKMtiCGZ3zruaZoDNU+j2BhcAG9vJfIK3Fe6MEFJ04KnDH0rQ
lp5zK3eeB8WpYQEgvWYN6pVmmvHHfHzkH0tn6fAW4pS1SuWY5FY=
=DGMZ
-----END PGP SIGNATURE-----

--xvlpyqnmutf6w6xd--
