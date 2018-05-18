Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752562AbeERLSG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:18:06 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/6] ARM: multi_v7_defconfig: Disable CONFIG_FB_SH_MOBILE_MERAM
Date: Fri, 18 May 2018 13:16:30 +0200
Message-Id: <57eec170e9547bbbf5cc3634ef0d0d29349e8fdf.1526548577.git.horms+renesas@verge.net.au>
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
 arch/arm/configs/multi_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 861403da4b10..c6042475bece 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -651,7 +651,6 @@ CONFIG_FB_EFI=y
 CONFIG_FB_WM8505=y
 CONFIG_FB_SH_MOBILE_LCDC=y
 CONFIG_FB_SIMPLE=y
-CONFIG_FB_SH_MOBILE_MERAM=y
 CONFIG_BACKLIGHT_LCD_SUPPORT=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=m
-- 
2.11.0
