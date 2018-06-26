Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:52742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934072AbeFZNmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jun 2018 09:42:50 -0400
Date: Tue, 26 Jun 2018 17:42:47 +0400
From: Wolfram Sang <wsa@the-dreams.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH] i2c: gpio: initialize SCL to HIGH again
Message-ID: <20180626134243.rp5rranv2pbh6ctd@ninjato>
References: <20180616125636.4210-1-wsa+renesas@sang-engineering.com>
 <20180625142956.egsm4nzc5ithrlsf@ninjato>
 <CACRpkdYMSEs=kq6evRbKGAKvX8Vj6BhcBne=J+yML=HRgxHTgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="lmuyrcmlmdcsz7gs"
Content-Disposition: inline
In-Reply-To: <CACRpkdYMSEs=kq6evRbKGAKvX8Vj6BhcBne=J+yML=HRgxHTgA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lmuyrcmlmdcsz7gs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Looks like a mistake on my part. Mea culpa :(

No worries...

> Luckily it is functionally mostly harmless, but to
> conserve power, it is better to initialize this as high (lest
> we dissipate power throught the pull-up resistor), so please queue
> this as a fix and also tag for stable.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

... and thanks for the heads up!


--lmuyrcmlmdcsz7gs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlsyQs8ACgkQFA3kzBSg
KbYBDA//WdGCJPgbk37cVDvXl8MMn7s5whlXaQ74M9tVDAWIV2LbibKjPdgG5XVV
N4hfwX+FfVA0KrOAt4FFos+kSC0xu1z/9zLRBQf22Wz32F1q352QWUtn2/xnwp6l
3XtgPa7fTF86AOfM5y6eFEQCiZz7ApYvUK18dWBa+MCxeDlnLp6t9e2V5pVrPyUh
nHiTRkLNPuvL5I/N/3jOEW1jJsvVQjiu9QSgx/Gpki4RKvT0D3WGiE+rK3UvJ1uv
mjcas1aGQJNzczWdIGTyPw6QTPdpky3mOAEtavDaIXfkKZosvS7z0liZOW457XzB
BhKykAlaEFigTUGBhCvySUujxo3+8xBU1hEzOP7Ahd6v4/MNvZUwgby5fLVC6eLa
xr7ePCXTQjUPYhKT5o9HnvM1BpAH8RO4Zcj8geJw7WKO394KHzCqTcwaTbOG2UZA
BHQsr8v2ZyJoZwuLQJ3Dkq1kUhUQ19t7BcVU0hf+Wydwv4eDiz8AxVtpiRMmT6jO
Ig5zBtDvGNsdZ54eYGbDM8RnDfjAe2sMT4WMtLCrhnQM9ifuDc9wsa7k+VImcrOz
oVJPeub4aI+V7Gn7DXeKPNEoFvvu+J9qoiVnN+yjILPudjMPF452dHY2tKMsfAe6
ySPGgCY7+qL2wk3o2k6HCafRNY5iHzYnARhmuRISwe37uTMo+ss=
=hggK
-----END PGP SIGNATURE-----

--lmuyrcmlmdcsz7gs--
