Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33801 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034273AbeBPO0Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 09:26:16 -0500
Received: by mail-wr0-f194.google.com with SMTP id m5so3107363wrg.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 06:26:15 -0800 (PST)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] pinctrl: sh-pfc: add TMU pins
Date: Fri, 16 Feb 2018 15:26:08 +0100
Message-Id: <1518791171-14162-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

Straight from the BSP, TMU pins for r8a7795{,-es1} and r8a7796. Magic
numbers verified according to "pinfunction" document revisions 0.54 (M3-W)
and 0.553 (H3).

CU
Uli


Takeshi Kihara (3):
  pinctrl: sh-pfc: r8a7795: Add TMU pins, groups and functions
  pinctrl: sh-pfc: r8a7795-es1: Add TMU pins, groups and functions
  pinctrl: sh-pfc: r8a7796: Add TMU pins, groups and functions

 drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c | 42 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c     | 42 ++++++++++++++++++++++++++++++++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 42 ++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

-- 
2.7.4
