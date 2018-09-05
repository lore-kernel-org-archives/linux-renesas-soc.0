Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:49973 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726497AbeIEUAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 16:00:40 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, damm+renesas@opensource.se,
        ulrich.hecht+renesas@gmail.com, linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFT v2 0/8] arm64: dts: renesas: Ebisu: Add HDMI and CVBS input
Date: Wed,  5 Sep 2018 17:29:37 +0200
Message-Id: <1536161385-25562-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello renesas list,
   this series add supports for the HDMI and CVBS input to R-Car E3 R8A77990
Ebisu board.

It's an RFT, as I don't have an Ebisu to test with :(

The series adds supports for the following items:

- PFC: add VIN groups and functions
- R-Car VIN and R-Car CSI-2: add support for R8A77990
- R8A77990: Add I2C, VIN and CSI-2 nodes (v1 re-sent by Laurent in D3 DU series)
- Ebisu: describe HDMI and CVBS inputs

Laurent has tested v1 and confirmed that the current mainline implementation
of the adv748x driver does not work in the configuration used by the Ebisu
board.

This series should then be applied on top of the just sent:
[PATCH v2 0/5] media: adv748x: Allow probe with a single output endpoint
To allow the adv7482 to probe with a single output port enabled.

This series, based on v4.19-rc2 with adv748x series on top, is available at:
git://jmondi.org/linux ebisu/linus-master/hdmi_cvbs_v2

Thanks
   j

Jacopo Mondi (6):
  media: dt-bindings: rcar-vin: Add R8A77990 support
  media: rcar-vin: Add support for R-Car R8A77990
  media: dt-bindings: rcar-csi2: Add R8A77990
  media: rcar-csi2: Add R8A77990 support
  pinctrl: sh-pfc: r8a77990: Add VIN pins, groups and functions
  arm64: dts: renesas: ebisu: Add HDMI and CVBS input

Koji Matsuoka (1):
  arm64: dts: r8a77990: Add VIN and CSI-2 device nodes

Takeshi Kihara (1):
  arm64: dts: r8a77990: Add I2C device nodes

 .../devicetree/bindings/media/rcar_vin.txt         |   1 +
 .../bindings/media/renesas,rcar-csi2.txt           |   1 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  86 +++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 202 +++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-core.c        |  20 ++
 drivers/media/platform/rcar-vin/rcar-csi2.c        |   9 +
 drivers/pinctrl/sh-pfc/pfc-r8a77990.c              | 250 +++++++++++++++++++++
 7 files changed, 569 insertions(+)

--
2.7.4
