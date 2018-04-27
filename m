Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:38232 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759307AbeD0WWA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Apr 2018 18:22:00 -0400
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        geert@glider.be
Subject: [PATCH v3 0/5] drm: rcar-du: r8a77965 DU support
Date: Fri, 27 Apr 2018 23:21:49 +0100
Message-Id: <20180427222154.21664-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The r8a77965 M3-N platform supports a DPAD, HDMI and LVDS output, along
3 DU channels. However, DU2 is not available in the hardware, with the
DPAD instead being routed through DU3.

Provide support for this non-linear indexing with updates to the rcar-du
driver, before adding the device info structure for the r8a77965.


Kieran Bingham (5):
  dt-bindings: display: renesas: Add R-Car M3-N HDMI TX DT bindings
  pinctrl: sh-pfc: r8a77965: Add DU RGB output pins, groups and
    functions
  drm: rcar-du: Split CRTC handling to support hardware indexing
  drm: rcar-du: Allow DU groups to work with hardware indexing
  drm: rcar-du: Add R8A77965 support

 .../display/bridge/renesas,dw-hdmi.txt        |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  26 ++--
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |   3 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  51 ++++++--
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   4 +-
 drivers/gpu/drm/rcar-du/rcar_du_group.c       |  14 ++-
 drivers/gpu/drm/rcar-du/rcar_du_group.h       |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  23 +++-
 drivers/pinctrl/sh-pfc/pfc-r8a77965.c         | 116 ++++++++++++++++++
 9 files changed, 203 insertions(+), 37 deletions(-)

-- 
2.17.0
