Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from slow1-d.mail.gandi.net ([217.70.178.86]:59580 "EHLO
        slow1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751250AbdCCIPz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Mar 2017 03:15:55 -0500
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
        by slow1-d.mail.gandi.net (Postfix) with ESMTP id AC765486533
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Mar 2017 09:10:45 +0100 (CET)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm: rcar-du: Make sure DRM planes are created by VSP1
Date: Fri,  3 Mar 2017 09:09:38 +0100
Message-Id: <1488528578-26978-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Gen3 platforms compositing planes are allocated  by VSP on behalf of
DRM/KMS.
If VSP support is not compiled in, vsp1 initialization stub routine is
called, leading to invalid memory accesses later on when un-initialized
planes are accessed.

Fail explicitly earlier if planes are not properly created.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index b5d3f16..7f56c09 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -616,6 +616,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 			ret = rcar_du_vsp_init(vsp);
 			if (ret < 0)
 				return ret;
+
+			if (!vsp->planes)
+				return -EINVAL;
 		}
 	}
 
-- 
2.7.4
