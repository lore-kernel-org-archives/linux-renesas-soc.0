Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34026 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761896AbcINQr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:47:27 -0400
Received: by mail-wm0-f66.google.com with SMTP id g141so3382756wmd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:47:21 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/4] r8a7796 HSCIF integration
Date: Wed, 14 Sep 2016 18:47:12 +0200
Message-Id: <20160914164716.31512-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This enables all HSCIFs on r8a7796.

Based on renesas-drivers-2016-09-13-v4.8-rc6. The last patch enables DMA and
depends on the "r8a7796 SYS-DMAC integration" series posted earlier.

CU
Uli


Ulrich Hecht (4):
  clk: shmobile: r8a7796: Add HSCIF clocks
  pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups, and functions
  arm64: renesas: r8a7796 dtsi: Add all HSCIF nodes
  arm64: renesas: r8a7796: Enable HSCIF DMA

 arch/arm64/boot/dts/renesas/r8a7796.dtsi |  80 ++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c   |   5 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c     | 255 +++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)

-- 
2.9.3
