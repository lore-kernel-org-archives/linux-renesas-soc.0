Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:40089 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755452AbcH3LZH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 07:25:07 -0400
Date: Tue, 30 Aug 2016 13:24:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: renesas-drivers-2016-08-23-v4.8-rc3
Message-ID: <20160830112457.GB1638@katana>
References: <1471959320-16947-1-git-send-email-geert+renesas@glider.be>
 <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <874m6buh17.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I noticed that Lager "ES3.0" board can't boot on this and previous -rc2 branch.
> In my and Shimoda-san's check, "ES2.0" seems have no problem.

I understand the issue now. It is not about ES3.0 vs. ES2.0, it is about
cold-boot vs. warm-boot. I remembered the DA9xxx interrupt storm
problems we had, and voila, I could reproduce the lockup on ES2.0 here,
but you need to cold-boot and have the da9xxx drivers enabled.

The fixup which we have in mach-shmobile/regulator-quirk-rcar-gen2.c is
flaky. It only works if the da9xxx devices are added before their
drivers are registered. Only then it can apply the fixes to both
devices. Otherwise, the driver for the first device gets probed before
the fix for the second can be applied. This is what happens with the IP
core switcher which is initialized after the i2c drivers are already
loaded. The same issue would happen without the IP core switcher if one
loads the I2C master driver as a module.

So, we need to disable both da9xxx once we detected one. I first had the
idea of installing mini i2c drivers which are loaded before the "real"
ones and prepare the devices accordingly and then hand over. But even
sketching this looks ugly, so I suggest to just use i2c_transfer with
hardcoded i2c_messages and device addresses. The fixup is used on
specific boards only, and the addresses are not going to change there.
If so, the new boards need a new compatible value.

I will work the i2c_transfer solution right after I had lunch.

Regards,

   Wolfram


--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxW0JAAoJEBQN5MwUoCm2awwP/2mRw+dKMS8V32Y5DwdThmdT
1CELdsoHFYQhVdYSdO/GGF9L9jmrjmUQK/mRUOVZElq+QEogOTw5jxUQJj/mn2d8
BnkqIdfVqTgKm0Mi1vSPkLcEip2rnur+As/rd+Sk+GLEY7mE48DvIwHd0eMJ97kE
g01eFbGFXgEI+1KcYaMMlSiNxWIpE0blXQCYm5DFjj4BXxBAyAXcU47BmVgwgplJ
Xie6EBN5NFfTqNznsavfDedDKzlSnUOAW0V8hsM+ObIA6kU7yU/x7/9ZO7JFEGZ6
coqCDP05p5WvcnhO+deSfds2XMROVcq+TJbhnXgKaycfbJCuuHEPUSOnax7vVIhG
2q8cgYDCHhUZ8W+uWES18Ifr0sapFgWBpdI+G6ENlDJ5O2fFMj7PUFoPKtNYasZS
TbKPMtwDjWmgdpQEtCG5eczkwboUeevvGfdknXIXVm1XbOWApJPc9p25Tsj6LzRt
ZboOUdyzNM1f9W5RUoFd0nTOOsEKq7ZYi/erASjc929QfgI7J080TKRz2ysOLD+6
jRUsIotoiEVIMhrLFeCGpKI6sHnMx0fkSv1R70q+aBCgd0c9bAAYO7dRnut74Eht
R4AH+Yjn5iAiI2+7oEQLioChuG8Hj4/6h1Ma/JiGAxYK4YP/PNsVF66F2nkOpP5J
Oh+jATvOleOjFghDWkey
=7+zN
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
