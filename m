Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:33398 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751427AbdCCOEz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 09:04:55 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id 7991747F588
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Mar 2017 14:00:03 +0100 (CET)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Make sure planes are created by VSP
Date: Fri,  3 Mar 2017 13:58:56 +0100
Message-Id: <1488545936-1321-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Gen3 platforms compositing planes are allocated  by VSP on behalf of
DRM/KMS.
If VSP support is not compiled in, vsp initialization stub routine is
called. Return an error from that stub to fail explicitly, otherwise
accessing planes leads to invalid memory errors.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
index 510dcc9..f1d0f18 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.h
@@ -68,7 +68,7 @@ void rcar_du_vsp_disable(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc);
 void rcar_du_vsp_atomic_flush(struct rcar_du_crtc *crtc);
 #else
-static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return 0; };
+static inline int rcar_du_vsp_init(struct rcar_du_vsp *vsp) { return -ENXIO; };
 static inline void rcar_du_vsp_enable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_disable(struct rcar_du_crtc *crtc) { };
 static inline void rcar_du_vsp_atomic_begin(struct rcar_du_crtc *crtc) { };
-- 
2.7.4
