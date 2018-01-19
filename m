Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:34690 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751212AbeASJRw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 04:17:52 -0500
Date: Fri, 19 Jan 2018 10:17:49 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>
Subject: Re: [RFC] arm64: renesas_defconfig: add driver for PCA9654
Message-ID: <20180119091749.g43xzbw3dg6thgy4@katana>
References: <20171221120859.14729-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdVUcXDf82zupm0BRqjPwBV_kxbtVGhg951ypNoz9c+J_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pbmwmsmsnkfwbvhb"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVUcXDf82zupm0BRqjPwBV_kxbtVGhg951ypNoz9c+J_Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--pbmwmsmsnkfwbvhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +CONFIG_GPIO_PCA953X=3Dy
> > +CONFIG_GPIO_PCA953X_IRQ=3Dy
>=20
> Why enable CONFIG_GPIO_PCA953X_IRQ if you don't want to add an
> interrupts property to the device node in DT yet? ;-)

:D

Will resend a fixed version!


--pbmwmsmsnkfwbvhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpht7EACgkQFA3kzBSg
KbaO1A//VMvOjBTpoF8nWu24wChsu0llc32Bg5nbgRFIkoa0pdmAT8mo5BIbMeJQ
F7bB42ZJRhhkak/YMnEECK4ukWHCxY+PbCmoeXEKx379t9iOBl2zwR9zEEbiqo+a
Bv9tirOIt3pFpdibID2aX6dw+SSEKCFIKLYcnaXwfo/PFDOkYOcwZQ09q6mX4FHV
JGX0lcUmelq537ztwImwwSVulxCSxSL7inquP6/NnQip96Yno4IBh1dYejlRVvb/
oATiEhQ/aaGxWxsxkIcd1k5u1kITuORqiX+0Xc1OI/bAvvJa/yJLYVeT0H/0T0m5
yr0Xiv4XAoSjaCoMjvwnH8Z43hVcMzWuN3fHiIHjgQtZhAB7+iTN5lHruUjIId5p
f26yGLex1ulw94C8sdHUSNBuZ/MorErH+loAgWNtRPairGlPU31+ZgRKRXR+O06D
QCysvIkIA2tHbKlnRHkCk3Gwob4+uPUZin7AQUE6TWAHOCGrjClol03BDg8Qog16
imgUg9ASxJLk1OWD7nKzSVbtF2qeVE+3ZwaA9Xu8QGRm16VYIL4lGS3du+CMcd26
vASC/YgSIYOrLU5vD5WaJMvMHDTnKeww8vlRssV16isweq6XG5JhOHCijwuWdzzf
PmRkhNpM7Y9uwARkNam2cRkfw2lnwo0W8U+RDiVs8mUQuMP0Vgk=
=Pw+4
-----END PGP SIGNATURE-----

--pbmwmsmsnkfwbvhb--
