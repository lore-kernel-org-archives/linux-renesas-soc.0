Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] ARM: vexpress_defconfig: Cleanup from non-existing options
Date: Mon, 17 Jul 2017 07:49:54 +0200
Message-Id: <1500270596-22384-4-git-send-email-krzk@kernel.org>
In-Reply-To: <1500270596-22384-1-git-send-email-krzk@kernel.org>
References: <1500270596-22384-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ARCH_VEXPRESS_CA9X4 is gone since commit 81cc3f868d30 ("ARM: vexpress:
Remove non-DT code").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/vexpress_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/vexpress_defconfig b/arch/arm/configs/vexpress_defconfig
index 0fa0ed577b15..edae1c58fe80 100644
--- a/arch/arm/configs/vexpress_defconfig
+++ b/arch/arm/configs/vexpress_defconfig
@@ -19,7 +19,6 @@ CONFIG_MODULE_UNLOAD=y
 # CONFIG_IOSCHED_DEADLINE is not set
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_VEXPRESS=y
-CONFIG_ARCH_VEXPRESS_CA9X4=y
 CONFIG_ARCH_VEXPRESS_DCSCB=y
 CONFIG_ARCH_VEXPRESS_TC2_PM=y
 # CONFIG_SWP_EMULATE is not set
-- 
2.7.4
