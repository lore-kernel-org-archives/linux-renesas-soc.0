Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55441 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732016AbeHWSma (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 14:42:30 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ulrich.hecht+renesas@gmail.com, kieran.bingham@ideasonboard.com,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 0/4] drm: rcar-du: Update to SoC manual revision 1.00
Date: Thu, 23 Aug 2018 17:12:10 +0200
Message-Id: <1535037134-373-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent,
   Revision 1.00 has brought several updates on how to handle some registers
in the DU. In particular

- ESCR cannot be written for channels with a DPLL
- OTAR cannot be written for channels without a digital output pad
- routing superimposition processor output to pincontrollers through DORCR2
  register cannot be performed for channels of group 1
- The plane super-imposition register PnMR can be written to groups with more
  than 1 channel.

Patches applied on top of your latest drm/du/next branch.

Tested on Salvator-X M3-W with VGA and HDMI output.
Tested on Salvator-XS M3-N with VGA and HDMI output.
No visible regression, but if you have ideas on how to better verify this
please let me know.

Thanks
   j

Jacopo Mondi (4):
  drm: rcar-du: Do not write ESCR for DPLL channels
  drm: rcar-du: Write OTAR for DPAD channels only
  drm: rcar-du: Fix handling of DORCR for group 1
  drm: rcar-du: Fix handling of PnMR register

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 18 +++++++++++-------
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 19 ++++++++++++++++---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 13 +++++++++++--
 3 files changed, 38 insertions(+), 12 deletions(-)

--
2.7.4
