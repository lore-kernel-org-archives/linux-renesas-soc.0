Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:58038 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754553AbeDZQxw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 12:53:52 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATCH 00/17] r8a77965: M3-N DU Enablement
Date: Thu, 26 Apr 2018 17:53:29 +0100
Message-Id: <20180426165346.494-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series enables the DU for the M3-N R8A77965 SoC, and provides
output on the VGA and HDMI connectors.

LVDS is not yet supported or tested.

Patch 13 has the following checkpatch.pl warnings of which I have
ignored:

================================================================================
WARNING: DT compatible string "renesas,r8a77965-hdmi" appears un-documented --
check ./Documentation/devicetree/bindings/

#27: FILE: arch/arm64/boot/dts/renesas/r8a77965.dtsi:1109:
+                       compatible = "renesas,r8a77965-hdmi",

WARNING: line over 80 characters
#44: FILE: arch/arm64/boot/dts/renesas/r8a77965.dtsi:1126:
+                                               remote-endpoint = <&du_out_hdmi0>;

WARNING: line over 80 characters
#60: FILE: arch/arm64/boot/dts/renesas/r8a77965.dtsi:1164:
+                                               remote-endpoint = <&dw_hdmi0_in>;

total: 0 errors, 3 warnings, 40 lines checked
================================================================================

I don't think the remote endpoints can be shorter unless the <&phandles>
are on a line on their own and that seems silly.

I have not made any changes to the HDMI binding documentation as we will
match on the generic case, and I do not believe I am allowed to modify
files related to the HDMI driver.


Kieran Bingham (13):
  dt-bindings: display: renesas: du: Increase indent in output table
  dt-bindings: display: renesas: du: Document the R8A77965 bindings
  pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and
    functions
  drm: rcar-du: Use the correct naming for ODPM fields in DEFR6
  drm: rcar-du: Split CRTC handling to support hardware indexing
  drm: rcar-du: Allow DU groups to work with hardware indexing
  drm: rcar-du: Add R8A77965 support
  arm64: dts: r8a77965: Provide sysc header definitions
  arm64: dts: r8a77965: Use the correct CPG header
  arm64: dts: r8a77965: Add FCPF and FCPV instances
  arm64: dts: r8a77965: Add VSP instances
  arm64: dts: r8a77965: Populate the DU instance placeholder
  arm64: dts: r8a77965: Add HDMI encoder instance

Takeshi Kihara (4):
  arm64: dts: r8a77965-salvator-x: Add DU external dot clocks
  arm64: dts: r8a77965-salvator-x: Enable HDMI output
  arm64: dts: r8a77965-salvator-xs: Add DU external dot clocks
  arm64: dts: r8a77965-salvator-xs: Enable HDMI output

 .../bindings/display/renesas,du.txt           |  28 ++--
 .../boot/dts/renesas/r8a77965-salvator-x.dts  |  29 ++++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |  29 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 129 +++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  26 ++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  49 +++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |  16 ++-
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  22 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h        |  16 +--
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c         | 116 ++++++++++++++++
 13 files changed, 409 insertions(+), 60 deletions(-)

-- 
2.17.0
