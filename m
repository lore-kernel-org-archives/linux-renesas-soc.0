Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:32831 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761904AbcINQqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 12:46:16 -0400
Received: by mail-wm0-f65.google.com with SMTP id b187so3352438wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 09:46:16 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: horms@verge.net.au, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/6] r8a7796 I2C integration
Date: Wed, 14 Sep 2016 18:46:05 +0200
Message-Id: <20160914164611.31237-1-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This enables the I2C controllers on r8a7796. The only difference to r8a7795
is the clock for channels three to six (S0D6 instead of S3D2).

Based on renesas-drivers-2016-09-13-v4.8-rc6. The DMA enablement depends on
the "r8a7796 SYS-DMAC integration" series posted earlier.

CU
Uli


Ulrich Hecht (6):
  i2c: rcar: add support for r8a7796 (R-Car M3-W)
  clk: renesas: r8a7796: Add I2C clocks
  pinctrl: sh-pfc: r8a7796: add I2C pin support
  arm64: renesas: r8a7796: add I2C support
  arm64: renesas: r8a7796: Enable I2C DMA
  arm64: renesas: r8a7796: salvator-x: enable I2C

 Documentation/devicetree/bindings/i2c/i2c-rcar.txt |   1 +
 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  12 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 108 +++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   7 ++
 drivers/i2c/busses/i2c-rcar.c                      |   1 +
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  77 +++++++++++++++
 6 files changed, 206 insertions(+)

-- 
2.9.3
