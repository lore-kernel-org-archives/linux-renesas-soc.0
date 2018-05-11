Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:44750 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752952AbeEKOdZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 10:33:25 -0400
Received: by mail-ot0-f193.google.com with SMTP id g7-v6so6454488otj.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 May 2018 07:33:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] drm: rcar-du: disable dtc graph-endpoint warnings on DT overlays
Date: Fri, 11 May 2018 09:33:23 -0500
Message-Id: <20180511143323.6148-1-robh@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The rcar DT overlays are missing symetrical remote-endpoint properties
in their graph nodes because the remote-endpoint is fixed up at
run-time. Disable the dtc 'graph-endpoint' warnings when compiling these
overlays. If this becomes a common problem for overlays, then perhaps
this check needs to be disabled for all overlays.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This needs to go thru my tree because it is dependent on the dtc update 
that adds the warning (perhaps we're going to need to add option 
checking for dtc).

Rob 

 drivers/gpu/drm/rcar-du/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 3e58ed93d5b1..2a3b8d7972b5 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -17,3 +17,10 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
+
+# 'remote-endpoint' is fixed up at run-time
+DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
+DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
+DTC_FLAGS_rcar_du_of_lvds_r8a7793 += -Wno-graph_endpoint
+DTC_FLAGS_rcar_du_of_lvds_r8a7795 += -Wno-graph_endpoint
+DTC_FLAGS_rcar_du_of_lvds_r8a7796 += -Wno-graph_endpoint
-- 
2.17.0
