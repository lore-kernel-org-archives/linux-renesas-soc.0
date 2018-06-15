Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51902 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755735AbeFOJkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 05:40:15 -0400
Received: by mail-wm0-f65.google.com with SMTP id r15-v6so2521073wmc.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jun 2018 02:40:14 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, u-boot@lists.denx.de
Cc: geert@linux-m68k.org, marek.vasut@gmail.com,
        yoshihiro.shimoda.uh@renesas.com, magnus.damm@gmail.com,
        takuya.sakata.wz@bp.renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and newer
Date: Fri, 15 Jun 2018 11:40:04 +0200
Message-Id: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Uses an SMC call to the ATF to determine the memory configuration, then
creates appropriate DT memory nodes.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
This is an attempt to avoid having to have a ton of different device trees
for Renesas R8A7795 H3 SoCs from revision 3.0, which come in a number of
different memory configurations.

The specific configuration is statically baked into the ARM Trusted Firmware
binary, so this solution adds an SMC "SiP Service Call" to the ATF returning
the memory configuration, and then has u-boot build appropriate memory nodes.

This has not been tested in the flesh successfully, as I only have a revision
1.0 board. I'd like to get some feedback on whether this approach is sound,
though. Thanks.

Depends on "[RFC ATF] Add SMCCC_RENESAS_MEMCONF SMC call".

CU
Uli



 board/renesas/salvator-x/salvator-x.c | 51 +++++++++++++++++++++++++++++++++++
 configs/r8a7795_salvator-x_defconfig  |  2 ++
 2 files changed, 53 insertions(+)

diff --git a/board/renesas/salvator-x/salvator-x.c b/board/renesas/salvator-x/salvator-x.c
index 651877c..307cb64 100644
--- a/board/renesas/salvator-x/salvator-x.c
+++ b/board/renesas/salvator-x/salvator-x.c
@@ -24,6 +24,7 @@
 #include <asm/arch/sh_sdhi.h>
 #include <i2c.h>
 #include <mmc.h>
+#include <linux/arm-smccc.h>
 
 DECLARE_GLOBAL_DATA_PTR;
 
@@ -136,3 +137,53 @@ void reset_cpu(ulong addr)
 	writel(RST_CODE, RST_CA57RESCNT);
 #endif
 }
+
+#define ARM_SMCCC_RENESAS_MEMCONF	0x82000000UL
+int ft_board_setup(void *blob, bd_t *bd)
+{
+	if (rmobile_get_cpu_type() == RMOBILE_CPU_TYPE_R8A7795 &&
+	    rmobile_get_cpu_rev_integer() >= 3) {
+		u64 base[CONFIG_NR_DRAM_BANKS];
+		u64 size[CONFIG_NR_DRAM_BANKS];
+		struct arm_smccc_res res;
+
+		arm_smccc_smc(ARM_SMCCC_RENESAS_MEMCONF,
+			      0, 0, 0, 0, 0, 0, 0, &res);
+
+		switch (res.a0) {
+		case 1:
+			base[0] = 0x048000000ULL;
+			size[0] = 0x038000000ULL;
+			base[1] = 0x500000000ULL;
+			size[1] = 0x040000000ULL;
+			base[2] = 0x600000000ULL;
+			size[2] = 0x040000000ULL;
+			base[3] = 0x700000000ULL;
+			size[3] = 0x040000000ULL;
+			fdt_fixup_memory_banks(blob, base, size, 4);
+			break;
+		case 2:
+			base[0] = 0x048000000ULL;
+			size[0] = 0x078000000ULL;
+			base[1] = 0x500000000ULL;
+			size[1] = 0x080000000ULL;
+			fdt_fixup_memory_banks(blob, base, size, 2);
+			break;
+		case 3:
+			base[0] = 0x048000000ULL;
+			size[0] = 0x078000000ULL;
+			base[1] = 0x500000000ULL;
+			size[1] = 0x080000000ULL;
+			base[2] = 0x600000000ULL;
+			size[2] = 0x080000000ULL;
+			base[3] = 0x700000000ULL;
+			size[3] = 0x080000000ULL;
+			fdt_fixup_memory_banks(blob, base, size, 4);
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
diff --git a/configs/r8a7795_salvator-x_defconfig b/configs/r8a7795_salvator-x_defconfig
index fdfa41c..cd2bb59 100644
--- a/configs/r8a7795_salvator-x_defconfig
+++ b/configs/r8a7795_salvator-x_defconfig
@@ -61,3 +61,5 @@ CONFIG_USB_EHCI_GENERIC=y
 CONFIG_USB_STORAGE=y
 CONFIG_OF_LIBFDT_OVERLAY=y
 CONFIG_SMBIOS_MANUFACTURER=""
+CONFIG_OF_BOARD_SETUP=y
+CONFIG_ARM_SMCCC=y
-- 
2.7.4
