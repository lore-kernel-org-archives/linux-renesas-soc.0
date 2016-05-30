Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33710 "EHLO
	mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161220AbcE3QA7 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:59 -0400
Received: by mail-lf0-f66.google.com with SMTP id w16so12124828lfd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:58 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 11/21] drm: rcar-du: Fix VSP feed plane number
Date: Mon, 30 May 2016 18:00:10 +0200
Message-Id: <1464624020-27709-12-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

VSP feeds plane1 and plane3 with R-Car Gen3.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_plane.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 8d5e59b..027c4cfb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -489,7 +489,9 @@ static void rcar_du_plane_setup_format_gen2(struct rcar_du_group *rgrp,
 		rcar_du_plane_write(rgrp, index, PnDDCR2, ddcr2);
 
 	ddcr4 = state->format->edf | PnDDCR4_CODE;
-	if (state->source != RCAR_DU_PLANE_MEMORY)
+
+	if ((state->source != RCAR_DU_PLANE_MEMORY)
+		&& (!rcar_du_has(rcdu, RCAR_DU_FEATURE_GEN3_REGS)))
 		ddcr4 |= PnDDCR4_VSPS;
 
 	rcar_du_plane_write(rgrp, index, PnDDCR4, ddcr4);
-- 
2.7.4
