Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:54028 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750768AbdLUMhR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 07:37:17 -0500
Date: Thu, 21 Dec 2017 13:37:16 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-common: add GPIO
 extender
Message-ID: <20171221123715.7xjyfx2zd5uznf5r@ninjato>
References: <20171221122136.17773-1-wsa+renesas@sang-engineering.com>
 <20171221122425.3uz5mquj2a3373gb@ninjato>
 <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ovdnjosjs2scpe45"
Content-Disposition: inline
In-Reply-To: <3d26f184-ed1a-0832-3c58-01a6173560e8@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ovdnjosjs2scpe45
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Forgot to say, this depends on 8a64e557f399090f5d1917b2f32a065da2b12be1
> > ("gpio: pca953x: fix vendor prefix for PCA9654") which is in
> > gpio/for-next already. I cherry-picked this commit and SATA still works.
>=20
>    It's in Linus' (Torvalds!) tree for quite some time already. :-)

Well, it was not in renesas-drivers/sh-pfc-for-v4.16 which I used as a
base for the SATA work which again is based on v4.15-rc1. But nice that
it is upstream already, thanks for the heads up.


--ovdnjosjs2scpe45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlo7qvsACgkQFA3kzBSg
KbZzRxAAry4O6f9ivMTopMEzar1TWPbCqIHpDqNGqz/6uk8NBYjZVuDKMpk3viJa
OR6e4NNoHMIbHXF2reAXR3gANn9B7PU45JhZPEONKKUjSQI64J4ZGH9dTyEpTavo
AKgDFmLUUKFoahegv6s48E8ApmEZNQhb+Ig1f4HNPEYKIl0DTjMCH+CIE57I5InS
HeOqiFlfK8PyEXp6DovEjvLrCTjPlLRUQdkB0mOvfIsJVrlcF+IqCar1RMvfCY0O
JJijUaRf1YfUeZkYNcdSaRQ5jG8m35AF5PA4WtyK/m0dSsTuNyi7diqxgWr93Vmk
WoAkoRg/EyaZKb+Scdvr0gonmghOprQkhV8rJQZdy2fIzDb0Z0b+jp6/2FV7Jj1a
91Fa457CurMtSRcBxuBEslj7s2gqtZ7bzYy6AcfZEnjS8EDT1uyrY1sOCh95TwYY
eDNWwizfeXkfj+aR3r23oZJ9WmPOXCD/iOUYOV1BkqqoLbz+SuQd3JnahwC2aN/o
P1OP46KlPfuBPVyQNO41Bn+1KNsZsdMN7DCdM6Ix3Vk0W5F53RPaQG+gAMMsItp6
z0j8PJD6sBNe/8KXI/w2YbVAxTZKAaPv/fLcgyQprIfYkWuIXwZag/1ACVivQs7G
m17VlSUsVOqDkFMCkvrTD3C0b+DiZ5XGP8DQaSxJvu72YffCnhE=
=3HgI
-----END PGP SIGNATURE-----

--ovdnjosjs2scpe45--
