Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53166 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758554AbeD0Q50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 12:57:26 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] r8a77965: M3-N DU Enablement
Date: Fri, 27 Apr 2018 17:57:11 +0100
Message-Id: <20180427165722.19445-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This series enables the DU for the M3-N R8A77965 SoC, and provides
output on the VGA and HDMI connectors.

LVDS is not yet supported or tested.


Patch 9 has the following checkpatch.pl warnings of which I have
ignored:

===========================================================================
WARNING: line over 80 characters
#44: FILE: arch/arm64/boot/dts/renesas/r8a77965.dtsi:1126:
+                                               remote-endpoint = <&du_out_hdmi0>;

WARNING: line over 80 characters
#60: FILE: arch/arm64/boot/dts/renesas/r8a77965.dtsi:1164:
+                                               remote-endpoint = <&dw_hdmi0_in>;
===========================================================================

I don't think the remote endpoints can be shorter unless the <&phandles>
are on a line on their own and that seems silly.

This series is available via git at the following URL:
 git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
 du/m3n/enablement/v2

Kieran Bingham (11):
  dt-bindings: display: renesas: Add R-Car M3-N HDMI TX DT bindings
  pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and
    functions
  drm: rcar-du: Split CRTC handling to support hardware indexing
  drm: rcar-du: Allow DU groups to work with hardware indexing
  drm: rcar-du: Add R8A77965 support
  arm64: dts: r8a77965: Add FCPF and FCPV instances
  arm64: dts: r8a77965: Add VSP instances
  arm64: dts: r8a77965: Populate the DU instance placeholder
  arm64: dts: r8a77965: Add HDMI encoder instance
  arm64: dts: r8a77965-salvator-x: Enable DU external clocks and HDMI
  arm64: dts: r8a77965-salvator-xs: Enable DU external clocks and HDMI

 .../display/bridge/renesas,dw-hdmi.txt        |   1 +
 .../boot/dts/renesas/r8a77965-salvator-x.dts  |  28 ++++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts |  29 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi     | 131 +++++++++++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  26 ++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  51 +++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |  14 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  23 ++-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c         | 116 ++++++++++++++++
 12 files changed, 387 insertions(+), 41 deletions(-)

-- 
2.17.0
