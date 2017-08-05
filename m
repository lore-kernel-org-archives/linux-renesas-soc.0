Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f175.google.com ([209.85.128.175]:38155 "EHLO
        mail-wr0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752708AbdHEUxV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:21 -0400
Received: by mail-wr0-f175.google.com with SMTP id f21so27115745wrf.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:21 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, krzk@kernel.org,
        jason@lakedaemon.net, arm@kernel.org, andrew@lunn.ch,
        gregory.clement@free-electrons.com,
        sebastian.hesselbarth@gmail.com, tony@atomide.com,
        baohua@kernel.org, horms@verge.net.au, magnus.damm@gmail.com,
        vireshk@kernel.org, shiraz.linux.kernel@gmail.com,
        patrice.chotard@st.com, nico@linaro.org, dave.martin@arm.com,
        marc.zyngier@arm.com
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: [PATCH 04/15] ARM: head.S: use PC-relative insn sequence for secondary_data
Date: Sat,  5 Aug 2017 21:52:11 +0100
Message-Id: <20170805205222.19868-5-ard.biesheuvel@linaro.org>
In-Reply-To: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the open coded PC relative offset calculations with adr_l
and ldr_l invocations.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/kernel/head.S | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 0a98aec0e39d..6e9df3663a57 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -386,10 +386,8 @@ ENTRY(secondary_startup)
 	/*
 	 * Use the page tables supplied from  __cpu_up.
 	 */
-	adr	r4, __secondary_data
-	ldmia	r4, {r5, r7, r12}		@ address to jump to after
-	sub	lr, r4, r5			@ mmu has been enabled
-	add	r3, r7, lr
+	adr_l	r3, secondary_data
+	mov_l	r12, __secondary_switched
 	ldrd	r4, [r3, #0]			@ get secondary_data.pgdir
 ARM_BE8(eor	r4, r4, r5)			@ Swap r5 and r4 in BE:
 ARM_BE8(eor	r5, r4, r5)			@ it can be done in 3 steps
@@ -404,22 +402,13 @@ ARM_BE8(eor	r4, r4, r5)			@ without using a temp reg.
 ENDPROC(secondary_startup)
 ENDPROC(secondary_startup_arm)
 
-	/*
-	 * r6  = &secondary_data
-	 */
 ENTRY(__secondary_switched)
-	ldr	sp, [r7, #12]			@ get secondary_data.stack
+	ldr_l	r7, secondary_data + 12		@ get secondary_data.stack
+	mov	sp, r7
 	mov	fp, #0
 	b	secondary_start_kernel
 ENDPROC(__secondary_switched)
 
-	.align
-
-	.type	__secondary_data, %object
-__secondary_data:
-	.long	.
-	.long	secondary_data
-	.long	__secondary_switched
 #endif /* defined(CONFIG_SMP) */
 
 
-- 
2.11.0
