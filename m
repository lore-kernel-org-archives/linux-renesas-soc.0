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
Subject: [PATCH 5/6] ARM: ezx_defconfig: Cleanup from non-existing options
Date: Mon, 17 Jul 2017 07:49:55 +0200
Message-Id: <1500270596-22384-5-git-send-email-krzk@kernel.org>
In-Reply-To: <1500270596-22384-1-git-send-email-krzk@kernel.org>
References: <1500270596-22384-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CPU_FREQ_DEBUG is gone since commit 2d06d8c49afd  ("[CPUFREQ] use
dynamic debug instead of custom infrastructure").

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/ezx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/ezx_defconfig b/arch/arm/configs/ezx_defconfig
index 23660f3d0f7f..484e51fbd4a6 100644
--- a/arch/arm/configs/ezx_defconfig
+++ b/arch/arm/configs/ezx_defconfig
@@ -27,7 +27,6 @@ CONFIG_ZBOOT_ROM_BSS=0x0
 CONFIG_CMDLINE="console=tty1 root=/dev/mmcblk0p2 rootfstype=ext2 rootdelay=3 ip=192.168.0.202:192.168.0.200:192.168.0.200:255.255.255.0 debug"
 CONFIG_KEXEC=y
 CONFIG_CPU_FREQ=y
-CONFIG_CPU_FREQ_DEBUG=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=m
 CONFIG_CPU_FREQ_GOV_USERSPACE=m
 CONFIG_CPU_FREQ_GOV_ONDEMAND=m
-- 
2.7.4
