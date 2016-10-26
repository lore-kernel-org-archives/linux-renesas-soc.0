Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35333 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932115AbcJZOOR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 10:14:17 -0400
Received: by mail-wm0-f68.google.com with SMTP id o81so3705980wma.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Oct 2016 07:14:16 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, horms@verge.net.au
Cc: geert@linux-m68k.org, magnus.damm@gmail.com, wsa@the-dreams.de,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH v2 0/5] r8a7796 I2C integration
Date: Wed, 26 Oct 2016 16:14:04 +0200
Message-Id: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
have also made sure it works with 64-bit memory enabled.

CU
Uli


Changes since v1:
- added sys-dmac2 entries to i2c0-2
- added Reviewed-bys
- dropped "i2c: rcar: add support for r8a7796 (R-Car M3-W)" (picked up)


Ulrich Hecht (5):
  clk: renesas: r8a7796: Add I2C clocks
  pinctrl: sh-pfc: r8a7796: add I2C pin support
  arm64: renesas: r8a7796: add I2C support
  arm64: renesas: r8a7796: Enable I2C DMA
  arm64: renesas: r8a7796: salvator-x: enable I2C

 arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts |  12 +++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           | 111 +++++++++++++++++++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   7 ++
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c               |  77 ++++++++++++++
 4 files changed, 207 insertions(+)

-- 
2.7.4
