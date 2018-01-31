Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:44392 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbeAaT7H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Jan 2018 14:59:07 -0500
Received: by mail-lf0-f68.google.com with SMTP id v188so22577700lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jan 2018 11:59:06 -0800 (PST)
Subject: [PATCH 2/2] arm64: add Renesas R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Message-ID: <4bf1d0e3-7389-cd24-ff6a-c750d8ea42d6@cogentembedded.com>
Date: Wed, 31 Jan 2018 22:59:03 +0300
MIME-Version: 1.0
In-Reply-To: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a configuration option for the R-Car V3H (R8A77980) SoC.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 arch/arm64/Kconfig.platforms |    6 ++++++
 1 file changed, 6 insertions(+)

Index: renesas/arch/arm64/Kconfig.platforms
===================================================================
--- renesas.orig/arch/arm64/Kconfig.platforms
+++ renesas/arch/arm64/Kconfig.platforms
@@ -195,6 +195,12 @@ config ARCH_R8A77970
 	help
 	  This enables support for the Renesas R-Car V3M SoC.
 
+config ARCH_R8A77980
+	bool "Renesas R-Car V3H SoC Platform"
+	depends on ARCH_RENESAS
+	help
+	  This enables support for the Renesas R-Car V3H SoC.
+
 config ARCH_R8A77995
 	bool "Renesas R-Car D3 SoC Platform"
 	depends on ARCH_RENESAS
