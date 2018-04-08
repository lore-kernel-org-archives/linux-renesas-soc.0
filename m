Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:39444 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750892AbeDHHjo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Apr 2018 03:39:44 -0400
Date: Sun, 8 Apr 2018 09:39:42 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: qemu-devel@nongnu.org,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/3] nvram: at24c: fix problems related to "rom-size"
Message-ID: <20180408073942.lktkq4gqn6ofvjwf@katana>
References: <20180320161850.2104-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="buikjcctq7qeoo2h"
Content-Disposition: inline
In-Reply-To: <20180320161850.2104-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--buikjcctq7qeoo2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 20, 2018 at 05:18:47PM +0100, Wolfram Sang wrote:
> I used this driver as a template for a custom one. While hacking on my ow=
n, I
> noticed some problems in this driver, too. This series fixes the first se=
t of
> them, related to the "rom-size" parameter. It fixes a segfault.
>=20
> I think the first patch is clearly suitable for stable. I think the secon=
d one,
> too, but not as clearly. The third one is a cleanup and not for stable. S=
till,
> I am open for opinions about these thoughts.

Through which tree should these patches go? get_maintainer doesn't list
a person specifically. Anything else I could do?

>=20
> Thanks,
>=20
>    Wolfram
>=20
> Changes since v2:
>=20
> * removed '\n' from error_report-strings
> * made sure checkpatch is happy
> * added tags from Philippe (thanks!)
>=20
> Changes since v1:
>=20
> * reordered patches according to significance for stable
> * use AT24C_ROMSIZE_DEFAULT instead of magic value
> * patch 3 doesn't improve the ERR macro anymore but replaces
>   it completely with error_report().
>=20
>=20
> Wolfram Sang (3):
>   nvram: at24c: prevent segfault by checking "rom-size"
>   nvram: at24c: use a sane default for "rom-size"
>   nvram: at24c: use standard error reporting
>=20
>  hw/nvram/eeprom_at24c.c | 25 ++++++++++++++-----------
>  1 file changed, 14 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.11.0
>=20

--buikjcctq7qeoo2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlrJxz4ACgkQFA3kzBSg
KbZHyQ//ZkGZuVhmHH7+iPHMtlL66tg3bF3DImVFKQgHwq7dhgsCx3cJFSs/ixtI
fezPy4dqF9xSD46K2maueLLbW8QGIa+ukEwe74OP8j07yMjCiPtmtvB2Lj6G89da
QyfxBsxOkUuicx1MrUUN42MTHCFa2gvoZgdHD6hgs4mXqWiAHCIX3LMigkHZ327b
K92bJhGvZmAu6MUhMp+vJ8x7QLnreADATItZATp1NBQH4OGZ+Kp1Vo9fKDwTwMDm
N7xuEqNEPmg5bGnVa3de0XUY6/au4Ywu5oECwr6bH0yDVLueegOONzw7VaFKl7Ao
Vcxk2rheo2is/RKPcgGCnZBwyG3mxP2pxSUv0o4tEl9VbChc7HGNIRZcMLXWGTCg
A/lJASUs10CcGXNaAtnZ4ObrRsWkAZdp1MswilSnh0xzNAJw+04nXRPuqGimrcv8
UnY4hpYIWdfHxQKVdH9sDU6DXB/n2K/pCm5u/4xCtfrK+R/zIXrxJvz+cbSmhee7
ZZu3Gxnk+WwAIHMYaSoq7mrILz3a4WqrNZahfmkO3CYOb/ufUvztQQyxdXuUnR2H
VyY+VEioZyl3NMJm4+Sig19Mx1G/SJxH0/a/f0XaVLUNtgxwv427uu+rKHBELCua
YWqLYg0qF5pYF3ebwIhmwEAfWbhn3xhDF7iCmnxBAl36MX5xFbk=
=bYzH
-----END PGP SIGNATURE-----

--buikjcctq7qeoo2h--
