Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:57143 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932247AbdLOQCE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Dec 2017 11:02:04 -0500
Date: Fri, 15 Dec 2017 17:02:03 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PULL REQUEST] renesas/topic/rcar-i2c-recovery for renesas drivers
Message-ID: <20171215160159.xonlansqqvevyeze@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zfl75qzmnm4gfa2a"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--zfl75qzmnm4gfa2a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is a topic branch for renesas-drivers which enables I2C bus
recovery on i2c-rcar IP cores.

It is based on i2c/for-next + renesas/dt-for-v4.16 +
renesas/topc/ip-switch-rework-2017.

Please pull.

Kind regards,

   Wolfram


The following changes since commit 62127db8d012c586fdd45d1768261aaa3938c8b7:

  Merge branch 'renesas/topc/ip-switch-rework-2017' into renesas/topic/rcar-i2c-recovery (2017-12-15 16:43:40 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/rcar-i2c-recovery

for you to fetch changes up to e5bb5ef5f51d223dfcd188c803e746d445320b92:

  i2c: rcar: implement bus recovery (2017-12-15 16:45:43 +0100)

----------------------------------------------------------------
Wolfram Sang (7):
      i2c: algo-bit: init the bus to a known state
      i2c: make kerneldoc about bus recovery more precise
      i2c: add identifier in declarations for i2c_bus_recovery
      i2c: add 'set_sda' to bus_recovery_info
      i2c: ensure SDA is released in recovery if SDA is controllable
      i2c: send STOP after successful bus recovery
      i2c: rcar: implement bus recovery

 drivers/i2c/algos/i2c-algo-bit.c |  5 ++++
 drivers/i2c/busses/i2c-rcar.c    | 54 ++++++++++++++++++++++++++++++++++++++--
 drivers/i2c/i2c-core-base.c      | 25 ++++++++++++++++++-
 include/linux/i2c.h              | 20 +++++++++------
 4 files changed, 93 insertions(+), 11 deletions(-)

--zfl75qzmnm4gfa2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAloz8fcACgkQFA3kzBSg
Kbasdw/7BxTWECXIYRknOa2VbSkCYfYUHyXhts3N89i94UpYGV1t+a8G6/mRFxy5
O+Ei31mIq1XJT7V0+zL+HTeTyMq6CwzssmMMh9xSTAxHOWuwXjTlMw7PnfZA0Jzf
us8Uu4Uw3KyxMKRBIHp8WCgx+OnjDr7ilqnL6e8VAL5VsV9M5CIfVMj33rR9eDtc
INc71ypuCCRyIxiWHpU02AcVhh4CHKlAbNRTob6BPmpav/um/lwL7eTRhfZljllx
KZ9CP2z+qK3ptyrBu4iiYd6ZEPPK5ry7xLxNI6qkubFB6J02VUwPS/y2ArxECV5s
SnFWnPTeGbQNpVY3HoEjoYDTwEavQmEdxlx2OqNz0ioDIyqKpVu+eCQbQRnv+eUI
nDE93aOVkW2KvsXnhaq5GDvR5rR0+SxFtEhhlfPG6OdaifdcDjM2dbCR8DmYR8oP
Shbwijw7DeSJy0g7pfRdtou3lYzDJtkrATBaY5dmGmAXHTCStRCzTQ8xJXEwJgqe
wLr2C+p/ujUlTQAwF5yrOpotwrwli0u0Pik5CQx/73bIk78xEnRzfPX2AEV1E1iH
JREGr7Ogr+cqAVNyM0WZjto+f6SYBSfJgaHbZiMHg09g7+7qlHQ7UbfGk1CdfdOk
mUIXJ0af4KWM5hNCxx/P5ogno4q+lOxn6ErUB2LznlQXfdQqk+w=
=VyKJ
-----END PGP SIGNATURE-----

--zfl75qzmnm4gfa2a--
