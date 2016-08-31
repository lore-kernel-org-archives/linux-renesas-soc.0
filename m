Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43014 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755713AbcHaG64 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 02:58:56 -0400
Date: Wed, 31 Aug 2016 08:58:38 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/i2c_sdhi_maintenance for renesas drivers
Message-ID: <20160831065835.GA7452@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers. Most of the patches I did
for this i2c/sdhi maintenance task are already in renesas-drivers,
because they came back via linux-next. Only the last three are missing
currently, but they are on the way, too. So, this branch will soonish
become obsolete again. Yay!

Kind regards,

   Wolfram


The following changes since commit 3eab887a55424fc2c27553b7bfe32330df83f7b8:

  Linux 4.8-rc4 (2016-08-28 15:04:33 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/i2c_sdhi_maintenance

for you to fetch changes up to 91d6e42f0ba217c5d26d88648a18022f573d75de:

  ARM: shmobile: fix regulator quirk for Gen2 (2016-08-31 08:51:08 +0200)

----------------------------------------------------------------
Wolfram Sang (9):
      arm64: dts: r8a7795: set maximum frequency for SDHI clocks
      i2c: mux: demux-pinctrl: invalidate properly when switching fails
      i2c: sh_mobile: use proper device with dma_mapping_error
      i2c: rcar: use proper device with dma_mapping_error
      mmc: host: sh_mobile_sdhi: move card_busy from tmio to sdhi
      mmc: host: sh_mobile_sdhi: don't populate unneeded functions
      i2c: mux: demux-pinctrl: run properly with multiple instances
      Documentation: devicetree: changesets do locking on their own meanwhile
      ARM: shmobile: fix regulator quirk for Gen2

 Documentation/devicetree/changesets.txt            | 19 ++-----
 arch/arm/mach-shmobile/regulator-quirk-rcar-gen2.c | 62 +++++++++-------------
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  4 ++
 drivers/i2c/busses/i2c-rcar.c                      |  2 +-
 drivers/i2c/busses/i2c-sh_mobile.c                 |  2 +-
 drivers/i2c/muxes/i2c-demux-pinctrl.c              | 15 ++++--
 drivers/mmc/host/sh_mobile_sdhi.c                  | 16 +++++-
 drivers/mmc/host/tmio_mmc.h                        |  1 +
 drivers/mmc/host/tmio_mmc_pio.c                    |  9 +---
 9 files changed, 65 insertions(+), 65 deletions(-)

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXxoAbAAoJEBQN5MwUoCm2FYAQAKCcQNde5vf+GjSjh4FbC6Fv
D1cXxlKdlWhxPRTJEHg7+oaLQWF9osdwogqNJj+yXgfsgfplgWpfj+WGzSUt8FHg
HO+6ex8A2MGLIMbH0103dS0ssSoP3M+xJ9CSMxAvTk6xRHUXMRf2kGiRLhoT2SI6
if/b0svjCve3g+M3zbg2nYjnYtf3JJX9M5sjFS/JH4kpkhreiiOieFu9gMBt2Y40
Vy0LOso/0JsEuz1n+imQmVjiTQYqDfrMNZUiiBiDhhPmMX/ENgH8mpctS8b6jkZk
1gDLQBf1tnv7n4YQfWwf7kbSlOZezScf6iRzQAM7GOdQzRF4R/2h5a4b44R9UJbV
aX/H/Mt8oZswKcoOfFyz+8IJJ1Cltgs+yiKNMdn1OUij8/ZUF8gVcmoL437sSOVN
aoRGZNhFrup2IwzVEeo6Eze/R3zHKS56wA+RI5bJP6Yv+X5mSqG302oaYoTKCwj7
HGwAnqE/PjtnLXMQDIbflyN2/JaeCvNdxvknKY8A3hZN7i2eNrTvz8eblC3uYUnm
sZzGSIvu9RMH0vMwumLDd/2NDAzgeBvjY7bF+/aKTfS/AGZoX+Iv6M+dm+vlxoRk
wf1z/wq8uLt002dpVJIPxVMBVslTAtayU6EgltzoTud+kLfJQxyheBFemA9plOk0
78ioe/5ImZFuQp3NPx2k
=NEUw
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
