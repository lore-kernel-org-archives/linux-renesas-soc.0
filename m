Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47457 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388764AbeKPI0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 03:26:55 -0500
From: Fernando Ramos <greenfoo@gluegarage.com>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        cocci@systeme.lip6.fr
Subject: [PATCH 2/9] drm: remove deprecated "[__]drm_gem_object_[un]reference[_locked]" functions
Date: Thu, 15 Nov 2018 23:16:22 +0100
Message-Id: <20181115221634.22715-3-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-1-greenfoo@gluegarage.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are no more places where these (deprecated) functions are being
used from, thus they can now be removed.

Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
---
 include/drm/drm_gem.h | 50 -------------------------------------------
 1 file changed, 50 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 3583b98a1718..daa34328b5be 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -222,56 +222,6 @@ __drm_gem_object_put(struct drm_gem_object *obj)
 void drm_gem_object_put_unlocked(struct drm_gem_object *obj);
 void drm_gem_object_put(struct drm_gem_object *obj);
 
-/**
- * drm_gem_object_reference - acquire a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This is a compatibility alias for drm_gem_object_get() and should not be
- * used by new code.
- */
-static inline void drm_gem_object_reference(struct drm_gem_object *obj)
-{
-	drm_gem_object_get(obj);
-}
-
-/**
- * __drm_gem_object_unreference - raw function to release a GEM buffer object
- *                                reference
- * @obj: GEM buffer object
- *
- * This is a compatibility alias for __drm_gem_object_put() and should not be
- * used by new code.
- */
-static inline void __drm_gem_object_unreference(struct drm_gem_object *obj)
-{
-	__drm_gem_object_put(obj);
-}
-
-/**
- * drm_gem_object_unreference_unlocked - release a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This is a compatibility alias for drm_gem_object_put_unlocked() and should
- * not be used by new code.
- */
-static inline void
-drm_gem_object_unreference_unlocked(struct drm_gem_object *obj)
-{
-	drm_gem_object_put_unlocked(obj);
-}
-
-/**
- * drm_gem_object_unreference - release a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This is a compatibility alias for drm_gem_object_put() and should not be
- * used by new code.
- */
-static inline void drm_gem_object_unreference(struct drm_gem_object *obj)
-{
-	drm_gem_object_put(obj);
-}
-
 int drm_gem_handle_create(struct drm_file *file_priv,
 			  struct drm_gem_object *obj,
 			  u32 *handlep);
-- 
2.19.1
