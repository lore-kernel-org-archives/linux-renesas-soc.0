Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:39725 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034268AbeBPOZr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:25:47 -0500
Received: by mail-wm0-f66.google.com with SMTP id b21so3437005wme.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:25:46 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] pinctrl: sh-pfc: add HDMI pins
Date: Fri, 16 Feb 2018 15:25:39 +0100
Message-Id: <1518791142-14054-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

Straight from the BSP, HDMI pins for r8a7795{,-es1} and r8a7796. Magic
numbers verified according to "pinfunction" document revisions 0.54 (M3-W)
and 0.553 (H3).

CU
Uli


Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Add HDMI pins, groups and functions
  pinctrl: sh-pfc: r8a7795-es1: Add HDMI pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Add HDMI pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 30 +++++++++++++++++++++++++++++-
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 28 ++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 15 +++++++++++++++
 3 files changed, 72 insertions(+), 1 deletion(-)

-- 
2.7.4
