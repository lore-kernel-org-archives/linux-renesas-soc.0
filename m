Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:39625 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034154AbeBPOZO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:25:14 -0500
Received: by mail-wm0-f66.google.com with SMTP id b21so3434230wme.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:25:14 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] pinctrl: sh-pfc: r8a7795,6: Fix pin assignment definitions
Date: Fri, 16 Feb 2018 15:25:01 +0100
Message-Id: <1518791104-13928-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This series contains fixes to the PFC register definitions for r8a7795 and
r8a7796 from the BSP that are not upstream yet.
As far as I could tell, these changes check out with the Gen3 datasheet
revision 0.80.

CU
Uli


Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Fix MOD_SEL register pin assignment for SSI
    pins group
  pinctrl: sh-pfc: r8a7796: Fix MOD_SEL register pin assignment for SSI
    pins group
  pinctrl: sh-pfc: r8a7796: Fix IPSR and MOD_SEL register pin assignment
    for NDFC pins group

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 40 ++++++++++++-------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 58 +++++++++++++++++++-----------------
 2 files changed, 51 insertions(+), 47 deletions(-)

-- 
2.7.4
