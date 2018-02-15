Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:52014 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S967889AbeBOMBk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 07:01:40 -0500
Received: by mail-wm0-f65.google.com with SMTP id r71so366941wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2018 04:01:39 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/4] r8a779{5,6,95} VIN and DU pin control tables
Date: Thu, 15 Feb 2018 13:01:27 +0100
Message-Id: <1518696091-23561-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This series adds pin control tables for VIN4 (H3, M3-W, D3), VIN5 (H3, M3-W)
and DU (D3).

The patches for M3-W and H3 are identical, so there is no need to review
both of them in detail.

[The last patch overlaps with a concurrently developed PFC patch for DU on
D3 ("[PATCH 1/8] pinctrl: sh-pfc: r8a77995: Add DU support") posted earlier
today by kbingham in his "[PATCH 0/8] r8a77995 D3 DU and LVDS support"
series.]

CU
Uli


Ulrich Hecht (4):
  pinctrl: sh-pfc: r8a7796: Add VIN4, VIN5 pins, groups and functions
  pinctrl: sh-pfc: r8a7795: Add VIN4, VIN5 pins, groups and functions
  pinctrl: sh-pfc: r8a77995: Add VIN4 pins, groups and function
  pinctrl: sh-pfc: r8a77995: Add DU pins, groups and function

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  | 454 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 454 ++++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 293 ++++++++++++++++++++++
 3 files changed, 1201 insertions(+)

-- 
2.7.4
