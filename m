Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25]:13468 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbeHQQWX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 12:22:23 -0400
From: Ulrich Hecht <uli+renesas@fpond.eu>
To: linux-renesas-soc@vger.kernel.org
Cc: horms@verge.net.au, wsa@the-dreams.de,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 0/3] I2C0/3/5 pin control for H3 and M3-W
Date: Fri, 17 Aug 2018 15:18:38 +0200
Message-Id: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This is an up-port from the BSP. Unfortunately I could not test these
because none of those pins seem to be accessible on Salvator boards (not on
ULCB either, AFAICT), so the best thing I can say is that they don't seem to
break anything.

CU
Uli


Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Add I2C{0,3,5} pins, groups and functions
  pinctrl: sh-pfc: r8a7795-es1: Add I2C{0,3,5} pins, groups and
    functions
  pinctrl: sh-pfc: r8a7796: Add I2C{0,3,5} pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 103 ++++++++++++++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 101 +++++++++++++++++++++++-------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 100 ++++++++++++++++++++++++------
 3 files changed, 242 insertions(+), 62 deletions(-)

-- 
2.7.4
