Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:60488 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756417AbcK2JEq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 04:04:46 -0500
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
        Archit Taneja <architt@codeaurora.org>
Subject: [PATCH v3 02/13] drm: Fix compilation warning caused by static inline forward declaration
Date: Tue, 29 Nov 2016 11:04:32 +0200
Message-Id: <1480410283-28698-3-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1480410283-28698-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The drm_crtc_mask() function used in <drm/drm_encoder.h> is a static
inline defined in <drm/drm_crtc.h>. If the first header is included in a
compilation unit without the second one, the following compilation
warning will be issued.

In file included from <linux>/drivers/gpu/drm/drm_bridge.c:29:0:
<linux>/include/drm/drm_encoder.h:192:95: warning: ‘drm_crtc_mask’ used but never defined
 static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc);

Fix this by including the header defining the function instead of using
a forward declaration.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 include/drm/drm_encoder.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
index cec6ac45c6cc..5f58f65344e0 100644
--- a/include/drm/drm_encoder.h
+++ b/include/drm/drm_encoder.h
@@ -25,6 +25,7 @@
 
 #include <linux/list.h>
 #include <linux/ctype.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_mode_object.h>
 
@@ -191,9 +192,6 @@ static inline unsigned int drm_encoder_index(struct drm_encoder *encoder)
 	return encoder->index;
 }
 
-/* FIXME: We have an include file mess still, drm_crtc.h needs untangling. */
-static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc);
-
 /**
  * drm_encoder_crtc_ok - can a given crtc drive a given encoder?
  * @encoder: encoder to test
-- 
Regards,

Laurent Pinchart
