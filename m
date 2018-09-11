Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52246 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726622AbeIKS5s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 14:57:48 -0400
Date: Tue, 11 Sep 2018 15:58:18 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [RFC PATCH] mmc: sdhi: sys_dmac: check for all Gen3 types when
 whitelisting
Message-ID: <20180911135818.GA7589@kunai>
References: <20180911130626.7232-1-wsa@the-dreams.de>
 <CAPDyKFoppKoS9fG5+4Tb9av3RfC_6nhYqG7Mixa8x7A3gGyn1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
In-Reply-To: <CAPDyKFoppKoS9fG5+4Tb9av3RfC_6nhYqG7Mixa8x7A3gGyn1g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2018 at 03:29:14PM +0200, Ulf Hansson wrote:
> On 11 September 2018 at 15:06, Wolfram Sang <wsa@the-dreams.de> wrote:
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > Fixes: 26eb2607fa28 ("mmc: renesas_sdhi: add eMMC HS400 mode support")
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > So, adding HS400 support broke the detection here. I suggest we discuss
> > internally, if this kind of white listing is still needed, at all. Until
> > then, this patch makes things work again on H3 and M3-W.
>=20
> As this is tagged "RFC PATCH", does it mean that you want the
> discussion to happen before I apply this for fixes?

Yes, exactly. This is more "to talk over code".

Thanks!


--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluXyfYACgkQFA3kzBSg
KbYf4RAApyIiYwV0X404re+tA0YQZ2QoxnFUtnHdTdWMCc04qCLUfLVHbw4MJJnZ
Xnztr77exWuWLA+k61qJA3hTHTFIRIXdtfO7UWGa/XHqmp4pUPoYRikCp+z/ZaBO
Q70+LVlQrT5teJKutw5hDp41aVSDjD9Alb3t11xecS6SYoj8XbUsnaHtBCYvAk3I
ovY+g2mLzIWQY+Lg7kzX+Qw18+SiEx4yNsTDb0zouhZXGG6FVbfy0xoV1+G1UfiY
Mj7jEJxj0G8o8/tDGzniNTD0BlXMta+cPuyWrgFjfpK8FN/r11wBG1St8gOB8lW0
MUiEdQ/N2SIn8l2i28UCN98M2ZLBGD0NIcI7Ln7oQI1q0kikMYam3W9ki1Es43wk
eY2Rs0YgJtO2QRfpnkbNrJUhiLZARlZTbBKPF0OuyN7RLrG++9T+blWFv7ed2hT5
+phtFCawXcE6DpnlGhbLssRA0EIkgJHSk9QXSKCxW233xummC4FJECUCM5ehj10V
NORiVPwCB0p3lCXsD3XWI2H0bCLy1GkXszIhCFbq6IICyrJVwsuPJybOfBN6hfCu
HE/OAlZafIB1X/zdkeQnev+9kLD4Kw3R6pzvsmHfFeHVdgHe8ArDmjPv0gvprFtb
3bP5QQ18SQRYRh15YN0rFG24YZXGK5UGkEjiOQuMI6UKthj2Ofc=
=8mNA
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
