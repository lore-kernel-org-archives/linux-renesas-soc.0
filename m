Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41272 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750930AbcFPFYP (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 16 Jun 2016 01:24:15 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: defconfig: Enable r8a7792 SoC
Date: Thu, 16 Jun 2016 14:23:58 +0900
Message-Id: <1466054638-11326-3-git-send-email-horms+renesas@verge.net.au>
In-Reply-To: <1466054638-11326-1-git-send-email-horms+renesas@verge.net.au>
References: <1466054638-11326-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable support for r8a7792 SoC in multi_v7_defconfig.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 8f857564657f..672bdac2f6a0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -90,6 +90,7 @@ CONFIG_ARCH_R8A7778=y
 CONFIG_ARCH_R8A7779=y
 CONFIG_ARCH_R8A7790=y
 CONFIG_ARCH_R8A7791=y
+CONFIG_ARCH_R8A7792=y
 CONFIG_ARCH_R8A7793=y
 CONFIG_ARCH_R8A7794=y
 CONFIG_ARCH_SH73A0=y
-- 
2.1.4
