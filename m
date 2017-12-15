Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57047 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932168AbdLOPdV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 10:33:21 -0500
Date: Fri, 15 Dec 2017 16:33:19 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topc/ip-switch-rework-2017 for renesas drivers
Message-ID: <20171215153315.nxuujm4xeglmrvqo@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="j2mlvgueoedqg7gp"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--j2mlvgueoedqg7gp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

Here is the the topic branch to add the I2C IP core switcher to all
busses of Gen2 boards where some kind of switching is possible (mostly
to/from GPIO).

It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.

Please pull.

Kind regards,

   Wolfram


The following changes since commit ea648c135fcb40f864f0c898b94ecd39782d895c:

  Merge tag 'renesas-dt-fixes-for-v4.15' into renesas/topc/ip-switch-rework-2017 (2017-12-08 12:17:55 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topc/ip-switch-rework-2017

for you to fetch changes up to bec727d32dc69bdba3b4ea0b10a3b09461be6a9e:

  ARM: dts: gose: use demuxer for I2C4 (2017-12-08 14:54:43 +0100)

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

--j2mlvgueoedqg7gp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAloz6zYACgkQFA3kzBSg
KbaGww//Z0KpADRUuSdJ4cVe+DeUxiZu56Ea9GONwxxr56a/gd4LrItCi4tUzRKS
f+qP/dul8aPdJHlXkdDgRwY0iSug79Ezd53aKIPkIQ3rCIcBd62IWhdVZ++3ljXw
ZVVI12DnduS/rfUOrzHjJUq26m35muimfDyrJJOv3mHmSIykSAKZMx2EPRQzSH9n
FSRZL8x/ear1qiSzcLVNoPtF5DosbXpPR/PdmP2eDDpLTCOMlv38LtP2XKLwnt0+
bddZUn1p91cryawAfq6BJhncJuS1FF0QumJ+2k1e4Ii2TkEFzr20ykR9vbS4KjpL
YwriuAj0VEwJ+oDjEusJKTeV4FpcaPNSB1y7BLoc5jYE6upxonD8Duk5BIpPCUDO
oy+SCUMijX1KwJiWqz+JQ9QTbfSPU7GqkO+k1GpN+5eQq6alyn6zaKDTlV4nXaIx
OEPMSPNQngetx7OMDUHcKAu05NTk3xM9yTItUjwsxC6fiigxe8jiPzcBHaEChVeX
KxakFugQJoqmmf00ghik7Tp3kUlyW+h97fzkH6o8gs3nK47PuYB1ZQnVncWC6/98
WQw1DDSmfMbE0hVN4NBucYIGM5ZLW7vJ2nptSPYvbUspsNUSX5jf714UtKRzSFiL
ENVHWitUJZFEVFO4L+lG6YENfDvH4RSz9tvD3J5leBak/kDW5mM=
=pq0P
-----END PGP SIGNATURE-----

--j2mlvgueoedqg7gp--
