Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551E1EB64DC
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Jul 2023 16:55:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232916AbjGRQzF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Jul 2023 12:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbjGRQy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2023 12:54:58 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61AD1BDA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jul 2023 09:54:55 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id Ngus2A0021C8whw01gusGv; Tue, 18 Jul 2023 18:54:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLnyD-001nZi-N7;
        Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qLnyN-000gdu-OF;
        Tue, 18 Jul 2023 18:54:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 35/41] drm: renesas: shmobile: Cleanup encoder
Date:   Tue, 18 Jul 2023 18:54:40 +0200
Message-Id: <bb3a21f5bfc5fc62814af41a2a6157b640c403c8.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Most unused callbacks can be NULL pointers these days.
Drop a bunch of empty encoder callbacks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 -------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index ab42a4999a55c475..365eb3e154130d41 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -534,11 +534,6 @@ int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
  * Encoder
  */
 
-static void shmob_drm_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
 static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 					 const struct drm_display_mode *mode,
 					 struct drm_display_mode *adjusted_mode)
@@ -561,29 +556,8 @@ static bool shmob_drm_encoder_mode_fixup(struct drm_encoder *encoder,
 	return true;
 }
 
-static void shmob_drm_encoder_mode_prepare(struct drm_encoder *encoder)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
-static void shmob_drm_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
-static void shmob_drm_encoder_mode_commit(struct drm_encoder *encoder)
-{
-	/* No-op, everything is handled in the CRTC code. */
-}
-
 static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
-	.dpms = shmob_drm_encoder_dpms,
 	.mode_fixup = shmob_drm_encoder_mode_fixup,
-	.prepare = shmob_drm_encoder_mode_prepare,
-	.commit = shmob_drm_encoder_mode_commit,
-	.mode_set = shmob_drm_encoder_mode_set,
 };
 
 int shmob_drm_encoder_create(struct shmob_drm_device *sdev)
-- 
2.34.1

