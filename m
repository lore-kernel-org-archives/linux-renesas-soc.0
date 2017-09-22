Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:54504 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752600AbdIVVgi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Sep 2017 17:36:38 -0400
Received: by mail-lf0-f44.google.com with SMTP id k23so2269138lfi.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Sep 2017 14:36:38 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20170922213634.084486879@cogentembedded.com>
Date: Sat, 23 Sep 2017 00:36:25 +0300
To: Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] arm64: defconfig: enable R8A77970 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Disposition: inline; filename=arm64-defconfig-enable-Renesas-R8A77970-SoC.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the Renesas R-Car V3M (R8A77970) SoC in the ARM64 defconfig.

Suggested-by: Simon Horman <horms@verge.net.au>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the ARM64 repo's 'for-next/core' branch plus the patch
enabling R8A77995 SoC (https://patchwork.kernel.org/patch/9905747/).

 arch/arm64/configs/defconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux/arch/arm64/configs/defconfig
===================================================================
--- linux.orig/arch/arm64/configs/defconfig
+++ linux/arch/arm64/configs/defconfig
@@ -50,6 +50,7 @@ CONFIG_ARCH_SEATTLE=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A7795=y
 CONFIG_ARCH_R8A7796=y
+CONFIG_ARCH_R8A77970=y
 CONFIG_ARCH_R8A77995=y
 CONFIG_ARCH_STRATIX10=y
 CONFIG_ARCH_TEGRA=y
