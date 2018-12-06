Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55844 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbeLFV5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:52 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/1] ARM: shmobile: defconfig: Enable SII902X
Date: Thu,  6 Dec 2018 13:57:47 -0800
Message-Id: <65a8c17a39f62fd646950fa43efcced0d6fe029c.1544124535.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544124535.git.horms+renesas@verge.net.au>
References: <cover.1544124535.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

The iwg23s board comes with the SiI9022ACNU HDMI transmitter,
this patch makes sure the corresponding driver gets built.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index d090022ca975..9e5a5ade6cab 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -142,6 +142,7 @@ CONFIG_DRM=y
 CONFIG_DRM_RCAR_DU=y
 CONFIG_DRM_RCAR_LVDS=y
 CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_SII902X=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
-- 
2.11.0
