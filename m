Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:13114 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727722AbeKHDIS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 22:08:18 -0500
From: Chris Brandt <chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 0/3] usb: renesas: rcar-gen3-usb2: Add support for RZ/A2
Date: Wed,  7 Nov 2018 12:35:55 -0500
Message-Id: <20181107173558.54481-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for RZ/A2. Basically has the same IP as R-Car Gen3.


Chris Brandt (3):
  clk: renesas: r7s9210: Add USB clocks
  phy: renesas: rcar-gen3-usb2: Add support for R7S9210
  dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support

 Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++----
 drivers/clk/renesas/r7s9210-cpg-mssr.c                       |  2 ++
 drivers/phy/renesas/Kconfig                                  |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c                     | 12 ++++++++++++
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.16.1
