Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbeERLSE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/6] ARM: shmobile: defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
Date: Fri, 18 May 2018 13:16:29 +0200
Message-Id: <ddba297cc1cc01c70cd08dd4647d46ea33f942a1.1526548577.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526548577.git.horms+renesas@verge.net.au>
References: <cover.1526548577.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The last Renesas ARM platform using this driver was removed in commit
a521422ea4ae6128 ("ARM: shmobile: mackerel: Remove Legacy C board
code").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index dc650db70063..dd95d395f565 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -157,7 +157,6 @@ CONFIG_DRM_DUMB_VGA_DAC=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
-CONFIG_FB_SH_MOBILE_MERAM=y
 # CONFIG_LCD_CLASS_DEVICE is not set
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
-- 
2.11.0
