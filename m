Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59458 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752016AbeBFNUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:20:50 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: defconfig: enable R8A77980 SoC
Date: Tue,  6 Feb 2018 14:20:45 +0100
Message-Id: <20180206132045.23487-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas R-Car V3H (R8A77980) SoC in the ARM64 defconfig.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

 Based on renesas-devel-20180206-v4.15

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6356c6da34ea..45a423f845c7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -52,6 +52,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77970=y
+CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_STRATIX10=y
 CONFIG_ARCH_TEGRA=y
-- 
2.11.0
