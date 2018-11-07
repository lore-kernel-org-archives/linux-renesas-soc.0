Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:48142 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbeKGTrG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 14:47:06 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL 1/2] arm64: renesas_defconfig: Drop CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
Date: Wed,  7 Nov 2018 11:17:17 +0100
Message-Id: <20181107101718.2412-2-geert+renesas@glider.be>
In-Reply-To: <20181107101718.2412-1-geert+renesas@glider.be>
References: <20181107101718.2412-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CONFIG_ARM_BIG_LITTLE_CPUFREQ was removed on arm64 in commit
a7314405d83c8f95 ("cpufreq: drop ARM_BIG_LITTLE_CPUFREQ support for
ARM64").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
---
 arch/arm64/configs/renesas_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index a8113a721c11b812..0021497c967ea1a6 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -69,7 +69,6 @@ CONFIG_CPU_IDLE=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
-CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
 # CONFIG_DMIID is not set
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=y
-- 
2.17.1
