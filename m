Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36808 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdHEUxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:15 -0400
Received: by mail-wm0-f45.google.com with SMTP id t201so42445967wmt.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:14 -0700 (PDT)
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
Subject: [PATCH 02/15] ARM: head-common.S: use PC-relative insn sequence for __proc_info
Date: Sat,  5 Aug 2017 21:52:09 +0100
Message-Id: <20170805205222.19868-3-ard.biesheuvel@linaro.org>
In-Reply-To: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the open coded PC relative offset calculations with a pair
of adr_l invocations.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/kernel/head-common.S | 22 ++++++--------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/arch/arm/kernel/head-common.S b/arch/arm/kernel/head-common.S
index 8733012d231f..06035488130c 100644
--- a/arch/arm/kernel/head-common.S
+++ b/arch/arm/kernel/head-common.S
@@ -150,11 +150,12 @@ ENDPROC(lookup_processor_type)
  *	r9 = cpuid (preserved)
  */
 __lookup_processor_type:
-	adr	r3, __lookup_processor_type_data
-	ldmia	r3, {r4 - r6}
-	sub	r3, r3, r4			@ get offset between virt&phys
-	add	r5, r5, r3			@ convert virt addresses to
-	add	r6, r6, r3			@ physical address space
+	/*
+	 * Look in <asm/procinfo.h> for information about the __proc_info
+	 * structure.
+	 */
+	adr_l	r5, __proc_info_begin
+	adr_l	r6, __proc_info_end
 1:	ldmia	r5, {r3, r4}			@ value, mask
 	and	r4, r4, r9			@ mask wanted bits
 	teq	r3, r4
@@ -166,17 +167,6 @@ __lookup_processor_type:
 2:	ret	lr
 ENDPROC(__lookup_processor_type)
 
-/*
- * Look in <asm/procinfo.h> for information about the __proc_info structure.
- */
-	.align	2
-	.type	__lookup_processor_type_data, %object
-__lookup_processor_type_data:
-	.long	.
-	.long	__proc_info_begin
-	.long	__proc_info_end
-	.size	__lookup_processor_type_data, . - __lookup_processor_type_data
-
 __error_lpae:
 #ifdef CONFIG_DEBUG_LL
 	adr	r0, str_lpae
-- 
2.11.0
