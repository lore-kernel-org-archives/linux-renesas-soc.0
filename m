Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:56486 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750866AbdAQUAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2017 15:00:16 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v2 0/3] mmc: sh_mobile_sdhi: fix missing r7s72100 clocks
Date: Tue, 17 Jan 2017 14:59:37 -0500
Message-Id: <20170117195940.25092-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

At first this started out as a simple typo fix, until I realized
that the SDHI in the RZ/A1 has 2 clocks per channel and both need
to be turned on/off.

This patch series adds the ability to specify 2 clocks instead of
just 1, and does so for the RZ/A1 r7s72100.

This patch has been tested on an RZ/A1 RSK board. Card detect works
fine as well as bind/unbind.



Chris Brandt (3):
  mmc: sh_mobile_sdhi: add support for 2 clocks
  mmc: sh_mobile_sdhi: explain clock bindings
  ARM: dts: r7s72100: update sdhi clock bindings

 Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 21 +++++++++++++++++++++
 arch/arm/boot/dts/r7s72100.dtsi                    | 17 ++++++++++++-----
 drivers/mmc/host/sh_mobile_sdhi.c                  | 11 +++++++++++
 include/dt-bindings/clock/r7s72100-clock.h         |  6 ++++--
 4 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.10.1
