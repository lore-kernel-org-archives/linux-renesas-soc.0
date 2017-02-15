Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www.zeus03.de ([194.117.254.33]:45672 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751338AbdBOWVa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 17:21:30 -0500
Date: Wed, 15 Feb 2017 23:21:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-dma-sync for renesas drivers
Message-ID: <20170215222121.GA3243@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

in case, we decide to include this patch despite not being tested for
the original SDIO case, here is a formal pull request.

Kind regards,

   Wolfram


The following changes since commit 391a542fe891d6dac49fa7fc2422651e54af1d42:

  mmc: Adding AUTO_BKOPS_EN bit set for Auto BKOPS support (2017-02-13 13:21:08 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-dma-sync

for you to fetch changes up to 2ea4d49db87684a27026922b73119d9b69c46074:

  mmc: host: tmio: ensure end of DMA and SD access are in sync (2017-02-15 23:17:55 +0100)

----------------------------------------------------------------
Wolfram Sang (1):
      mmc: host: tmio: ensure end of DMA and SD access are in sync

 drivers/mmc/host/tmio_mmc.h     |  2 +-
 drivers/mmc/host/tmio_mmc_dma.c | 70 +++++++++++++++++++++++++++--------------
 drivers/mmc/host/tmio_mmc_pio.c |  4 +--
 3 files changed, 49 insertions(+), 27 deletions(-)

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYpNRhAAoJEBQN5MwUoCm28R0P/0nMT1JHoNVBoSqwBAnqxE4X
t/wz27C6DfDMcLqhAkaFWan5bHq8kFygNrf8YcBcpdHGR7Rpfh4zm1P9LnYCCObQ
nEy6tzcN1nK8X6THwlLgPwWD35gk7HBUkXE+ZMhIR1pI3MEMkr4e16+Ob9zGjb/c
zuDqhBeo4hDSHNdsdtqcrMFdozHNIimkIToNP87g2diAi2VGaNKu4Df6DzlTrC3P
9qmGORyM0jTW2bZ+Rs0vF3O9JzUk2Ah+cVi2aWTklwejZ2p0e3xviYNuUlYVfGZH
YH64MgGtotjE9rQ+eBSJ6ByxTy9aeWx4gg0zuyMuV99cAEQ0eeqEh5ARS7JNeSZa
d0SB3IzzpOFw2zB13dLHAPxK7l3/jWaMT94gPYlsAaNGgJDsgiULf6vJHpFyBVUH
A3RQIHiW+un98iidHFS04YKS2eViDn7HbuMvqGDOwAdXZ8dvQlsaXTiFGfUxZQzP
2u8cvsPE9VLdMZzUxn54fsY+pe++NntZGhx9l9M5YDDX0ouPOS9unXZB2iP73fSn
vxF/MddZpZvRwDVZ2szrwhuyqvKxAm7eLWh5VyCpEtRuxZgYsVgZ2oeJwuaNcp8F
QPjtAq/FVWuXiPKfeAEw/eJhry/AQZhDWL8KMWzfnApVzDhLBR5AVpnQLkmyS0Te
HFBP09Ix1IBX8xbOYZ9J
=xcih
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
