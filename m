Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart+renesas@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Andy Yan <andy.yan@rock-chips.com>,
	Fabio Estevam <fabio.estevam@freescale.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Nickey Yang <nickey.yang@rock-chips.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 0/9] drm: bridge: dw-hdmi: Refactor PHY support
Date: Thu,  2 Mar 2017 00:39:06 +0200
Message-Id: <20170301223915.29888-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

This patch series refactors all the PHY handling code in order to allow
support of vendor PHYs and Synopsys DWC HDMI 2.0 TX PHYs.

The series starts with a few cleanups and small fixes. Patch 1/9 just removes
unused code, patch 2/9 moves the color converter code out of the PHY configure
function as it isn't PHY-dependent, and patch 3/9 enables color conversion
even for DVI as it is needed to output RGB when the input format is YUV.

The next two patches fix the power down (4/9) and up (5/9) sequences to comply
with the HDMI TX PHY specifications. They are the biggest functional changes
in the whole set, and have been tested successfully (with the rest of the
series) on i.MX6Q and R-Car H3. I'll try to perform tests on RK3288 tomorrow
if nobody beats me to it (Neil, that's for you :-)). The PLL PHY lock delay
has been measured to be between 300µs and 350µs on R-Car H3 and between 400µs
and 600µs on i.MX6Q. The PHY power down delay has been measured to be less
than 50µs on both platforms, and was often close to instant with power down
reported in the first poll iteration. We should thus be more than safe with a
5ms timeout.

Patch 6/9 breaks the PHY operations out. Glue code is then allowed to pass a
PHY operations structure to support vendor PHYs. The existing PHY support code
is turned into a default Synopsys PHYs implementation for those PHY
operations.

Patch 7/9 further refactors the Synopsys PHY configuration function to make
it modular, in order to support DWC HDMI 2.0 TX PHYs that have a very
different register layout compared to the currently supported PHYs. Glue code
is again allowed to provide a custom PHY configuration implementation, with
the existing PHY support code turned into the default implementation for all
currently supported Synopsys PHYs.

Patch 8/9 is a small cleanup that removes the now unneeded device type for
glue code platform data, and patch 9/9 follows by switching the driver to
regmap in order to support vendor-specific register access more easily.

Kieran Bingham (2):
  drm: bridge: dw-hdmi: Add support for custom PHY configuration
  drm: bridge: dw-hdmi: Remove device type from platform data

Laurent Pinchart (5):
  drm: bridge: dw-hdmi: Remove unused functions
  drm: bridge: dw-hdmi: Move CSC configuration out of PHY code
  drm: bridge: dw-hdmi: Fix the PHY power down sequence
  drm: bridge: dw-hdmi: Fix the PHY power up sequence
  drm: bridge: dw-hdmi: Create PHY operations

Neil Armstrong (2):
  drm: bridge: dw-hdmi: Enable CSC even for DVI
  drm: bridge: dw-hdmi: Switch to regmap for register access

 drivers/gpu/drm/bridge/dw-hdmi.c            | 467 +++++++++++++++++-----------
 drivers/gpu/drm/imx/dw_hdmi-imx.c           |   2 -
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |   1 -
 include/drm/bridge/dw_hdmi.h                |  33 +-
 4 files changed, 304 insertions(+), 199 deletions(-)

-- 
Regards,

Laurent Pinchart
