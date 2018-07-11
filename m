Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51846 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388160AbeGKQre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jul 2018 12:47:34 -0400
Date: Wed, 11 Jul 2018 18:42:22 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] i2c: recovery: if possible send STOP with
 recovery pulses
Message-ID: <20180711164222.zihcddvxqbwglqor@ninjato>
References: <20180710214217.1336-1-wsa+renesas@sang-engineering.com>
 <20180710214217.1336-2-wsa+renesas@sang-engineering.com>
 <d7ed18c1-a45b-e27d-ca9f-23685364454d@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3s24dmhoxdrwrcci"
Content-Disposition: inline
In-Reply-To: <d7ed18c1-a45b-e27d-ca9f-23685364454d@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--3s24dmhoxdrwrcci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> Hmmm, should not the ndelay before the loop also be split up in two like
> this, with one ndelay(... / 2) on either side of the (possible) set_sda.
> Not that it should matter, since SDA is presumably stuck low. But what if
> it isn't?

I agree it would be better.

> I would also change the while (...) to
>=20
> 	for (i =3D 0; i < RECOVERY_CLK_CNT * 2; i++)

Yeah, could be done as well.

> but both these "issues" are perhaps not related to this patch...

I also think these should be handled incrementally.

> Reviewed-by: Peter Rosin <peda@axentia.se>

Thanks for the review!

Regards,

   Wolfram


--3s24dmhoxdrwrcci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltGM2oACgkQFA3kzBSg
KbbG9w/7BZYaWFtJGpyCxdiWTYox1anDN56lAf9ykMCl7eMrCISb5Me95YJ9g9Pj
0prnhekQIwf9W443lTCLUrYMPozqBYsomPTo+rneZarXSvuzxY7RDb7JH17/Wc/b
yIgn7Ccq/z4G3EPUsTSDFEaYuazX1zZ/JiXsD4OyIyzjfPq6aH58VZV/wJd2VdMp
uHaj0buYAo1rrPX1F7RxtMGQbn5qkJPbh1WHLiPdTe6nWtEObCz+4coTDVJHwAVe
liFIEYXejKwZY4bgsdyW/vKlfTktJez2qz3pehEcqsnzKshDWpcgniPRROcImHPw
83bG0eVZx0/pPKzbn1GILX1SaIeVjtaivmW5dOryM+UFfi4kHRWgg6Oj+/h6ffjK
RAdGonlt6xLVCjdpgNyAICSOPcj3eYthMI3tv1SMoy0jEdPuJex4pqwdDK7H3OgI
QDujl5cSP2IYy85tJxcctFGF0b4A/9u+SltgzIyfFJZfn0lcJJLT5eESHf+nu6NG
pC3AGTKkDxVglcyxgwERT/K582S44v+z3RWt6HUZB+xqR2h45Gop1srKwdttvfAW
XxvJf5aX6w0SaYwIMXLWJH53MSTxFbJil88IM+GPmKjLM1SDGWgpWBXUUajsiAzd
igOsOwyqs8nd2Jnqbl8S3STVhv2V9N+8aiTFC1BUHcYb7xocA4c=
=5uak
-----END PGP SIGNATURE-----

--3s24dmhoxdrwrcci--
