Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:33451 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751660AbdLALJK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Dec 2017 06:09:10 -0500
Date: Fri, 1 Dec 2017 12:09:08 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ARM: dts: renesas: Convert to named i2c-gpio
 bindings
Message-ID: <20171201110908.u7xjrt7xmlqgigvy@ninjato>
References: <1512046646-15253-1-git-send-email-geert+renesas@glider.be>
 <20171201081850.4tqbnlvxdax7phfs@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ck437fd46wd3ogsg"
Content-Disposition: inline
In-Reply-To: <20171201081850.4tqbnlvxdax7phfs@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ck437fd46wd3ogsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2017 at 09:18:55AM +0100, Simon Horman wrote:
> On Thu, Nov 30, 2017 at 01:57:22PM +0100, Geert Uytterhoeven wrote:
> > 	Hi Simon, Magnus,
> >=20
> > Commits 7d29f509d2cfd807 ("dt-bindings: i2c: i2c-gpio: Add support for
> > named gpios") and 05c74778858d7d99 ("i2c: gpio: Add support for named
> > gpios in DT") introduced named i2c-gpio DT bindings, and deprecated the
> > more error-prone unnamed variant.
> >=20
> > This patch series switches all Renesas boards to the new bindings, and
> > adds the missing GPIO_OPEN_DRAIN I/O flags, which were implicitly
> > assumed before.  The latter gets rid of messages like:
> >=20
> >     gpio-208 (?): enforced open drain please flag it properly in DT/ACP=
I DSDT/board file
> >     gpio-91 (?): enforced open drain please flag it properly in DT/ACPI=
 DSDT/board file
> >=20
> > Patch 1 was extracted from series "[PATCH/RFC 0/3] i2c: gpio: Add
> > support for named gpios in DT", hence the v2.  All other patches are
> > new.
> >=20
> > Note that after this series is applied, the i2c-gpio buses are no longer
> > detected when booting new DTBs on old (v4.14 and older) kernels, which
> > should not be an issue.  Booting old DTBs on new kernels is not
> > affected.
> >=20
> > Thanks for applying!
>=20
> Thanks, applied.

Phew, you guys are fast. For the record:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ck437fd46wd3ogsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlohOFQACgkQFA3kzBSg
KbbNcg/7BrCh9DHg38ctotuB5mbxfvNcmlIZFwUAMuJa+IrC/xuQq+1499+z7zHa
VrIdeRdXZdaoiv8/2JybkA8esBASE/G4DN9bvuT+mZvw52OiMRt+pm1P+O1nYF0D
fBNQkfRRH4/DHP8jIynPHrC2ZX4Xjw8oMgkQY65KmNzQZS/VXPMO1JCCds55TKdv
PWu7EpWo5yXMQk5JrPJZZQTcqDFEMJFFxvcIzGVOICguowBUziFl5Z1vnuvTpHzM
jzvspg5qJytE1Rfu635lH0UgFQmkPFcSTrcT7Y96/hGQvDypvrZTkMQ24GExBjl0
VZpvDVd0nSuYG74ZlgOEt6bLs3d6+0hhWEL2r8o2MJYlIEwwhhpmbnR6RlGvuI0X
jDpT/8Q/aLtDMF10GX8mBj2EMYWrTl6fMXru6bgJbJsSOzT18H6mRbvrD4FmluS6
pMCIMLdSdjc0beajJz413UcJ0QTk/jy+fS/D5jZ6ov3UBKarVMQ8aYaGscZ1Tjld
ZrttrFYr5md9bb4FYRC3npVSD8AM9y0SrHJ/Fg7xFILuwB4n6D5KaAmExBa7uega
4Mze1N8QkMCwCDi/KjFJQb2YRTy1l10Hx+TcoXYjmdTesuO9Gw7FWzWGDrww9jKY
4riKhv2GH6vkLOWilJwDD8Gll6NbXlmt+ntPyv8yy49iKwtoBfk=
=TCRk
-----END PGP SIGNATURE-----

--ck437fd46wd3ogsg--
