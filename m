Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdGaPEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 05/10] ARM: shmobile: defconfig: Replace DRM_RCAR_HDMI by generic bridge options
Date: Mon, 31 Jul 2017 17:03:36 +0200
Message-Id: <9cfbc97d9931fa87c3dfc42174b46605d99c556b.1501511664.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501511664.git.horms+renesas@verge.net.au>
References: <cover.1501511664.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

The manual bridge implementation was removed in favor of the generic
one, so now we need to enable standard bridge drivers like
DRM_DUMB_VGA_DAC and DRM_I2C_ADV7511.
DRM_I2C_ADV7511 was already enabled, but the (newer) audio part wasn't.

Fixes: 5c602531feb3db39 ("drm: rcar-du: Replace manual bridge implementation with DRM bridge")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index b0e4851e4186..378f6066ea70 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -155,10 +155,11 @@ CONFIG_VIDEO_ADV7180=y
 CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
-CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_RCAR_DU=y
-CONFIG_DRM_RCAR_HDMI=y
 CONFIG_DRM_RCAR_LVDS=y
+CONFIG_DRM_DUMB_VGA_DAC=y
+CONFIG_DRM_I2C_ADV7511=y
+CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FB_SH_MOBILE_MERAM=y
 # CONFIG_LCD_CLASS_DEVICE is not set
-- 
2.1.4
