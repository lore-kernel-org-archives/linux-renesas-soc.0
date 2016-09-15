Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:21345 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753174AbcIOTfB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Sep 2016 15:35:01 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/4] r7s72100: dts: enable mmcif
Date: Thu, 15 Sep 2016 15:34:01 -0400
Message-Id: <20160915193405.26943-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series enables the mmc driver for the RZ/A1.
Nothing needed to be changed with the actual sh_mmcif driver.
It worked fine as-is.

As you can see, the status in the rskrza1 dst was left
as disabled because I wanted to leave that code in there
for refernce for someone later that actually has a board with
an actaul eMMC chip. I tested with an MMC Plus card.


Chris Brandt (4):
  ARM: dts: r7s72100: add mmcif clock to device tree
  ARM: dts: r7s72100: add mmcif to device tree
  mmc: sh_mmcif: Document r7s72100 DT bindings
  ARM: dts: rskrza1: add mmc DT support

 .../devicetree/bindings/mmc/renesas,mmcif.txt        |  1 +
 arch/arm/boot/dts/r7s72100-rskrza1.dts               | 17 +++++++++++++++++
 arch/arm/boot/dts/r7s72100.dtsi                      | 20 ++++++++++++++++++++
 include/dt-bindings/clock/r7s72100-clock.h           |  3 +++
 4 files changed, 41 insertions(+)

-- 
2.9.2
