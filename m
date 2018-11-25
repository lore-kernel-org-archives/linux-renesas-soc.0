Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:46200 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726050AbeKZBb0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Nov 2018 20:31:26 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: [PATCH 0/5] R-Car DU: Fix DPAD output routing on D3 and E3
Date: Sun, 25 Nov 2018 16:40:26 +0200
Message-Id: <20181125144031.4407-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

DU channels are routed to DPAD outputs in an SoC-dependent way. The routing
can be fixed (e.g. DU3 to DPAD0 on H3) or configurable (e.g. DU0 or DU1 to
DPAD0 on D3/E3). The hardware offers no option to disconnect DPAD outputs,
which are thus always driven by a DU channel.

On SoCs that have less DU channels than DU outputs, such as D3 and E3, the
DPAD output is always driven when all channels are in used by other outputs
(such as the internal LVDS and HDMI encoders). This creates an unwanted clone
on the DPAD output.

However, the parallel output of the DU channels routed to DPAD can be set to
fixed levels in the DU channels themselves through the DOFLR group register.
This patch series uses this feature to fix the problem and get rid of unwanted
clones.

Patch 1/5 is a small cleanup not strictly required by the series, but included
as it was developed at the same time. Patch 2/5 moves output routing
information from the CRTC structure to the CRTC state, in order to make the
information available early enough for output routing configuration. Patch 3/5
then fixes the DPAD output routing issue using the DOFLR register.

Patches 4/5 and 5/5 add backlight and panel support to the Draak board DT, in
order to test the series. Only patch 4/5 should be upstreamed at this time as
5/5 should be rewritten using DT overlays. It can be merged separately from
the rest of the series as code and DT are not dependent.

Laurent Pinchart (5):
  drm: rcar-du: Replace EXT_CTRL_REGS feature flag with generation check
  drm: rcar-du: Move CRTC outputs bitmask to private CRTC state
  drm: rcar-du: Disable unused DPAD outputs
  arm64: dts: renesas: r8a77995: draak: Add backlight
  [HACK] arm64: dts: r8a77995: draak: Add panel to DT

 .../arm64/boot/dts/renesas/r8a77995-draak.dts | 31 ++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        | 42 ++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  7 +--
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 14 +-----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |  8 +--
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c     | 10 ----
 drivers/gpu/drm/rcar-du/rcar_du_group.c       | 50 +++++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         | 22 ++++++++
 8 files changed, 126 insertions(+), 58 deletions(-)

-- 
Regards,

Laurent Pinchart
