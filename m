Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:39092 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750760AbdALWn5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2017 17:43:57 -0500
Date: Thu, 12 Jan 2017 23:43:53 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] arm64: gen3: enable eMMC HS200 in DT
Message-ID: <20170112224353.GB1490@katana>
References: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <20170104173954.3135-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 04, 2017 at 06:39:52PM +0100, Wolfram Sang wrote:
> Simon,
>=20
> as Ulf picked up the driver patches for HS200 support, it is now safe to =
pick
> up the DTS patches, I'd say? I rebased them to the dt-for-4.11 branch.
>=20
> All the best,
>=20
>    Wolfram
>=20
>=20
> Wolfram Sang (2):
>   arm64: dts: r8a7795: enable HS200 for eMMC
>   arm64: dts: r8a7796: enable HS200 for eMMC
>=20
>  arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 1 +
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 1 +
>  2 files changed, 2 insertions(+)

Ping :)


--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYeAapAAoJEBQN5MwUoCm24u0P/1hY8WllXe3AWfrAQG94hOtj
k6RBcOsg9XADqsmjfxhR+W8RzbqiJeebv4MsNHz2otJHwiB9ymLlTpke2njTt59X
7+etTaHPaNaVowZHD2qBTDR79tA6fCR3EojeXCMYiFSDDTUhC0ePvJr+4Rl2FOzi
7Gz6oS+ahMBZeLzjVfjqk1ILNVCLyBAsjl7LCJBD1mgty8EEUZpRCW2n6VJpRuur
/4V03x2UDrJI3BKBoWxRqf56nbYyjBPD4DJlmLnCK75O+B/svPNg3jlw72rbA137
Jx6Dx9WqHQmAvrksh0cA+GSCAVOe/DvXKQ6RitAQbcuV/UTLYE6RH4JIUmKPFRN0
dbHKOUMpz28LtPTDQqAbepoplPzDQWiJfdHSzKsr7b9MROsE7pxCPgv4ZxijgXm2
bp7GL0BY365iLXItJ4E1syL1EJJq1P9MHANrUl490gsS2+TeMcfdlm2/1Chvugr+
zGQ2UTuNDAfCeSb8YFbnL5+7GiSWo2sYZktR2k6JREJjIPhR6aCyZG510Kc3Is7p
uo8Yu9Qrk9gMML2BnIUE4n8hpfZP3vkch/SOsfgPH4aknqhnUfvWksr2waXB8C54
LaK9Ml6LXZMrC+QbW+mFir9Rpi/JptxNpXCrtZjzS6zHPoqLayftKlrx59a41VWs
8bq+LvNDqMEU4ULf3M5o
=U7oV
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
