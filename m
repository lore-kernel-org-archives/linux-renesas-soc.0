Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55731 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbeLFV5O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Dec 2018 16:57:14 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/3] arm64: defconfig: Enable R-Car thermal driver
Date: Thu,  6 Dec 2018 13:57:06 -0800
Message-Id: <92bd057d2d0a6b200b041b666a3e8f91cb3d8907.1544126077.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1544126077.git.horms+renesas@verge.net.au>
References: <cover.1544126077.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the R-Car thermal driver as a module.

This driver is used in conjunction with the R-Car V3M (r8a77970),
E3 (r8a77990) and D3 (r8a77995) SoCs.

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9a57d11330b..f88190463481 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -377,6 +377,7 @@ CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_THERMAL_EMULATION=y
 CONFIG_ROCKCHIP_THERMAL=m
+CONFIG_RCAR_THERMAL=m
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_ARMADA_THERMAL=y
 CONFIG_BRCMSTB_THERMAL=m
-- 
2.11.0
