Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:57885 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbeI1Qof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Sep 2018 12:44:35 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/4] arm64: Add Renesas R8A774A1 support
Date: Fri, 28 Sep 2018 12:21:19 +0200
Message-Id: <5afa67792d0a25d5642cd6929ed0f92b5e7f5076.1538127537.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1538127537.git.horms+renesas@verge.net.au>
References: <cover.1538127537.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Biju Das <biju.das@bp.renesas.com>

Add configuration option for the RZ/G2M (R8A774A1) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8d149e12c82d..b2e513e5960b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -164,6 +164,12 @@ config ARCH_RENESAS
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
+config ARCH_R8A774A1
+	bool "Renesas RZ/G2M SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/G2M SoC.
+
 config ARCH_R8A7795
 	bool "Renesas R-Car H3 SoC Platform"
 	depends on ARCH_RENESAS
-- 
2.11.0
