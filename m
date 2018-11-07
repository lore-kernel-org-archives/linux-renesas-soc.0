Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:48138 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726225AbeKGTrF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 14:47:05 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH LOCAL 2/2] arm64: renesas_defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
Date: Wed,  7 Nov 2018 11:17:18 +0100
Message-Id: <20181107101718.2412-3-geert+renesas@glider.be>
In-Reply-To: <20181107101718.2412-1-geert+renesas@glider.be>
References: <20181107101718.2412-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable R-Car Gen3 PCIe PHY support, which is needed for PCIe to function
on the Renesas Condor board.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 0021497c967ea1a6..db66d9a37bac4112 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -300,6 +300,7 @@ CONFIG_MAX9611=y
 CONFIG_PWM=y
 CONFIG_PWM_RCAR=y
 CONFIG_RESET_CONTROLLER=y
+CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
 CONFIG_TEE=y
-- 
2.17.1
