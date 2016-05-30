Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:35882 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932508AbcE3QAk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:00:40 -0400
Received: by mail-lf0-f65.google.com with SMTP id h68so7203162lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:00:39 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 03/21] media: vsp1: Set format to RPF input source
Date: Mon, 30 May 2016 18:00:02 +0200
Message-Id: <1464624020-27709-4-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

The output format of the RPF must be unified in RGB or YCbCr by
specification of the H/W. To unify the output format in RGB in
driver, if the input format is YCbCr, the output format must be
converted to RGB by CSC (Color Space Conversion).
The driver is missing the format setting of the RPF input source,
so it does not pass through the process to enable the CSC.
This patch adds format setting of the RPF input source.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
[geert: Rebased, s/fmtinfo/rpf->fmtinfo]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/media/platform/vsp1/vsp1_drm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
index ff961b2..c5ee06b 100644
--- a/drivers/media/platform/vsp1/vsp1_drm.c
+++ b/drivers/media/platform/vsp1/vsp1_drm.c
@@ -383,6 +383,12 @@ static int vsp1_du_setup_rpf_pipe(struct vsp1_device *vsp1,
 
 	/* BRU sink, propagate the format from the RPF source. */
 	format.pad = bru_input;
+	format.format.code = rpf->fmtinfo->mbus;
+
+	ret = v4l2_subdev_call(&rpf->entity.subdev, pad, set_fmt, NULL,
+			       &format);
+	if (ret < 0)
+		return ret;
 
 	ret = v4l2_subdev_call(&vsp1->bru->entity.subdev, pad, set_fmt, NULL,
 			       &format);
-- 
2.7.4
