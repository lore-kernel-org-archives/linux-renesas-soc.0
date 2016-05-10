Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:57024 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751076AbcEJNyc (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 10 May 2016 09:54:32 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: driverdev-devel@linuxdriverproject.org
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/27] staging: add driver for KS7010 based SDIO cards
Date: Tue, 10 May 2016 15:52:13 +0200
Message-Id: <1462888360-21649-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This driver can be used with later Spectec SDW-821 and all SDW-823 cards.
See patch 1 and README for more details about its origin. To have the card
working, you need another patch which is already in mmc/next:

https://patchwork.kernel.org/patch/9043341/

A working topic branch for the Renesas H3 can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/gen3-sdio

This series only can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git staging/ks7010

Note: I needed this driver to verify SDIO capabilities for the new Renesas H3
SoC. The fact that the original KS7010 driver also comes from Renesas is a
coincidence. It does not mean official support for this driver. Parts of this
work were backed by the above mentioned SDIO verification task while other
parts were my personal interest. Future patches and reviews will also done by
me as a private person (unless something very surprising happens ;))

Please comment, review, apply...

Thanks,

   Wolfram

Wolfram Sang (27):
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

 drivers/staging/Kconfig                |    2 +
 drivers/staging/Makefile               |    1 +
 drivers/staging/ks7010/Kconfig         |   10 +
 drivers/staging/ks7010/Makefile        |    5 +
 drivers/staging/ks7010/README          |   37 +
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
 17 files changed, 9931 insertions(+)
 create mode 100644 drivers/staging/ks7010/Kconfig
 create mode 100644 drivers/staging/ks7010/Makefile
 create mode 100644 drivers/staging/ks7010/README
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
