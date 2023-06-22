Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B525EB64D8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 22 Jun 2023 09:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjFVJcp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 22 Jun 2023 05:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbjFVJav (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Jun 2023 05:30:51 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776774495
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jun 2023 02:23:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:991a:a831:ea4b:6058])
        by laurent.telenet-ops.be with bizsmtp
        id C9Nj2A00Q1yfRTD019Njlf; Thu, 22 Jun 2023 11:22:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGWX-000Bw4-LC;
        Thu, 22 Jun 2023 11:22:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qCGWZ-003Vwa-8H;
        Thu, 22 Jun 2023 11:22:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/39] drm: renesas: shmobile: Rename input clocks
Date:   Thu, 22 Jun 2023 11:21:25 +0200
Message-Id: <3f92b2c9dafbfeb8534d4e81b6899ef3249731f0.1687423204.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687423204.git.geert+renesas@glider.be>
References: <cover.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Prepare for DT bindings by using more appropriate names for the input
clocks.

Note that all LDDCKR_ICKSEL_* definitions but the one for the bus clock
are valid only for SH7724, so the clock selection code needs to be
updated when extending clock support to other SoCs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
[geert: Add note]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index d272e6273c782178..007ba97cc7733c82 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -74,15 +74,15 @@ static int shmob_drm_setup_clocks(struct shmob_drm_device *sdev,
 
 	switch (clksrc) {
 	case SHMOB_DRM_CLK_BUS:
-		clkname = "bus_clk";
+		clkname = "fck";
 		sdev->lddckr = LDDCKR_ICKSEL_BUS;
 		break;
 	case SHMOB_DRM_CLK_PERIPHERAL:
-		clkname = "peripheral_clk";
+		clkname = "media";
 		sdev->lddckr = LDDCKR_ICKSEL_MIPI;
 		break;
 	case SHMOB_DRM_CLK_EXTERNAL:
-		clkname = NULL;
+		clkname = "lclk";
 		sdev->lddckr = LDDCKR_ICKSEL_HDMI;
 		break;
 	default:
-- 
2.34.1

