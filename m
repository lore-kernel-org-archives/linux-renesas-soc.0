Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34389 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QBO (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:14 -0400
Received: by mail-lf0-f65.google.com with SMTP id 65so14285250lfq.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:14 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 19/21] arm64: configs: Enable R-Car DU related config
Date: Mon, 30 May 2016 18:00:18 +0200
Message-Id: <1464624020-27709-20-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index aa47366..fc10983 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -212,6 +212,20 @@ CONFIG_REGULATOR_HI655X=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
 CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_REGULATOR_S2MPS11=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_CONTROLLER=y
+CONFIG_VIDEO_V4L2_SUBDEV_API=y
+CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_SOC_CAMERA=y
+CONFIG_SOC_CAMERA_PLATFORM=y
+CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_RENESAS_VSP1=y
+CONFIG_DRM=y
+CONFIG_DRM_RCAR_DU=y
+CONFIG_DRM_RCAR_HDMI=y
+CONFIG_DRM_RCAR_LVDS=y
+CONFIG_DRM_RCAR_VSP=y
 CONFIG_FB=y
 CONFIG_FB_ARMCLCD=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
-- 
2.7.4
