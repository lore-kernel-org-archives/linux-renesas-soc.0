Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36853 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752756AbdHEUxf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:35 -0400
Received: by mail-wm0-f51.google.com with SMTP id t201so42448836wmt.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:35 -0700 (PDT)
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
Subject: [PATCH 08/15] ARM: head.S: use PC relative insn sequence to calculate PHYS_OFFSET
Date: Sat,  5 Aug 2017 21:52:15 +0100
Message-Id: <20170805205222.19868-9-ard.biesheuvel@linaro.org>
In-Reply-To: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the open coded arithmetic with a simple adr_l/sub pair.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/kernel/head.S | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
index 939543e73874..e08a4623a980 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -106,10 +106,8 @@ ENTRY(stext)
 #endif
 
 #ifndef CONFIG_XIP_KERNEL
-	adr	r3, 2f
-	ldmia	r3, {r4, r8}
-	sub	r4, r3, r4			@ (PHYS_OFFSET - PAGE_OFFSET)
-	add	r8, r8, r4			@ PHYS_OFFSET
+	adr_l	r8, _text			@ __pa(_text)
+	sub	r8, r8, #TEXT_OFFSET		@ PHYS_OFFSET
 #else
 	ldr	r8, =PLAT_PHYS_OFFSET		@ always constant in this case
 #endif
@@ -161,10 +159,6 @@ ENTRY(stext)
 1:	b	__enable_mmu
 ENDPROC(stext)
 	.ltorg
-#ifndef CONFIG_XIP_KERNEL
-2:	.long	.
-	.long	PAGE_OFFSET
-#endif
 
 /*
  * Setup the initial page tables.  We only setup the barest
-- 
2.11.0
