Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35450 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751364AbcJZFcL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 01:32:11 -0400
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will.deacon@arm.com,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, khilman@baylibre.com,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 26 Oct 2016 14:24:22 +0900
Message-Id: <20161026052422.17283.57864.sendpatchset@little-apple>
Subject: [PATCH] arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP modules
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Extend the ARM64 defconfig to enable the DU DRM device as module
together with required dependencies of V4L2 FCP and VSP modules.

This enables VGA output on the r8a7795 Salvator-X board.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Written against next-20161026

 arch/arm64/configs/defconfig |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

--- 0001/arch/arm64/configs/defconfig
+++ work/arch/arm64/configs/defconfig	2016-10-26 14:10:58.220607110 +0900
@@ -293,8 +293,22 @@ CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
+CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+# CONFIG_DVB_NET is not set
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_RENESAS_FCP=m
+CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_DRM=m
 CONFIG_DRM_NOUVEAU=m
+CONFIG_DRM_RCAR_DU=m
+CONFIG_DRM_RCAR_HDMI=y
+CONFIG_DRM_RCAR_LVDS=y
+CONFIG_DRM_RCAR_VSP=y
 CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_SIMPLE=m
 CONFIG_DRM_I2C_ADV7511=m
