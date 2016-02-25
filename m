Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] arm64: defconfig: Add Renesas R-Car Gen3 USB 2.0 phy driver support
Date: Fri, 26 Feb 2016 08:51:57 +0900
Message-Id: <a9c42f02387ce8a231bce7c0901ef15fe4bfc3b4.1456442918.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1456442918.git.horms+renesas@verge.net.au>
References: <cover.1456442918.git.horms+renesas@verge.net.au>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 86581f793e39..eaf738a59927 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -213,6 +213,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_HISILICON_IRQ_MBIGEN=y
+CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_XGENE=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-- 
2.7.0.rc3.207.g0ac5344
