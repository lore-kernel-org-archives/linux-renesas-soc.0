Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57567 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbeHVKpe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 06:45:34 -0400
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS),
        linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS)
Subject: [PATCH 0/3] drm: rcar-du: A few cosmetic changes
Date: Wed, 22 Aug 2018 09:21:46 +0200
Message-Id: <1534922509-15197-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,
   there are a few things currently in-flight for DU on my side:
- non-DPLL channel clock source selction
- ESCR/OTAR handling for non-DPLL channel

Before taking those two functional changes series into account,
could you include these three cosmetic changes in your tree?

Patches based on your drm/du/next branch, with the following patch applied on
top:
'01449a9779b8 (" drm: rcar-du: Rework clock configuration based on hardware limits")'

Tested on Salvator-X M3-W with kms-modes-tests.py: no functional changes

Thanks
  j

Jacopo Mondi (3):
  drm: rcar-du: Rename and document dpll_ch field
  drm: rcar-du: Write ESCR register per channel
  drm: rcar-du: Write OTAR register per channel

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 7 +++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 6 +++---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  | 3 ++-
 drivers/gpu/drm/rcar-du/rcar_du_regs.h | 8 ++++----
 4 files changed, 12 insertions(+), 12 deletions(-)

--
2.7.4
