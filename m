Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:56277 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751779AbeA3Kvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jan 2018 05:51:41 -0500
Date: Tue, 30 Jan 2018 11:51:37 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: gen2: add IP core switcher for all
 busses
Message-ID: <20180130105135.3vxze4xrjvfmvtwq@ninjato>
References: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fgacw7jrqdljhd5g"
Content-Disposition: inline
In-Reply-To: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--fgacw7jrqdljhd5g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 31, 2017 at 12:23:11PM +0100, Wolfram Sang wrote:
> Here is the updated series to add the I2C IP core switcher to all busses =
of
> Gen2 boards where some kind of switching is possible (mostly to/from GPIO=
).
>=20
> These patches were tested locally on Lager and Alt, and remotely on Koels=
ch,
> Porter and Gose. We have no Silk board available but the patch follows th=
e same
> style as the other patches. In addition, these patches have been double-c=
hecked
> by vimdiff-comparing the i2c-bus blobs before and after this patchset.
>=20
> As discussed previously: the tested boards boot fine. No regression encou=
ntered
> there. However, changing masters at runtime for HDMI-named busses and PWR=
-named
> busses will likely cause kernel warnings and maybe OOPSes. This is due to=
 the
> rebind-issues in the V4L and regulator subsystems. For the former, fixing=
 is
> WIP. For the latter, it is unknown how to deal with rebinding in general =
(but
> I'd need to look at this issue again if this is desired). It was decided =
that
> we consider those follow-up problems which should not hold back these pat=
ches
> anymore. The EXIO named busses seemed to work fine as far as this could be
> remotely tested.
>=20
> Changes since V1:
>=20
> * fixed I2C4 pinmux for Koelsch and Gose (thanks Geert for the report!)
> * rebased to current renesas/dt-for-v4.16
> * fixed typo in branch name (s/topc/topic/)
>=20
> The branch can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic=
/ip-switch-rework-2017
>=20
> It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.
>=20
> Please review, comment...

Simon, any issues left before applying this series?


--fgacw7jrqdljhd5g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpwTjcACgkQFA3kzBSg
Kbbpow//brxY5D4Ndu04rGcR4cNNcHJ3QGQXDExj9et8xxYxBbOlWVS+Uz7m4yUH
ML5FJFaroZbHA52ywCbo0IPquomRBnxAGcP0QDvfeug0135BycVI3UgGzltW+K6e
dFQ81dsnBduHphDraIYjpg8vI1jxj6P5JwMFJpFwHWVq8NyvlyQQCi0U8m8Drpk4
MPP/sRfvfv2lcR41PAduXXaz3KR2u81IKFar5UXkxKcHVW/0o1JUKxs87LOB4Wk/
8BXtN69RKDDKVykr8lg1qeiIDksxFR5PYEmL06HhBVGuGacfkYsG5t2m5cwS9tli
bRZgxB8qKG22xT+S+FMwcJMVUi6RWZJwilAFzvnEoAG4nvN8R9V3NcHVGsFFzmSb
AquM1PH9k7sY8snZWUt+ido+eiZIIdY9B46v0Xh7IsGpmDYCTgT0padNMI6Og+KZ
mthPJSNFqCJEVm1M50hoQVFWpLeIoT47PpYeZJNSMQxDRQMAnoeVn9SRTImDy4+1
vZkxzu/cvI3ip1blOgMrvxezqf3rhlABwE3v9oXlVFfoLwRS0Roug9WFJe7NDWpy
lN7EgPrus1vBvXbybrTE6rilwVgzPq7dzzlqBd0z17ozVFQqDDokUaOzs1OD94RW
/2EDrSWrZEIH1BC3nyFbC/yqfwycLEcjbH4uDSJq7wrmTtK4xJs=
=+uT+
-----END PGP SIGNATURE-----

--fgacw7jrqdljhd5g--
