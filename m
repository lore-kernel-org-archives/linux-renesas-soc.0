Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34495 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752258AbdI2LxZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:53:25 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/3] arm64: defconfig: enable R8A77970 SoC
Date: Fri, 29 Sep 2017 13:52:11 +0200
Message-Id: <bb58b29899ff9c6d1e97727ec05b500e832ebd7d.1506678593.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1506678593.git.horms+renesas@verge.net.au>
References: <cover.1506678593.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Enable the Renesas R-Car V3M (R8A77970) SoC in the ARM64 defconfig.

Suggested-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1eb054469927..cb5b37fe1e14 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -51,6 +51,7 @@ CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_STRATIX10=y
 CONFIG_ARCH_TEGRA=y
-- 
2.1.4
