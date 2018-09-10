Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:38095 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728087AbeIJQro (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 12:47:44 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] arm64: Add Renesas R8A774C0 support
Date: Mon, 10 Sep 2018 12:53:49 +0100
Message-Id: <1536580430-17432-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1536580430-17432-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add configuration option for the RZ/G2E (R8A774C0) SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b2e513e..0b65c03 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -170,6 +170,12 @@ config ARCH_R8A774A1
 	help
 	  This enables support for the Renesas RZ/G2M SoC.
 
+config ARCH_R8A774C0
+	bool "Renesas RZ/G2E SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/G2E SoC.
+
 config ARCH_R8A7795
 	bool "Renesas R-Car H3 SoC Platform"
 	depends on ARCH_RENESAS
-- 
2.7.4
