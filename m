Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:44359 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725985AbeKPI1b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 03:27:31 -0500
From: Fernando Ramos <greenfoo@gluegarage.com>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
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
Subject: [PATCH 6/9] drm: remove deprecated "drm_connector_[un]reference" functions
Date: Thu, 15 Nov 2018 23:16:26 +0100
Message-Id: <20181115221634.22715-7-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-1-greenfoo@gluegarage.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

There are no more places where this (deprecated) function is being
used from, thus it can now be removed.

Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
---
 include/drm/drm_connector.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 9ccad6b062f2..b91b206f1665 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1191,30 +1191,6 @@ static inline void drm_connector_put(struct drm_connector *connector)
 	drm_mode_object_put(&connector->base);
 }
 
-/**
- * drm_connector_reference - acquire a connector reference
- * @connector: DRM connector
- *
- * This is a compatibility alias for drm_connector_get() and should not be
- * used by new code.
- */
-static inline void drm_connector_reference(struct drm_connector *connector)
-{
-	drm_connector_get(connector);
-}
-
-/**
- * drm_connector_unreference - release a connector reference
- * @connector: DRM connector
- *
- * This is a compatibility alias for drm_connector_put() and should not be
- * used by new code.
- */
-static inline void drm_connector_unreference(struct drm_connector *connector)
-{
-	drm_connector_put(connector);
-}
-
 /**
  * drm_connector_is_unregistered - has the connector been unregistered from
  * userspace?
-- 
2.19.1
