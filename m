Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:53490 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727687AbeHVXLT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 19:11:19 -0400
Date: Wed, 22 Aug 2018 21:45:05 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define
 RST_RESERVED_BITS
Message-ID: <20180822194505.xqji57ef4oy3ciit@katana>
References: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
 <20180822193844.tefn3ky2vlskfcwd@katana>
 <0309adb6-c261-f9cf-528b-208950db208f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="w2ofmy52ni62po6e"
Content-Disposition: inline
In-Reply-To: <0309adb6-c261-f9cf-528b-208950db208f@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--w2ofmy52ni62po6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 22, 2018 at 10:41:56PM +0300, Sergei Shtylyov wrote:
> On 08/22/2018 10:38 PM, Wolfram Sang wrote:
>=20
> >> The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
> >> 32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >=20
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >=20
> > Suggesting stable.
>=20
>    Stable looks at the Fixes: tags now. Should I add that?

Yes, that would be great IMHO.


--w2ofmy52ni62po6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlt9vUEACgkQFA3kzBSg
KbZEQg//ZP9YaBvItAENR3ZZeEgRSMLVC1DDuf33M3XE8kaIkAoqE/1xdA3vlZCT
ZzSGo8fO+SlH1g9L6rEgZ1nDsu7+AfJ3c5yOJ9ahADH0htLDYLrsXA3lcdh7B+at
lg3ybJiN9UDeALBrgUywtREgPaneM2wFzaam/QABnyTRMjJZwfrO8FrzeO68SeTj
CAC+XCCkEyX1lFuvgYDHFqf9U9Wu3jLesF9R2DDyGikneNjz0k8/ubep1qXJosLp
/PtuA8rNtfn4d80fzrko16JcoHnFRV2Xqc3jqjZKtGPh8rxaLw9HPVwRr36AHwBD
4M1VAqkcnFhKeopgqmjFLZBB2es4MXzJFOIqVDgiAPx2iLgQkSZR7pHQO5aezkSq
hBJZ7hNfcWGUxuNtr8j3ZwsjaSZiwWg2y4kd/8Yi8hyipKY8/71BPbHsOSSNN9uG
96t0jE0iNiUhEAqV0yLlCQ9UxrONvckDgy66R3YULHmUf6sV+lSxGv8Z4tCZCs+B
UymGAmH4y7A3Ae8Gt+d4VeNjp00cRRD1qbyMtbbAwEv6WI4It9XP1zROkFrQ9DAT
0mxKXYXKwstHd2vfoInC9LAK84bRMqwHIrYHybC+fbyGE4dESs8YJ+aosMNa6gRI
AYtAPQmgMZ5alOb6ekNa+NR+Jpo0ddxpygFS/9w1hBq2DTWtoVY=
=on+c
-----END PGP SIGNATURE-----

--w2ofmy52ni62po6e--
