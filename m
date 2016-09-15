Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:47925 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755153AbcIOFtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 01:49:05 -0400
Date: Thu, 15 Sep 2016 07:48:45 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/sdhi-8bit-emmc for renesas drivers
Message-ID: <20160915054839.GA2272@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers. This branch is based on
Simon's topic/sdr104-v7 branch which I needed for M3 SDHI enablement.
Please pull.

Kind regards,

   Wolfram


The following changes since commit 6d1414d3fd219406b067af28bb96316626edefe4:

  gpio: rcar: Add r8a7796 (R-Car M3-W) support (2016-09-13 11:59:47 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/sdhi-8bit-emmc

for you to fetch changes up to 9eaf0e179ad52ee2f5f14cb9f51864f9d691c8e7:

  arm64: dts: r8a7796: salvator: enable on board eMMC (2016-09-14 18:16:06 +0200)

----------------------------------------------------------------
Wolfram Sang (7):
      hotfix for sdr104-v7
      mmc: add define for R1 response without CRC
      mmc: rtsx_pci: use new macro for R1 without CRC
      mmc: rtsx_usb: use new macro for R1 without CRC
      mmc: tmio: add eMMC support
      arm64: dts: r8a7795: salvator: enable on-board eMMC
      arm64: dts: r8a7796: salvator: enable on board eMMC

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 43 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 44 +++++++++++++++++++++-
 drivers/mmc/host/rtsx_pci_sdmmc.c                  |  2 +-
 drivers/mmc/host/rtsx_usb_sdmmc.c                  |  2 +-
 drivers/mmc/host/sh_mobile_sdhi.c                  |  2 +-
 drivers/mmc/host/tmio_mmc.h                        |  3 ++
 drivers/mmc/host/tmio_mmc_pio.c                    | 29 ++++++++------
 include/linux/mmc/core.h                           |  3 ++
 8 files changed, 112 insertions(+), 16 deletions(-)

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX2jY3AAoJEBQN5MwUoCm2+0wP/jRdOeJyFO9ZMQMw3jiRXM8G
+vZVMFZlyLCbp1ifv+A85aeIKHaBPTZvHJpNxm8ZtsRCOq8SmDHp5qU/7BBYpYzE
OsClBgFczcjoadzboU4jQ1XoMZE43HvzJgyE71HDMd8Ts5Oh3NQmr70U3Yyjnaj3
/ScMHfdYudrZSnu1daVrCBLNieRvVhNk1paP4HdRfvgPV27h7rHqAeKBKSY3ZR6V
B6hf1iRZkF9fdpgMCa5LEsO+kULx6guyMQkkspxhSP3jWKXLoV6+6vnSZOGlXRbd
bLpov7G6iFweKkCmKyvDSzpW45+2Rh2CxY0sI/4C5mLsme8P4iYTfP4Q++CYvagI
U+RNcug10T7obIqP7ldyO2b76QkVth+C1QHDa3uiI44gwtrpnBdoA/+gqh1rHDpc
lMUBIbEcjaMfOnm7Bfd7aD4TBktcKk0vnGmIeXzUzFMFipwTR7wC02LH4yhOLoyQ
Q5qBlPL7cvEWp1CowSXmHx1N68ZBrFu6JNv1bDnRDxMWLC+i9v+OEuyb/1w6ICC3
5DPcvbOoJaHVMr+YYz3W0dU9m3ukjkGMMAdiPjigYCqjj82scvviidiM0GzXWD/q
2U9ztbHPs/eLUjIoUq/AhQUwrkDLwMVu6JY3Ltg2sLnM59zc8P3Eu+DQPdH4fLe7
TGCqaE4Qntugxgvni5bl
=vivs
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
