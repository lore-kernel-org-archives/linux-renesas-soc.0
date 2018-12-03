Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56924 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbeLCQPU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 11:15:20 -0500
Date: Mon, 3 Dec 2018 17:15:11 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Avri.Altman@wdc.com
Subject: Re: [PATCH] mmc: document 'Reliable Write' bit in uapi header
Message-ID: <20181203161511.GA1604@kunai>
References: <20181203142644.3038-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdX+skNFbUiCjzU=vuR3PfTFib5ad+C1yDp=Kc6i2A=Hyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+skNFbUiCjzU=vuR3PfTFib5ad+C1yDp=Kc6i2A=Hyw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, Geert!

> > -       /* Implies direction of data.  true =3D write, false =3D read */
> > +       /*
> > +        * Implies direction of data.  true =3D write, false =3D read.
>=20
> nonzero =3D write, zero =3D read?

Yes, even better. Will update.

> > +        * Bit 31 selects 'Reliable Write' for RPMB.
>=20
> Perhaps having a #define for this would be nice?
> Can also be used by the driver, instead of 1 << 31, which some static
> analyzers may complain about.

Maybe. Should be an incremental patch then, I'd say.


--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlwFVosACgkQFA3kzBSg
KbY6/RAAnE0TmzyNVIcsv46g2H1s2vTzD8rcSEVMMdzUrK0gzQqj6FXIMrp6fmee
6qUVZLoZC7rfWr7wApcbfWt1Jr3APphD88+mRUzXWWkQZ0gLeBNPTYg80fTuTx80
4zczAo6LWBB6/gZUQtFN7rccrCAe1Z8Z/mYl0tG0iReWYqyGXpS2s2WLUWavT7Bu
gA8+OCHwrQBlp259kmkFozY1SVK0rv2OK3Fa+r33irPSYdrePunpdVzRMZceQRim
+Aw2ETz5oqq9zfyIM7azRPwEbY4xF0yFBHUrOeBy3eQO9FqQdNpxbGAm5qJ/TOJ3
CA86yW9gnLb3Ue549fuEm0+HhpERibfGnKEDifebvlhpo6kcLTv76NWB+T3DqHq+
ol0Zpee8cxl/+QUzJGfDWc/0ZwJgUUCF/Tz+cehJkRp4vVnu8DsMPfN4rKAFO4zX
WwKQSAyqxpD6h7tS/6FZ0pQAxxYxCWS5hN6GM1u8sJ38OsjD990TOiTatCKx7TCC
XquL2FpJKSRzGF70XROFVNolFEGYTZDBhquzXgQ/IVILXNHzluEXZzrfSEh06+7P
C1Ssf9nbXQyOvweV4E9dYhos7PMPkWaNH1xCFsV7mVYvY01pFLGMav/ZxfmOHyD8
UMIRotMIZxYKheeELYMgsY5hrWSzH134EpNX8jNOJI4ZXQirNBM=
=d2es
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
