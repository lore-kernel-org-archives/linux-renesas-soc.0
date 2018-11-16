Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:26870 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389222AbeKPRcW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 12:32:22 -0500
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
        wsa@the-dreams.de
Cc: Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 0/4] I2C0/3/5 pin control for H3 and M3-W
Date: Fri, 16 Nov 2018 15:20:47 +0800
Message-Id: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an up-port from the BSP. Unfortunately I could not test these
because none of those pins seem to be accessible on Salvator boards (not on
ULCB either, AFAICT), so the best thing I can say is that they don't seem to
break anything.

This revision incorporates the suggestions made by Geert; see below for
details.

CU
Uli


Changes since v1:
- factor out identical macros to sh_pfc.h, comment them
- sort pin groups
- adjust for common/automotive split in r8a7796


Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups and functions
  pinctrl: sh-pfc: r8a7795-es1: Add I2C{0,3,5} pins, groups and
    functions
  pinctrl: sh-pfc: r8a7796: Add I2C{0,3,5} pins, groups and functions

Ulrich Hecht (1):
  pinctrl: sh-pfc: Add physical pin multiplexing helper macros

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 97 ++++++++++++++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 95 ++++++++++++++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 98 +++++++++++++++++++++++++-------
 drivers/pinctrl/sh-pfc/sh_pfc.h          | 22 +++++++
 4 files changed, 248 insertions(+), 64 deletions(-)

-- 
2.7.4
