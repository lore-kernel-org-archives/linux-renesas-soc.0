Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:34668 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750739AbdLaLgO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 06:36:14 -0500
Date: Sun, 31 Dec 2017 12:36:13 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/ip-switch-rework-2017 for renesas
 drivers
Message-ID: <20171231113609.cflgskbo4eqzgtjr@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2usbb7ogdb3hwpt2"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--2usbb7ogdb3hwpt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is V2 of the the topic branch to add the I2C IP core switcher to
all busses of Gen2 boards where some kind of switching is possible
(mostly to/from GPIO).

It is based on v4.15-rc1 + renesas/dt-for-v4.16 +
renesas/dt-fixes-for-v4.15 merged in.

Please note the updated branch name (s/topc/topic/). And please pull.

Kind regards,

   Wolfram


The following changes since commit d3e886748401cf19c44ba66239355fe50185d0cd:

  Merge remote-tracking branch 'renesas/dt-fixes-for-v4.15' into HEAD (2017-12-31 12:30:26 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2017

for you to fetch changes up to 3c471576f7285a55aeaf5c60b2beec1f208c4c80:

  ARM: dts: gose: use demuxer for I2C4 (2017-12-31 12:30:39 +0100)

----------------------------------------------------------------
Wolfram Sang (9):
      ARM: dts: lager: use demuxer for IIC2/I2C2
      ARM: dts: lager: use demuxer for IIC3/I2C3
      ARM: dts: koelsch: use demuxer for I2C2
      ARM: dts: koelsch: use demuxer for I2C4
      ARM: dts: porter: use demuxer for I2C2
      ARM: dts: alt: use demuxer for I2C1
      ARM: dts: silk: use demuxer for I2C1
      ARM: dts: gose: use demuxer for I2C2
      ARM: dts: gose: use demuxer for I2C4

 arch/arm/boot/dts/r8a7790-lager.dts   | 279 ++++++++++++++++++++--------------
 arch/arm/boot/dts/r8a7791-koelsch.dts | 232 +++++++++++++++++-----------
 arch/arm/boot/dts/r8a7791-porter.dts  | 128 +++++++++-------
 arch/arm/boot/dts/r8a7793-gose.dts    | 252 ++++++++++++++++++------------
 arch/arm/boot/dts/r8a7794-alt.dts     |  53 +++++--
 arch/arm/boot/dts/r8a7794-silk.dts    | 128 +++++++++-------
 6 files changed, 654 insertions(+), 418 deletions(-)

--2usbb7ogdb3hwpt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlpIy6UACgkQFA3kzBSg
KbbNqg/9ERUJfSWeHgB0akJLhvyTeJALpz2KHiHQ+XaZ1gu0Y5CuE8wn6vBw9T2p
HGYrEouZk/axnxP7D5E3NViXDbfPzb2JRnXk0e3dBDMIXR1n7WvBGh9L1R5ppnb5
ptF9WcaU7xRDzTjIMVhGh6QHWDen9s31C7UtzKEH7lhjYop2Bxd/JdRN6RWIxUyp
SxaUhOaxiB9LTosNIGlsMOfPOnzOvE0fAK+KkWAxcRW/XUnGY/UvFysWPl7TmYVw
Zk6KxaBnpIYrvHOC01fqTtZMwDltsNzGRsvmhf/FLNawa753CgiiP4Ts0AQQb/zY
8f1d+1sQUqKyXtC/DOYVG7y5hz8rSI79Pw4WyYG+21/7D2nZ3yy3AtDzDg42RUOP
ITquXT4FvRiE8PooKSPplcykWH8/2dfA188pM0vMSCUE+tmCaggP0Tmz0P1bXSt8
UBHvEtm3bUlPkVYXYBDMIhhVLi7SkR87lL4PSxcgGJX+Llwoi+AYL2HIlaMgFmqO
mJ50EUE2Iq+afOkx1VBZSjuG+rEy5q1nWkhjv+wqhCwE9KGYSagWgpXMwYv9eIAg
g3PwQQ/xhhVybgqPPsclLut8rWAaGX5TBTiSura2eGc7R8U4iDHnJfbk4zhad8QN
RZo+vDcIxGGeHzNeUmcEA4m0T/UQoNDPemGO7ZQJ2dXYWE1mt94=
=QaLz
-----END PGP SIGNATURE-----

--2usbb7ogdb3hwpt2--
