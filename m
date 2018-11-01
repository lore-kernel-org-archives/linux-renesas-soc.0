Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:38848 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726670AbeKBEr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 00:47:59 -0400
Date: Thu, 1 Nov 2018 20:43:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 0/2] renesas: rcar-gen3: add HS400 quirk for SD clock
Message-ID: <20181101194332.GR2433@kunai>
References: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pqmPt9oPL4cuP/b5"
Content-Disposition: inline
In-Reply-To: <20181031232518.2490-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--pqmPt9oPL4cuP/b5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> This is the result of the SDHI hackathon for a possible solution to the=
=20
> clock issue on early ES versions. It is based on the Gen2 solution where=
=20
> a row of the possible clock settings are ignored on the effected SoC+ES=
=20
> versions. The first row is not effected when reading settings left by=20
> the bootloader, only when the setting the clock.

We really thought about exposing both clocks, SDn and SDHn. I got
convinced to use this less intrusive approach to get HS400 reliably to
work as a first step. "First make it work, then make it beautiful" so to
say...


--pqmPt9oPL4cuP/b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvbV2QACgkQFA3kzBSg
Kbb8zg/9HqYss8KD3OaWm4S5rV1lBoT7BLwhRmZhQgJQJYldZYoh2Gmj/n3NtFeF
T2LEFTkjq0Hd+stahQ2FNXNnaLLG0f8RGpKczwDHU8FXE6vZgf2GQ6LucN/RY4HH
xZYYLoNU5yDFLhLOcjhq/UHnljBPx+3o92RJTd4Ze0iK7SG3t4TakPlNNa/fCgN4
3fRvs1/fJEGYQD4TDsOZ0Of74UGD4ALTG+G5jAtAdu3ji/iKRtf5cB78dMkCOFB4
rjEqDSxiCMD1V2uownOLqKfOOaJz8QxBplw6UnwCW5DAeosu3LQt3URsjtEWjbwp
8cHd0WiABF4Z7ylATPq6NBu1qOUFPOalNwjsZdlDXa1Ii2sduF6hmQ5YTvu4OUU7
RxuwEHJVhfIjHwtwAPpdCuKyjzHegyTOZMegHJ06iES3wzNy+oX4msNPGmKJDOr3
+AuiRG7O41ubtuAbv5hQBs9u+w8gkoK9lumesT0crA7eKyFxn0+sWGHow9+Y4Wyz
RTp81UlJuPLSdM8MuAkruvcZ1HUhG7sPei87tVEnubMuZQvEb3X+EuaVQUB936ct
YQ41295cy+ieePtaCPEYvIgxGRHGj/sxollxaqL5aAl49uvC74aSmaeZRZtJ6B+T
WhaUvH05+dZz2BRQZjVTq/Sq+jcsr8TaOvLglaS7ECRMiEyxfkc=
=IGZZ
-----END PGP SIGNATURE-----

--pqmPt9oPL4cuP/b5--
