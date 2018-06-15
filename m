Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:43018 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755739AbeFOJkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jun 2018 05:40:17 -0400
Received: by mail-wr0-f169.google.com with SMTP id d2-v6so9243785wrm.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jun 2018 02:40:16 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, u-boot@lists.denx.de
Cc: geert@linux-m68k.org, marek.vasut@gmail.com,
        yoshihiro.shimoda.uh@renesas.com, magnus.damm@gmail.com,
        takuya.sakata.wz@bp.renesas.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [RFC ATF] Add SMCCC_RENESAS_MEMCONF SMC call
Date: Fri, 15 Jun 2018 11:40:05 +0200
Message-Id: <1529055605-29942-2-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1529055605-29942-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Returns the memory configuration for Renesas R8A7795 (R-Car H3) SoCs,
revision 3.0 and up.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
See "[RFC] ARM: rmobile: create DT memory nodes for R8A7795 3.0 and newer"
for an explanation of this.

CU
Uli


 include/services/arm_arch_svc.h            |  1 +
 services/arm_arch_svc/arm_arch_svc_setup.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/services/arm_arch_svc.h b/include/services/arm_arch_svc.h
index 2961601..9132336 100644
--- a/include/services/arm_arch_svc.h
+++ b/include/services/arm_arch_svc.h
@@ -10,5 +10,6 @@
 #define SMCCC_VERSION			U(0x80000000)
 #define SMCCC_ARCH_FEATURES		U(0x80000001)
 #define SMCCC_ARCH_WORKAROUND_1		U(0x80008000)
+#define SMCCC_RENESAS_MEMCONF		U(0x82000000)
 
 #endif /* __ARM_ARCH_SVC_H__ */
diff --git a/services/arm_arch_svc/arm_arch_svc_setup.c b/services/arm_arch_svc/arm_arch_svc_setup.c
index eedac86..f836ae8 100644
--- a/services/arm_arch_svc/arm_arch_svc_setup.c
+++ b/services/arm_arch_svc/arm_arch_svc_setup.c
@@ -56,6 +56,20 @@ uintptr_t arm_arch_svc_smc_handler(uint32_t smc_fid,
 		 */
 		SMC_RET0(handle);
 #endif
+	case SMCCC_RENESAS_MEMCONF:
+#if (RCAR_DRAM_LPDDR4_MEMCONF == 0)
+		/* 4GB(1GBx4) */
+		SMC_RET1(handle, 1);
+#elif (RCAR_DRAM_LPDDR4_MEMCONF == 1) && (RCAR_DRAM_CHANNEL == 5) && \
+	(RCAR_DRAM_SPLIT == 2)
+		/* 4GB(2GBx2 2ch split) */
+		SMC_RET1(handle, 2);
+#elif (RCAR_DRAM_LPDDR4_MEMCONF == 1) && (RCAR_DRAM_CHANNEL == 15)
+		/* 8GB(2GBx4: default) */
+		SMC_RET1(handle, 3);
+#else
+		SMC_RET1(handle, 0);
+#endif /* RCAR_DRAM_LPDDR4_MEMCONF == 0 */
 	default:
 		WARN("Unimplemented Arm Architecture Service Call: 0x%x \n",
 			smc_fid);
-- 
2.7.4
