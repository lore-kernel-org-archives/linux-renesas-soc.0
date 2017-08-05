Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f173.google.com ([209.85.128.173]:38151 "EHLO
        mail-wr0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751401AbdHEUxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:18 -0400
Received: by mail-wr0-f173.google.com with SMTP id f21so27115525wrf.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:17 -0700 (PDT)
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
Subject: [PATCH 03/15] ARM: head-common.S: use PC-relative insn sequence for __turn_mmu_on
Date: Sat,  5 Aug 2017 21:52:10 +0100
Message-Id: <20170805205222.19868-4-ard.biesheuvel@linaro.org>
In-Reply-To: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the open coded PC relative offset calculations with a pair
of adr_l invocations.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/kernel/head.S | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 04286fd9e09c..0a98aec0e39d 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -227,11 +227,8 @@ __create_page_tables:
 	 * Create identity mapping to cater for __enable_mmu.
 	 * This identity mapping will be removed by paging_init().
 	 */
-	adr	r0, __turn_mmu_on_loc
-	ldmia	r0, {r3, r5, r6}
-	sub	r0, r0, r3			@ virt->phys offset
-	add	r5, r5, r0			@ phys __turn_mmu_on
-	add	r6, r6, r0			@ phys __turn_mmu_on_end
+	adr_l	r5, __turn_mmu_on		@ _pa(__turn_mmu_on)
+	adr_l	r6, __turn_mmu_on_end		@ _pa(__turn_mmu_on_end)
 	mov	r5, r5, lsr #SECTION_SHIFT
 	mov	r6, r6, lsr #SECTION_SHIFT
 
@@ -354,11 +351,6 @@ __create_page_tables:
 	ret	lr
 ENDPROC(__create_page_tables)
 	.ltorg
-	.align
-__turn_mmu_on_loc:
-	.long	.
-	.long	__turn_mmu_on
-	.long	__turn_mmu_on_end
 
 #if defined(CONFIG_SMP)
 	.text
-- 
2.11.0
