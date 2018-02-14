Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:58695 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161765AbeBNSNW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 13:13:22 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2 0/3] R-Car DU: Fix and refactor LVDS to prepare for V3M support
Date: Wed, 14 Feb 2018 20:13:45 +0200
Message-Id: <20180214181348.16258-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello, 

This patch series fixes the LVDS startup sequence for Gen2 and Gen3
SoCs, and then proceeds to refactoring the code to merge the Gen2 and
Gen3 implementations in preparation for V3M support.

The patches have been previously posted as part of the following series.

[PATCH 0/2] Fix LVDS startup sequences in the R-Car DU driver...
[PATCH 0/3] Add R-Car V3M (R8A77970) support to the R-Car LVDS driver

They have since been rebased on top of the latest DU driver and the
current DRM -next branch.

For convenience the patches can be found at

	git://linuxtv.org/pinchartl/media.git drm/next/du

They have been tested on H2 (Lager), H3 ES1.1 (Salvator-X) and H3 ES2.0
(Salvator-XS) without any issue.

The patches that add V3M support have been left out as they depend on
the LVDS encoder move to the DRM bridge API that is not ready for
upstream yet.

Sergei Shtylyov (3):
  drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen2
  drm: rcar-du: lvds: Fix LVDS startup on R-Car Gen3
  drm: rcar-du: lvds: Refactor LVDS startup

 drivers/gpu/drm/rcar-du/rcar_du_lvdsenc.c | 128 ++++++++++++------------------
 1 file changed, 51 insertions(+), 77 deletions(-)

-- 
Regards,

Laurent Pinchart
