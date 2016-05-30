Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34348 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161418AbcE3QBF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:05 -0400
Received: by mail-lf0-f67.google.com with SMTP id 65so14284868lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:04 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Takashi Saito <takashi.saitou.ry@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 14/21] v4l: vsp1: Change VSP1 LIF linebuffer FIFO
Date: Mon, 30 May 2016 18:00:13 +0200
Message-Id: <1464624020-27709-15-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch changes to VSPD hardware recommended value.
Purpose is highest pixel clock without underruns.
In the default R-Car Linux BSP config this value is
wrong and therefore there are many underruns.

Signed-off-by: Takashi Saito <takashi.saitou.ry@renesas.com>
Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/vsp1/vsp1_lif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_lif.c b/drivers/media/platform/vsp1/vsp1_lif.c
index 60d26b6..b34e80f 100644
--- a/drivers/media/platform/vsp1/vsp1_lif.c
+++ b/drivers/media/platform/vsp1/vsp1_lif.c
@@ -126,9 +126,9 @@ static void lif_configure(struct vsp1_entity *entity,
 {
 	const struct v4l2_mbus_framefmt *format;
 	struct vsp1_lif *lif = to_lif(&entity->subdev);
-	unsigned int hbth = 1300;
-	unsigned int obth = 400;
-	unsigned int lbth = 200;
+	unsigned int hbth = 0;
+	unsigned int obth = 3000;
+	unsigned int lbth = 0;
 
 	format = vsp1_entity_get_pad_format(&lif->entity, lif->entity.config,
 					    LIF_PAD_SOURCE);
-- 
2.7.4
