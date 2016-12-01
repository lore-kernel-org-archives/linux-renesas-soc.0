Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Archit Taneja <architt@codeaurora.org>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mark Yao <mark.yao@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ulrich Hecht <ulrich.hecht@gmail.com>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/22] R-Car Gen3 HDMI output support
Date: Fri,  2 Dec 2016 01:43:15 +0200
Message-Id: <1480635817-1258-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series implements support for the HDMI output on Renesas R-Car Gen3
SoCs, and more specifically on the R-Car H3.

R-Car Gen3 SoCs include one or multiple Synopsys DWC HDMI TX controllers. The
series thus starts with 13 cleanup or feature patches for the dw-hdmi driver.
Patches 01/22 to 05/22 are small miscellaneous cleanups. Patch 06/22 fixes a
crash when the HPD interrupt is generated before the bridge gets attached to a
DRM device.

Patch 07/22 then starts refactoring the API towards platform glue by moving
common I/O and clock resource allocation to common code. Patches 08/22 and
09/22 continue by moving connector creation to the bridge attach operation to
comply with the DRM bridge API. Patch 10/22 implements a new API for platform
glue to register the bridge with the DRM core, for platform that doesn't use
the component framework. Patches 11/22 to 13/22 finally abstract PHY setup to
allow platforms to implement configuration for custom PHYs.

The next three patches add glue code for the DWC HDMI on Renesas R-Car Gen3
platforms. Patch 14/22 rework the DWC HDMI DT bindings to make them more
modular, and patch 15/22 makes use of them to document the R-Car Gen DWC HDMI
TX DT bindings. Patch 16/22 then implements the platform glue code.

The next three patches implement support for the R8A7795 HDMI outputs in the
R-Car DU driver. Patch 17/22 fixes a bug that makes the driver defer probe
forever if an encoder is disabled. Patch 18/22 implement DPLL support to
generate more precise clocks required by the HDMI controller, and patch 19/22
then enables the two HDMI output on the R-Car H3 SoC.

The last three patches enable the HDMI outputs on the H3 Salvator-X board by
adding the HDMI encoders to the R-Car H3 DT (20/22), adding HDMI connectors
and enabling the encoders (21/22) and adding the external dot clocks (22/22).

The code has been tested on a Renesas Salvator-X H3 board, and modifications
to the dw-hdmi Freescale and Rockchip platform glues have been compile-tested.

More improvements to the dw-hdmi driver would be beneficial. The PHY
modularization is based on the limited understanding of the HDMI PHYs used on
the three supported platforms and will possibly be enhanced later when adding
support for more platforms. The DT bindings would also benefit from a
standardized definition of the ports, and the reg-io-width property could
possibly be deprecated in favour of encoding the information in platform glue
code. The patch series is however big enough as is to be submitted for review
and merge before the dw-hdmi driver achieves perfection.

Kieran Bingham (4):
  drm: bridge: dw-hdmi: Remove unused function parameter
  drm: bridge: dw-hdmi: Refactor hdmi_phy_configure resolution parameter
  drm: bridge: dw-hdmi: Abstract the platform PHY configuration
  drm: bridge: dw-hdmi: Replace device type with platform quirks

Koji Matsuoka (4):
  drm: rcar-du: Add Gen3 HDMI encoder support
  drm: rcar-du: Add DPLL support
  drm: rcar-du: Add HDMI outputs to R8A7795 device description
  arm64: dts: r8a7795: salvator-x: Enable HDMI outputs

Laurent Pinchart (13):
  drm: bridge: dw-hdmi: Merge __hdmi_phy_i2c_write and
    hdmi_phy_i2c_write
  drm: bridge: dw-hdmi: Remove unneeded arguments to bind/unbind
    functions
  drm: bridge: dw-hdmi: Embed drm_bridge in struct dw_hdmi
  drm: bridge: dw-hdmi: Remove encoder field from struct dw_hdmi
  drm: bridge: dw-hdmi: Don't forward HPD events to DRM core before
    attach
  drm: bridge: dw-hdmi: Move IRQ and IO resource allocation to common
    code
  drm: bridge: dw-hdmi: Reorder functions to prepare for next commit
  drm: bridge: dw-hdmi: Create connector in the bridge attach operation
  drm: bridge: dw-hdmi: Implement DRM bridge registration
  dt-bindings: display: dw-hdmi: Clean up DT bindings documentation
  dt-bindings: display: renesas: Add R-Car Gen3 HDMI TX DT bindings
  drm: rcar-du: Skip disabled outputs
  arm64: dts: r8a7795: salvator-x: Add DU1 and DU2 external dot clocks

Ulrich Hecht (1):
  arm64: dts: r8a7795: Add HDMI encoder support

 .../devicetree/bindings/display/bridge/dw_hdmi.txt |  85 ++---
 .../bindings/display/bridge/renesas,dw-hdmi.txt    |  75 +++++
 .../devicetree/bindings/display/imx/hdmi.txt       |  51 +--
 .../bindings/display/rockchip/dw_hdmi-rockchip.txt |  43 ++-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts |  73 +++++
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  50 +++
 drivers/gpu/drm/bridge/dw-hdmi.c                   | 364 ++++++++++++---------
 drivers/gpu/drm/bridge/dw-hdmi.h                   |   4 +-
 drivers/gpu/drm/imx/dw_hdmi-imx.c                  |  19 +-
 drivers/gpu/drm/rcar-du/Kconfig                    |   8 +
 drivers/gpu/drm/rcar-du/Makefile                   |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |  81 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  13 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |   7 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |  23 ++
 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c             | 105 ++++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        |  17 +-
 include/drm/bridge/dw_hdmi.h                       |  35 +-
 21 files changed, 765 insertions(+), 295 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

-- 
Regards,

Laurent Pinchart
