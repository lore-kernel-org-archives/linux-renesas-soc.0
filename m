Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53924 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753241AbdLUMPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:15:41 -0500
Date: Thu, 21 Dec 2017 13:15:40 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add GPIO extender
Message-ID: <20171221121540.c7jnhyihiq4tcoav@ninjato>
References: <20171221115423.13591-1-wsa+renesas@sang-engineering.com>
 <e0db75cf-3ade-3cb5-9162-403cf737120a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bel6cgcf2tm4vr5f"
Content-Disposition: inline
In-Reply-To: <e0db75cf-3ade-3cb5-9162-403cf737120a@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--bel6cgcf2tm4vr5f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +	pca9654: gpio@20 {
> > +		compatible =3D "onsemi,pca9654";
>=20
>    The registered vendor prefix is "onnn", not "onsemi". The GPIO driver =
no
> longer recognizes "onsemi,pca9654", I've fixed it.

Now, that's a cool vendor prefix. I'll definately use that! Onnn...


--bel6cgcf2tm4vr5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlo7pesACgkQFA3kzBSg
Kbafsw//e9XeMYH/1wtk/W4yOfySizNrb5/u+8uRRJ88HOgUNZFlRgVZ+ez47FRI
BLw2i51eD0wc7NTdldR2Gvy2nc+NxXo55QZN8bAw1X4fTDZZuNA9nyZq07SoDCgN
96XfmwTXDLoWfOIGi+5pXk6Ck9uUR9/UreVGjSqLtnZkGbdPT/wleK1v9Ui+wMKK
Rf/UoMPxyZ3jL8XZTvM34ikwk7+DF37RtgIhT20P0wZ/oROa1kzT1/MIJVFbJYMN
fTa1L5lho4Zg1EPc7TU4MUYyZF4/P0UVppJRQRDx/iuWi3g1bI1F3LmpN+ltOlM4
WiSab9j9bua11T/azNxyCyhwr8D2MykBxXC3FOdFMu5FjjMgrhKHyrKH+5OKxmM3
CevoHFd5WTgv2HAzumac7JgcwMeONVLkbhwzNRrNrhAIQPgnI10dGIZggshESasU
Xy5NeLCBfJs6ILsbGxpwqb3R8EWxrYhUPsBTPFHlhp6azM9Q/lz7u3UD/bicfOTv
diF+AQg6TiIMwIxcELHgia/qaPjRWtaWRH0WFvB9MtdvH865WMrj+9EqK2apguex
nsyjxEtnNv1d2EGS1U/Lwj1z91AgGQ19uvztV7UuHWQDanmWzZhtOHUHPe7QUSb/
n/k+hSv8Aik12+12GimJB7VMjpgmpWtlaZHIMLmyu7Rku0w64pc=
=fWoR
-----END PGP SIGNATURE-----

--bel6cgcf2tm4vr5f--
