Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:59386 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeINOYN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 10:24:13 -0400
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, Ulrich Hecht <uli@fpond.eu>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH v2 00/16] R-Car D3/E3 display support (with LVDS PLL)
Date: Fri, 14 Sep 2018 12:10:30 +0300
Message-Id: <20180914091046.483-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello everybody,

This patch series adds display support for the D3 and E3 SoCs, and in
particular the Draak and Ebisu boards.

The code is based on Ulrich's "[PROTO][PATCH 00/10] R-Car D3 LVDS/HDMI support
(with PLL)" series previously posted to the dri-devel and linux-renesas-soc
mailing lists. It has been extensively reworked and partly rewritten, and
support for E3 and Ebisu has been added.

The DU in the D3 and E3 SoCs has no internal PLL. In order to achieve precise
pixel clock rates (required, among other use cases, for HDMI operation), the
PLL from the internal LVDS encoder must be programmed and its output clock
routed back to the DU.

The series starts with update to the DU and LVDS encoder DT bindings to add E3
(R8A77990) support (patches 01/16 and 02/16) and new clock sources for the
LVDS encoder (patch 03/16).

The next patch (04/16) adds a .mode_valid() operation to the thc63lvd1024
driver, to reject modes outside of the LVDS decoder's pixel clock operating
range (8 MHz to 135 MHz). The patch can be merged on its own separately from
this series.

Patch (05/16) adds support for D3 and E3 to the LVDS encoder driver. Compared
to the already supported SoCs, D3 and E3 use a different initialization
sequence and have a different PLL architecture, with more options for the
input clock.

The next five patches (06/16 to 10/16) perform small reworks or add support
for miscellaneous missing features and limitations of the DU, to be followed
by patch 11/16 that adds support for the D3 and E3 to the DU driver.

Finally patches 12/16 to 16/16 enable display for the D3 and E3 boards in DT.
Patch 12/16 adds support for the I2C controllers in the E3 DT, and will likely
be merged separately from this series. Patch 13/16 adds all the display IP
cores (FCP, VSP, DU and LVDS encoders) to the E3 DT, while patch 14/16 adds
(and wires up) the missing LVDS encoders to the D3 DT. Patches 15/16 and 16/16
then enable display output for the Ebisu and Draak boards respectively.

I believe the patch series to be ready for upstreaming (after fixing the
issues found during review of course). There is no big hack in the code, and I
haven't noticed any regression. A few issues are still unsolved, such as how
to disable display outputs independently on D3 and E3, and usage of the LVDS
PLL for the RGB output, but those are not regressions and shouldn't in my
opinion be considered as show stoppers.

The patches are available from

        git://linuxtv.org/pinchartl/media.git drm/du/lvds-pll

with an additional patch for E3 pinctrl that is required for testing and has
been queued by Geert for v4.20 already.

Please see individual patches for changelogs since v1.

Kieran Bingham (1):
  arm64: dts: renesas: r8a77995: Add LVDS support

Laurent Pinchart (12):
  dt-bindings: display: renesas: du: Document r8a77990 bindings
  dt-bindings: display: renesas: lvds: Document r8a77990 bindings
  dt-bindings: display: renesas: lvds: Add EXTAL and DU_DOTCLKIN clocks
  drm: bridge: thc63: Restrict modes based on hardware operating
    frequency
  drm: rcar-du: lvds: D3/E3 support
  drm: rcar-du: Perform the initial CRTC setup from rcar_du_crtc_get()
  drm: rcar-du: Use LVDS PLL clock as dot clock when possible
  drm: rcar-du: Enable configurable DPAD0 routing on Gen3
  drm: rcar-du: Cache DSYSR value to ensure known initial value
  drm: rcar-du: Don't use TV sync mode when not supported by the
    hardware
  arm64: dts: renesas: r8a77990: Add display output support
  arm64: dts: renesas: r8a77990: ebisu: Enable VGA and HDMI outputs

Takeshi Kihara (1):
  arm64: dts: renesas: r8a77990: Add I2C device nodes

Ulrich Hecht (2):
  drm: rcar-du: Add r8a77990 and r8a77995 device support
  arm64: dts: renesas: r8a77995: draak: Enable HDMI display output

 .../bindings/display/bridge/renesas,lvds.txt       |  13 +-
 .../devicetree/bindings/display/renesas,du.txt     |   2 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     | 166 ++++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 290 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |  98 +++++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  56 ++++
 drivers/gpu/drm/bridge/thc63lvd1024.c              |  18 ++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             | 136 ++++----
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              |  63 +++-
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |  88 +++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  12 +
 drivers/gpu/drm/rcar-du/rcar_lvds.c                | 355 ++++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_lvds_regs.h           |  43 ++-
 15 files changed, 1200 insertions(+), 148 deletions(-)

-- 
Regards,

Laurent Pinchart
