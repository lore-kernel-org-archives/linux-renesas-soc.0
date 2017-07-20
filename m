Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:52354 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935939AbdGTM3I (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Jul 2017 08:29:08 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] arm64: renesas: Add Renesas R8A77995 Kconfig support
Date: Thu, 20 Jul 2017 14:29:01 +0200
Message-Id: <1500553741-21890-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
References: <1500553741-21890-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a configuration option for the R-Car D3 SoC.

Note that r8a77995 is the first Renesas "r8a<n>" SoC using a 5 digit
number in its Kconfig symbol, as r8a77990 will be a different SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index f5f0c813dfecc56c..a1c9f4ed7a887ab2 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -184,6 +184,12 @@ config ARCH_R8A7796
 	help
 	  This enables support for the Renesas R-Car M3-W SoC.
 
+config ARCH_R8A77995
+	bool "Renesas R-Car D3 SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas R-Car D3 SoC.
+
 config ARCH_STRATIX10
 	bool "Altera's Stratix 10 SoCFPGA Family"
 	help
-- 
2.7.4
