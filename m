Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59442 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753091AbeBFNUo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Feb 2018 08:20:44 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: renesas_defconfig: enable R8A77980 SoC
Date: Tue,  6 Feb 2018 14:20:39 +0100
Message-Id: <20180206132039.23437-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas R-Car V3H (R8A77980) SoC in the ARM64 renesas_defconfig.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

 Based on renesas-devel-20180206-v4.15

 Not for upstream merge

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 3087bba06d3c..386211464efa 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -34,6 +34,7 @@ CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
 CONFIG_ARCH_R8A77970=y
+CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
-- 
2.11.0
