Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33050 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbeIAADr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 20:03:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id m26-v6so10881083lfb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Aug 2018 12:54:46 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: enable CMT/TMU support for Renesas SoC
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>
Message-ID: <ebd7d1f7-d99b-f0a1-f05e-d822254b2e86@cogentembedded.com>
Date: Fri, 31 Aug 2018 22:54:42 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Renesas R-Car gen3 SoCs have both CMT and TMU timers, so we have to enable
building them in Kconfig.platforms (as they don't normally have the prompts
in Kconfig).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the ARM64 repo's 'for-next/core' branch.

 arch/arm64/Kconfig.platforms |    2 ++
 1 file changed, 2 insertions(+)

Index: linux/arch/arm64/Kconfig.platforms
===================================================================
--- linux.orig/arch/arm64/Kconfig.platforms
+++ linux/arch/arm64/Kconfig.platforms
@@ -175,6 +175,8 @@ config ARCH_RENESAS
 	select PM_GENERIC_DOMAINS
 	select RENESAS_IRQC
 	select SOC_BUS
+	select SYS_SUPPORTS_SH_CMT
+	select SYS_SUPPORTS_SH_TMU
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
