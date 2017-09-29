Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752318AbdI2LxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:21 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/3] arm64: defconfig: enable thermal driver for Renesas R-Car Gen3
Date: Fri, 29 Sep 2017 13:52:10 +0200
Message-Id: <86f0a075111d16e3b48d79b44858e141ea86cad7.1506678593.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506678593.git.horms+renesas@verge.net.au>
References: <cover.1506678593.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

We want this driver to detect critical temperatures in time.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a83012a7f4b8..1eb054469927 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -316,6 +316,7 @@ CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_BRCMSTB_THERMAL=m
 CONFIG_EXYNOS_THERMAL=y
+CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_WATCHDOG=y
 CONFIG_S3C2410_WATCHDOG=y
-- 
2.1.4
