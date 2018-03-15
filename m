Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:43735 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752084AbeCOPhj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Mar 2018 11:37:39 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Frank Rowand <frank.rowand@sony.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [RFC] drm: rcar-du: keep temporary dtb files around during build
Date: Thu, 15 Mar 2018 16:37:08 +0100
Message-Id: <20180315153730.3798004-1-arnd@arndb.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The *.dtb and *.dtb.S files get removed by 'make' during the build process,
and later seem to be missed during the 'modpost' stage:

rm drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dtb.S drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dtb.S drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dtb.S drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dtb.S
WARNING: could not open drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dtb.S: No such file or directory

As a workaround, this adds all those files to the 'extra-y' target list,
but that's really ugly. Any ideas for a better fix?

Fixes: 81c0e3dd8292 ("drm: rcar-du: Fix legacy DT to create LVDS encoder nodes")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rcar-du/Makefile | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 3e58ed93d5b1..e5fc6ec0b8cc 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -12,6 +12,21 @@ rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
 					   rcar_du_of_lvds_r8a7793.dtb.o \
 					   rcar_du_of_lvds_r8a7795.dtb.o \
 					   rcar_du_of_lvds_r8a7796.dtb.o
+
+extra-y					+= rcar_du_of_lvds_r8a7790.dtb \
+					   rcar_du_of_lvds_r8a7790.dtb \
+					   rcar_du_of_lvds_r8a7791.dtb \
+					   rcar_du_of_lvds_r8a7793.dtb \
+					   rcar_du_of_lvds_r8a7795.dtb \
+					   rcar_du_of_lvds_r8a7796.dtb
+
+extra-y					+= rcar_du_of_lvds_r8a7790.dtb.S \
+					   rcar_du_of_lvds_r8a7790.dtb.S \
+					   rcar_du_of_lvds_r8a7791.dtb.S \
+					   rcar_du_of_lvds_r8a7793.dtb.S \
+					   rcar_du_of_lvds_r8a7795.dtb.S \
+					   rcar_du_of_lvds_r8a7796.dtb.S
+
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
-- 
2.9.0
