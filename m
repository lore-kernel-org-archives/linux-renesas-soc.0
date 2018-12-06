Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbeLFV77 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:59:59 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/9] arm64: renesas: Enable GPIOLIB to allow GPIO driver selection
Date: Thu,  6 Dec 2018 13:59:26 -0800
Message-Id: <9374eee32b666c92cf821a98eb3aeaa0bf4d5dd5.1544132474.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544132474.git.horms+renesas@verge.net.au>
References: <cover.1544132474.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

The R-Car GPIO driver cannot be enabled when Renesas SoC's ARCH configs
(ARCH_RENESAS, ARCH_R8A7795, ARCH_R8A7796 and ARCH_R8A77965) are enabled
only.

As GPIOs are a critical resource for proper operation on Renesas
platforms, this patch selects GPIOLIB, just like is done for other SoC
vendors, and on Renesas arm32 SoCs.

Reported-by: Alexandru Gheorghe <Alexandru_Gheorghe@mentor.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
[geert: Improve patch description]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 51bc479334a4..2eb02734ae45 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -157,6 +157,7 @@ config ARCH_REALTEK
 
 config ARCH_RENESAS
 	bool "Renesas SoC Platforms"
+	select GPIOLIB
 	select PINCTRL
 	select PM
 	select PM_GENERIC_DOMAINS
-- 
2.11.0
