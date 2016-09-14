Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35265 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1760356AbcINQp7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:45:59 -0400
Received: by mail-wm0-f65.google.com with SMTP id 133so1329165wmq.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:45:58 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] r8a7796 SYS-DMAC integration
Date: Wed, 14 Sep 2016 18:45:46 +0200
Message-Id: <20160914164549.31121-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This enables the three DMA controllers. Identical to the setup on r8a7795.
Based on renesas-drivers-2016-09-13-v4.8-rc6.

CU
Uli


Ulrich Hecht (3):
  clk: renesas: r8a7796: Add SYS-DMAC clocks
  arm64: renesas: r8a7796: add SYS-DMAC controller nodes
  dmaengine: rcar-dmac: Document R-Car M3-W bindings

 .../devicetree/bindings/dma/renesas,rcar-dmac.txt  |  1 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 99 ++++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  3 +
 3 files changed, 103 insertions(+)

-- 
2.9.3
