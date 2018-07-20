Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33214 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbeGTMwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jul 2018 08:52:08 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 7/7] ARM: multi_v7_defconfig: Enable support for RZN1D-DB
Date: Fri, 20 Jul 2018 14:03:55 +0200
Message-Id: <e82c98d0448c60706a8024d460eadb9d7402dcba.1532086504.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1532086504.git.horms+renesas@verge.net.au>
References: <cover.1532086504.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Enable support for the Renesas RZN1D-DB Board:
  - RZ/N1D (R9A06G032) base SoC support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7e1c543162c3..874813d7c08e 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -98,6 +98,7 @@ CONFIG_ARCH_R8A7791=y
 CONFIG_ARCH_R8A7792=y
 CONFIG_ARCH_R8A7793=y
 CONFIG_ARCH_R8A7794=y
+CONFIG_ARCH_R9A06G032=y
 CONFIG_ARCH_SH73A0=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_SIRF=y
-- 
2.11.0
