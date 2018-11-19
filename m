Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:58523 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728701AbeKSXIP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 18:08:15 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Peter Rosin <peda@axentia.se>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/bridge: Fix 0-day build error
Date: Mon, 19 Nov 2018 12:44:23 +0000
Message-Id: <1542631463-21177-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

kbuild test robot reports:

>> ERROR: "i2c_mux_add_adapter" [drivers/gpu/drm/bridge/sii902x.ko]
undefined!
>> ERROR: "i2c_mux_alloc" [drivers/gpu/drm/bridge/sii902x.ko]
undefined!
>> ERROR: "i2c_mux_del_adapters" [drivers/gpu/drm/bridge/sii902x.ko]
undefined!

Quite obviously the driver depends on I2C_MUX, but adding a "depends on"
introduces a recursive dependency, therefore this patch selects I2C_MUX
instead.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Link: https://lists.01.org/pipermail/kbuild-all/2018-November/054924.html
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 9eeb8ef..2fee47b 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -95,6 +95,7 @@ config DRM_SII902X
 	depends on OF
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
+	select I2C_MUX
 	---help---
 	  Silicon Image sii902x bridge chip driver.
 
-- 
2.7.4
