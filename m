Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36854 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751168AbcINQqx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:53 -0400
Received: by mail-wm0-f65.google.com with SMTP id b184so3388170wma.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:52 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: magnus.damm@gmail.com, horms@verge.net.au,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] r8a7796 SCIF integration
Date: Wed, 14 Sep 2016 18:46:45 +0200
Message-Id: <20160914164648.31403-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This enables SCIFs 0, 1, 3, 4, and 5.

Based on renesas-drivers-2016-09-13-v4.8-rc6. The last patch enables DMA for
all SCIFs and depends on the "r8a7796 SYS-DMAC integration" series posted
earlier.

CU
Uli


Ulrich Hecht (3):
  clk: shmobile: r8a7796: Add SCIF clocks
  arm64: renesas: r8a7796: Add all SCIF nodes
  arm64: renesas: r8a7796: Enable SCIF DMA

 arch/arm64/boot/dts/renesas/r8a7796.dtsi | 77 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c   |  5 +++
 2 files changed, 82 insertions(+)

-- 
2.9.3
