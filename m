Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:37220 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754793AbdHYM4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2017 08:56:55 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: renesas: Add Renesas R8A77970 Kconfig support
Date: Fri, 25 Aug 2017 14:56:50 +0200
Message-Id: <1503665810-13945-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
References: <1503665810-13945-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a configuration option for the R-Car V3M SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a1c9f4ed7a887ab2..8a19015311a35d47 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -184,6 +184,12 @@ config ARCH_R8A7796
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
+config ARCH_R8A77970
+	bool "Renesas R-Car V3M SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas R-Car V3M SoC.
+
 config ARCH_R8A77995
 	bool "Renesas R-Car D3 SoC Platform"
 	depends on ARCH_RENESAS
-- 
2.7.4
