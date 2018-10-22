Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:28148 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbeJVOsM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 10:48:12 -0400
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be
Cc: laurent.pinchart@ideasonboard.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp,
        na-hoan@jinso.co.jp
Subject: [PATCH] drm: rcar-du: Re-update the DSYSR register value for start/stop
Date: Mon, 22 Oct 2018 15:30:54 +0900
Message-Id: <1540189854-14726-1-git-send-email-na-hoan@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hoan Nguyen An <na-hoan@jinso.co.jp>

>From previous commit 0521ccb "drm: rcar-du: Cache DSYSR value to ensure known initial value"
We only need to update DSYSR0, DSYSR2 for start/stop. So using rgrp-> mmio_offset is enough,
the change back from rcar_du_crtc -> rcar_du_group -> rcar_du_crtc leading to
mmio addresses for DSYSR may be different.

Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
---
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index d85f0a1..a5f7eed 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -202,10 +202,9 @@ void rcar_du_group_put(struct rcar_du_group *rgrp)
 
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
-	struct rcar_du_crtc *rcrtc = &rgrp->dev->crtcs[rgrp->index * 2];
-
-	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_DRES | DSYSR_DEN,
-				   start ? DSYSR_DEN : DSYSR_DRES);
+	rcar_du_group_write(rgrp, DSYSR,
+			(rcar_du_group_read(rgrp, DSYSR) & ~(DSYSR_DRES | DSYSR_DEN)) |
+			(start ? DSYSR_DEN : DSYSR_DRES));
 }
 
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
-- 
2.7.4
