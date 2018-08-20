Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:37581 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbeHTNbz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 09:31:55 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [RFT 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Date: Mon, 20 Aug 2018 12:16:34 +0200
Message-Id: <1534760202-20114-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello renesas list,
   this series add supports for the HDMI and CVBS input to R-Car E3 R8A77990
Ebisu board.

It's an RFT, as I don't have an Ebisu to test with :(

The series adds supports for the following items:

- PFC: add VIN groups and functions
- R-Car VIN and R-Car CSI-2: add support for R8A77990
- R8A77990: Add I2C, VIN and CSI-2 nodes
- Ebisu: describe HDMI and CVBS inputs

Each patch, when relevant reports difference between the upported BSP patch
and the proposed one.

I know Laurent should receive an Ebisu sooner or later, maybe we can sync for
testing :)

Thanks
   j

PS: the list of upported patches will be sent separately.

Jacopo Mondi (5):
  media: dt-bindings: media: rcar-vin: Add R8A77990 support
  media: rcar-vin: Add support for R-Car R8A77990
  dt-bindings: media: rcar-csi2: Add R8A77990
  media: rcar-csi2: Add R8A77990 support
  arm64: dts: renesas: ebisu: Add HDMI and CVBS input

Koji Matsuoka (1):
  arm64: dts: r8a77990: Add VIN and CSI-2 device nodes

Takeshi Kihara (2):
  pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
  arm64: dts: r8a77990: Add I2C device nodes

 .../devicetree/bindings/media/rcar_vin.txt         |   1 +
 .../bindings/media/renesas,rcar-csi2.txt           |   1 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 ++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++
 drivers/media/platform/rcar-vin/rcar-core.c        |  20 +
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 504 +++++++++++++++++++++
 7 files changed, 823 insertions(+)

--
2.7.4
