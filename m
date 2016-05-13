Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:53741 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752412AbcEMMaz (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 13 May 2016 08:30:55 -0400
Date: Fri, 13 May 2016 14:30:48 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PULL REQUEST] renesas/topic/gen3-sdio for renesas-drivers
Message-ID: <20160513123045.GA12309@katana>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert,

here is the SDIO topic branch for you. Please pull.

Kind regards,

   Wolfram

The following changes since commit 7c5c9675da24be9e0a4313c50de69338cf8c7577:

  Merge branch 'topic/salvator-x-hdmi-prototype-v1-rebased4' into renesas-drivers (2016-05-10 12:05:24 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gen3-sdio

for you to fetch changes up to 78f877498f4f8d3bf9b78c84ffc87b5936fa4c47:

  Merge branch 'staging/ks7010' into renesas/topic/gen3-sdio (2016-05-13 14:24:07 +0200)

----------------------------------------------------------------
Wolfram Sang (32):
      staging: ks7010: add driver from Nanonote extra-repository
      staging: ks7010: remove non-SDIO code and #ifdefs
      staging: ks7010: remove custom firmware loader
      staging: ks7010: remove checks for WIRELESS_EXT version
      staging: ks7010: remove code for old kernel versions
      staging: ks7010: avoid workqueue races
      staging: ks7010: use long preamble as default
      staging: ks7010: use kernel helper to print buffer
      staging: ks7010: delete seperate debug header
      staging: ks7010: really iterate over multicast addresses
      staging: ks7010: make loading config file optional
      staging: ks7010: fix printk format warnings
      staging: ks7010: add example cfg file as a reference
      staging: ks7010: remove unecessary typedef
      staging: ks7010: indent eap_packet.h
      staging: ks7010: indent ks7010_config.c
      staging: ks7010: indent ks7010_sdio.h
      staging: ks7010: indent ks_hostif.c
      staging: ks7010: indent ks_hostif.h
      staging: ks7010: indent ks_wlan.h
      staging: ks7010: indent ks_wlan_ioctl.h
      staging: ks7010: indent ks_wlan_net.c
      staging: ks7010: indent michael_mic.c
      staging: ks7010: indent michael_mic.h
      staging: ks7010: indent ks7010_sdio.c
      staging: ks7010: remove supported card table with one element
      mmc: sdio: fall back to SDIO 1.0 for broken 1.1 cards
      mmc: sh_mobile_sdhi: enable SDIO IRQs for RCar Gen3
      staging: ks7010: fix module annotations
      staging: ks7010: rename README to TODO
      staging: ks7010: adapt to new trans_start handling
      Merge branch 'staging/ks7010' into renesas/topic/gen3-sdio

 drivers/mmc/core/sdio_cis.c            |    7 +-
 drivers/mmc/host/sh_mobile_sdhi.c      |    2 +-
 drivers/staging/Kconfig                |    2 +
 drivers/staging/Makefile               |    1 +
 drivers/staging/ks7010/Kconfig         |   10 +
 drivers/staging/ks7010/Makefile        |    5 +
 drivers/staging/ks7010/TODO            |   37 +
 drivers/staging/ks7010/eap_packet.h    |  135 ++
 drivers/staging/ks7010/ks7010_config.c |  500 +++++
 drivers/staging/ks7010/ks7010_sdio.c   | 1267 ++++++++++++
 drivers/staging/ks7010/ks7010_sdio.h   |  152 ++
 drivers/staging/ks7010/ks79xx.cfg      |  116 ++
 drivers/staging/ks7010/ks_hostif.c     | 2763 +++++++++++++++++++++++++
 drivers/staging/ks7010/ks_hostif.h     |  647 ++++++
 drivers/staging/ks7010/ks_wlan.h       |  508 +++++
 drivers/staging/ks7010/ks_wlan_ioctl.h |   70 +
 drivers/staging/ks7010/ks_wlan_net.c   | 3547 ++++++++++++++++++++++++++++++++
 drivers/staging/ks7010/michael_mic.c   |  142 ++
 drivers/staging/ks7010/michael_mic.h   |   29 +
 19 files changed, 9938 insertions(+), 2 deletions(-)
 create mode 100644 drivers/staging/ks7010/Kconfig
 create mode 100644 drivers/staging/ks7010/Makefile
 create mode 100644 drivers/staging/ks7010/TODO
 create mode 100644 drivers/staging/ks7010/eap_packet.h
 create mode 100644 drivers/staging/ks7010/ks7010_config.c
 create mode 100644 drivers/staging/ks7010/ks7010_sdio.c
 create mode 100644 drivers/staging/ks7010/ks7010_sdio.h
 create mode 100644 drivers/staging/ks7010/ks79xx.cfg
 create mode 100644 drivers/staging/ks7010/ks_hostif.c
 create mode 100644 drivers/staging/ks7010/ks_hostif.h
 create mode 100644 drivers/staging/ks7010/ks_wlan.h
 create mode 100644 drivers/staging/ks7010/ks_wlan_ioctl.h
 create mode 100644 drivers/staging/ks7010/ks_wlan_net.c
 create mode 100644 drivers/staging/ks7010/michael_mic.c
 create mode 100644 drivers/staging/ks7010/michael_mic.h

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXNcj1AAoJEBQN5MwUoCm2CCQP/j/eEMSayCaeFpIQh6HQvh1D
cBE77C3i6QLEjcAVUbBwXbweSBQrPfp85MUsZzERL157sW1d8IYTCTYx67BOfOHC
rz1hYgusJLRB0u+FpTMwePefQjKv3NY17KLuEhU9dxkti49Bx8+PKq3WImZEZcvk
k78ePyCA50O/qds/tE/XxTlEyXplK0iFnHQEhdfmXJruBI6TNLLweB/2n32WniXL
yAQ6t7lj1FB2Jrt0epF1WjwVxOxdMR/SIznvJ5GRuOGgfv8x0qzDXvOaN9HCxJHy
HTjrxbBnZDmadbHqu4nV8sP1VPO2wsNGPSzRZp/X5KJB/cfQzI1Mmu69KXI+CnrG
Df0O7cGyIHDB5pb1pshZmko5dL04o2LFRZ078JgMh70itWus+QllNYKNAP00NbNK
NjP2rRsAHDwvAdUYnBEzXZkum4KVlTBiwAOFJ2lBrMHJ26x30hFbubg8Kh3yBebg
ZuJtbYrubi1yXJVYGTLntrHpdyfMUBxvxf9y4YzgD5PFuebQvXrvlo88N5APLNrl
RoAiJlSbecAAo8cIXrRNO3ebgCzlRN+N674UhPTXjhNIR0tXZLiUi7v8YkgDzAFt
DG83NGHHN6lhQvxUzP0pWDwt4Los0s08rJ53s883mzPjAfNyZB4Hy5B3PPSjHi7d
Kl+P8akCMZ3NGC34wdLE
=mQsL
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
