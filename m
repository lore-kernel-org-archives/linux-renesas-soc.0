Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:40490 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932237AbeFFJAw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Jun 2018 05:00:52 -0400
Date: Wed, 6 Jun 2018 11:00:50 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?utf-8?Q?Myl=C3=A8ne?= Josserand <mylene.josserand@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: Build secure_cntvoff.S unconditionally to fix
 shmobile !SMP build
Message-ID: <20180606090050.u2n7ghnwuxj3vqv5@flea>
References: <1528275154-5164-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wfsbiooipgtta4a2"
Content-Disposition: inline
In-Reply-To: <1528275154-5164-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--wfsbiooipgtta4a2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 06, 2018 at 10:52:34AM +0200, Geert Uytterhoeven wrote:
> If CONFIG_SMP=3Dn, building a kernel for R-Car Gen2 fails with:
>=20
>     arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_time=
r_init':
>     setup-rcar-gen2.c:(.init.text+0x30): undefined reference to `secure_c=
ntvoff_init'
>=20
> Indeed, on R-Car Gen2 SoCs, secure_cntvoff_init() is not only needed for
> secondary CPUs, but also for the boot CPU.  This is most visible on SoCs
> with Cortex A7 cores (e.g. R-Car E2, cfr. commit 9ce3fa6816c2fb59 ("ARM:
> shmobile: rcar-gen2: Add CA7 arch_timer initialization for r8a7794")),
> but Cortex A15 is affected, too.
>=20
> Fix this by always providing secure_cntvoff_init().
>=20
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 7c607944bc657616 ("ARM: smp: Add initialization of CNTVOFF")
> Fixes: cad160ed0a94927e ("ARM: shmobile: Convert file to use cntvoff")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--wfsbiooipgtta4a2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlsXosEACgkQ0rTAlCFN
r3Q1Rw//QBUzNHANBVN/+n0pOuh/X4bAoOr+sMpF5TZg25s48unNQYbComrNE7Fa
BAf5Ix3iKWlgKwvB8dZBfuIzDtF9FXIS9J/5d+lqyKScaqrSPGo7aNCKIF6zTWnq
2rSCrOFEZb3pS0rtYhwdlP5vffsg/5AtFmwQ47l3v1Pz8SiXEgfSpuZjde0KacLB
lWKGQ8CAaWr2RJ8AV1Cx8H/DqCCFVWdEyF6SwLEBAuUmsH81l3042nEPKbtA2joh
CsbjByoy5f7tqD6L+7ob8Nu8UDGVvbyZ9CDxcNTj0wOsrhtOoAORHVFuiAkw++xz
WU88eZUDiyMmOTEcW7Wz4mMN8Oidb14BeVVw77VPK829HBVYY6uO8bGc5dqD5S6A
U8SuuowDNvyLYR2dZunt2UhZTmth8S3KaeQLHv94cJ3C7cqC9znzgsGM0ENzMVeF
OPrW+z7L1wFewORcmcR2ONNqjlWPpjAVLxqK0wxboM2EXXpSn8jyTNsTx6RVUldW
v2lscI/dGYvdgmJcZ5XrIC2vL+GkCv+7AxxVXjgVWxDN+1HbEmK0c/XKhoy1YFTK
XGxisRlF2/HfZ2POhh3M3R5w097pLLLc8JeQXx66Sr6J8p1sOgXcTm0pb5mQLT9R
oWacYld2uHhZLrbyi+W4I7dMntHmpgjpBLRb/QLF28L/SmC8PAg=
=Y7vo
-----END PGP SIGNATURE-----

--wfsbiooipgtta4a2--
