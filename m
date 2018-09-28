Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57961 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729376AbeI1Qow (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:44:52 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 4/6] ARM: multi_v7_defconfig: Enable VIDEO_RENESAS_FDP1
Date: Fri, 28 Sep 2018 12:21:37 +0200
Message-Id: <3ff7ee8a972ac7379bd74af4dc203359320e7c75.1538122547.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538122547.git.horms+renesas@verge.net.au>
References: <cover.1538122547.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

R-Car Gen2 (and RZ/G1) SoCs have a Fine Display Processor, hence enable
support for it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index fc33444e94f0..dec755c939bb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -584,6 +584,7 @@ CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_STI_BDISP=m
 CONFIG_VIDEO_STI_HVA=m
 CONFIG_VIDEO_STI_DELTA=m
+CONFIG_VIDEO_RENESAS_FDP1=m
 CONFIG_VIDEO_RENESAS_JPU=m
 CONFIG_VIDEO_RENESAS_VSP1=m
 CONFIG_V4L_TEST_DRIVERS=y
-- 
2.11.0
