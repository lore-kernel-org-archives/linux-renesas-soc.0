Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:57897 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbeG3S41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 14:56:27 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] drm: rcar-du: Rework clock configuration
Date: Mon, 30 Jul 2018 19:20:11 +0200
Message-Id: <1532971214-17962-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello
   this series improves the DU peripheral input clock selection procedure,
fixing high-resolution modes for non-DPLL channels, as DPAD and LVDS ones.

The first patch in the series is a rework from Laurent of the clock selection
procedure, clearly separating DPLL equipped channels from channels only
equipped with an interanl divider.

The non-DPLL channels clock input selection procedure is improved in patch
[3/3] by exploiting the external clock source ability to generate the desired
pixel clock (when possible).

This improvements is sparkled from the following BSP patch
https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/commit/
?id=32e9be612773ce0ed75295a10764151633938528

that un-conditionally uses the externally generated clock source as output
pixel clock.

Tested on M3-W Salvator-X board and VGA output: fixes 1920x1080 display.

Jacopo Mondi (2):
  drm: rcar-du: Rename var to a more precise name
  drm: rcar-du: Improve non-DPLL clock selection

Laurent Pinchart (1):
  drm: rcar-du: Rework clock configuration based on hardware limits

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 182 ++++++++++++++++++++++-----------
 1 file changed, 122 insertions(+), 60 deletions(-)

--
2.7.4
