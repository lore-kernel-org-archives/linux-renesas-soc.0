Return-Path: <SRS0=w5fC=RE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73D5FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A4D72084F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  1 Mar 2019 13:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387439AbfCANDR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 1 Mar 2019 08:03:17 -0500
Received: from mblankhorst.nl ([141.105.120.124]:42966 "EHLO mblankhorst.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732687AbfCANDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Mar 2019 08:03:17 -0500
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 12/17] drm/rcar-du: Convert to using __drm_atomic_helper_crtc_reset() for reset.
Date:   Fri,  1 Mar 2019 13:56:22 +0100
Message-Id: <20190301125627.7285-13-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
References: <20190301125627.7285-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert rcar-du to using __drm_atomic_helper_crtc_reset(), instead of
writing its own version. Instead of open coding destroy_state(), call
it directly for freeing the old state.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 4cdea14d552f..7766551e67fc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -891,22 +891,17 @@ static void rcar_du_crtc_cleanup(struct drm_crtc *crtc)
 
 static void rcar_du_crtc_reset(struct drm_crtc *crtc)
 {
-	struct rcar_du_crtc_state *state;
+	struct rcar_du_crtc_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
 
-	if (crtc->state) {
+	if (crtc->state)
 		rcar_du_crtc_atomic_destroy_state(crtc, crtc->state);
-		crtc->state = NULL;
-	}
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	__drm_atomic_helper_crtc_reset(crtc, &state->state);
 	if (state == NULL)
 		return;
 
 	state->crc.source = VSP1_DU_CRC_NONE;
 	state->crc.index = 0;
-
-	crtc->state = &state->state;
-	crtc->state->crtc = crtc;
 }
 
 static int rcar_du_crtc_enable_vblank(struct drm_crtc *crtc)
-- 
2.20.1

