Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48865 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbeBWIvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Feb 2018 03:51:23 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: defconfig: enable R8A77965 SoC
Date: Fri, 23 Feb 2018 09:51:15 +0100
Message-Id: <20180223085115.13782-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas R-Car M3-W (R8A77965) SoC in the ARM64 defconfig.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ceafd26f0fab..c8b59543f670 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77965=y
 CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77980=y
 CONFIG_ARCH_R8A77995=y
-- 
2.11.0
