Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37569 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbeKPI16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 03:27:58 -0500
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
Subject: [PATCH 9/9] docs: drm: remove no longer relevant TODO entry
Date: Thu, 15 Nov 2018 23:16:29 +0100
Message-Id: <20181115221634.22715-10-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-1-greenfoo@gluegarage.com>
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This entry asked to rename all drm core "*_reference/_unrefence"
functions to "*_get/_put".

Now that this task is complete, we can remove this entry from the TODO
list.

Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>
---
 Documentation/gpu/todo.rst | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 77c2b3c25565..85433af65442 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -28,23 +28,6 @@ them, but also all the virtual ones used by KVM, so everyone qualifies).
 
 Contact: Daniel Vetter, Thierry Reding, respective driver maintainers
 
-Switch from reference/unreference to get/put
---------------------------------------------
-
-For some reason DRM core uses ``reference``/``unreference`` suffixes for
-refcounting functions, but kernel uses ``get``/``put`` (e.g.
-``kref_get``/``put()``). It would be good to switch over for consistency, and
-it's shorter. Needs to be done in 3 steps for each pair of functions:
-
-* Create new ``get``/``put`` functions, define the old names as compatibility
-  wrappers
-* Switch over each file/driver using a cocci-generated spatch.
-* Once all users of the old names are gone, remove them.
-
-This way drivers/patches in the progress of getting merged won't break.
-
-Contact: Daniel Vetter
-
 Convert existing KMS drivers to atomic modesetting
 --------------------------------------------------
 
-- 
2.19.1
