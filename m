Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34326 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161418AbcE3QBD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:03 -0400
Received: by mail-lf0-f67.google.com with SMTP id 65so14284688lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:02 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 13/21] drm: rcar-du: Fix display max size to 4096x2160 size
Date: Mon, 30 May 2016 18:00:12 +0200
Message-Id: <1464624020-27709-14-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index a8c59c3..d6d9acb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -611,8 +611,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-	dev->mode_config.max_width = 4095;
-	dev->mode_config.max_height = 2047;
+	dev->mode_config.max_width = 4096;
+	dev->mode_config.max_height = 2160;
 	dev->mode_config.funcs = &rcar_du_mode_config_funcs;
 
 	rcdu->num_crtcs = rcdu->info->num_crtcs;
-- 
2.7.4
