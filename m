Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:41947 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750948AbcEaK5O (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 06:57:14 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 00/31] staging: add driver for KS7010 based SDIO WLAN cards
Date: Tue, 31 May 2016 12:56:12 +0200
Message-Id: <1464692203-4180-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This driver can be used with later Spectec SDW-821 and all SDW-823 cards. See
patch 1 and TODO for more details about its origin. The series can also be
found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git staging/ks7010

It worked out of the box with a Renesas Salvator-X (H3).

Note: I needed this driver to verify SDIO capabilities for the new Renesas H3
SoC. The fact that the original KS7010 driver also comes from Renesas is a
coincidence. It does not mean official support for this driver. Parts of this
work were backed by the above mentioned SDIO verification task while other
parts were my personal interest. Future patches and reviews will also done by
me as a private person (unless something very surprising happens ;))

Changes since V1:

* rebased to v4.7-rc1. That means the needed fix for the mmc-core
  (88ea46bcbfd677b779897bbada32ec0709a6c92f) and the netdev trans_start helper
  (ba162f8eed61a7e71e26455ce1cff5b5898a3579) are now both upstream.
* squashed the README->TODO rename into patch 1
* included the trans_start fixup which was sent seperately before
* last 3 patches are new, even more cleanups

Please comment, review, apply...

Thanks,

   Wolfram


Wolfram Sang (31):
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
  staging: ks7010: fix module annotations
  staging: ks7010: adapt to new trans_start handling
  staging: ks7010: simplify module_init/exit
  staging: ks7010: drop counting sd errors
  staging: ks7010: cleanup file headers

 drivers/staging/Kconfig                |    2 +
 drivers/staging/Makefile               |    1 +
 drivers/staging/ks7010/Kconfig         |   10 +
 drivers/staging/ks7010/Makefile        |    5 +
 drivers/staging/ks7010/TODO            |   37 +
 drivers/staging/ks7010/eap_packet.h    |  129 ++
 drivers/staging/ks7010/ks7010_config.c |  500 +++++
 drivers/staging/ks7010/ks7010_sdio.c   | 1234 +++++++++++
 drivers/staging/ks7010/ks7010_sdio.h   |  148 ++
 drivers/staging/ks7010/ks79xx.cfg      |  116 ++
 drivers/staging/ks7010/ks_hostif.c     | 2760 +++++++++++++++++++++++++
 drivers/staging/ks7010/ks_hostif.h     |  644 ++++++
 drivers/staging/ks7010/ks_wlan.h       |  503 +++++
 drivers/staging/ks7010/ks_wlan_ioctl.h |   67 +
 drivers/staging/ks7010/ks_wlan_net.c   | 3544 ++++++++++++++++++++++++++++++++
 drivers/staging/ks7010/michael_mic.c   |  139 ++
 drivers/staging/ks7010/michael_mic.h   |   26 +
 17 files changed, 9865 insertions(+)
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

-- 
2.8.1
