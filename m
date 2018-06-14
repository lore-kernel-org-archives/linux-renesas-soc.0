Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49966 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752791AbeFNIJ0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 04:09:26 -0400
Date: Thu, 14 Jun 2018 17:09:20 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: r8a7796 add missing SPDX
 identifier
Message-ID: <20180614080919.3llg73cu4ydfjk3d@ninjato>
References: <20180614015607.7066-1-wsa+renesas@sang-engineering.com>
 <20180614015607.7066-3-wsa+renesas@sang-engineering.com>
 <20180614072932.oneux4ep25okr63w@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ytiam7geqsap3j2j"
Content-Disposition: inline
In-Reply-To: <20180614072932.oneux4ep25okr63w@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ytiam7geqsap3j2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2018 at 09:29:33AM +0200, Simon Horman wrote:
> On Thu, Jun 14, 2018 at 10:56:07AM +0900, Wolfram Sang wrote:
> > Due to a merge conflict, this got accidently dropped. Add it again.
> >=20
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot=
/dts/renesas/r8a7796.dtsi
> > index 50a8475fa837..af8196281b06 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: GPL-2.0
> >  /*
> >   * Device Tree Source for the r8a7796 SoC
> >   *
>=20
> Thanks, I squashed this into the patch that I messed up.
> The result is as follows.

Looks good to me, thanks Simon!


--ytiam7geqsap3j2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsiIqsACgkQFA3kzBSg
KbawHA//VqOyZILCZ70gj820EUTW2gt3J4/G7Xy+LhhDFayZVkEROtZcnMyA3L/3
P1a1tJoK6s5kjbS7awGO41vIi9yDn08s7T6yi1q3y+hHm9qLDkoa6LFo0iFWE5Gi
Xci/13uoLf9MFV4gPA3Fzi/CS0kLKuCmxdyQlG9F2UQ6u5cnniSbREVW8tHUkS0m
JofJVQ6y9df7qi3bUTd5HEGE9PYbAocKqvljISd+O48CJLeuVx1sW4ahTx1qvuBe
O5eGh6gpdjWU10dEdfkuby8gG2UQC65u8eH9TxPDCFakIHM/4+5IysvqOgalp1Tc
mluM3mFk4+sewxf0QK2G272LzdpED9kkrhhxNBc8TCM4ImDmH4bfXg6SwShI6jN7
e6krdvhH0OS05QvLd/mBnKCJ4FAvvv8ii/CwTOTegc7mRRw6YQbBzFt4OjSKoVox
3dJuHaQD1VHicVaE7QXR3SsK49YxZQLoxpdSQmERCuPR5eDzzoeOjSAyjMY6J8li
KMeNSC+64wEPmQrCo28GuwIxaaqCyNj2DTCADWrH/2k0qmWkbe4bN+66g9ORD48P
+14rL4xW3J2r6zroT3jAwDDRmqrwpZ33ZGUSp8qIqGROou3oo+Nu2KHWDpdzKhHm
JVxWHukNRk6DJ+vG6K8Eb8R2w8o5s6ZEJaI5Nso1TxTobElNc2s=
=0Pdz
-----END PGP SIGNATURE-----

--ytiam7geqsap3j2j--
