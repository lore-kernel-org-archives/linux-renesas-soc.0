Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35094 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752821AbdHEUxq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:46 -0400
Received: by mail-wm0-f47.google.com with SMTP id m85so42482228wma.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:45 -0700 (PDT)
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
Subject: [PATCH 11/15] arm-soc: mvebu: replace open coded VA->PA conversion
Date: Sat,  5 Aug 2017 21:52:18 +0100
Message-Id: <20170805205222.19868-12-ard.biesheuvel@linaro.org>
In-Reply-To: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
References: <20170805205222.19868-1-ard.biesheuvel@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This replaces an open coded calculation to obtain the physical
address of a far symbol with a call to the new ldr_l etc macro.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm/mach-mvebu/coherency_ll.S | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/arm/mach-mvebu/coherency_ll.S b/arch/arm/mach-mvebu/coherency_ll.S
index 8b2fbc8b6bc6..df0ccb5cef1d 100644
--- a/arch/arm/mach-mvebu/coherency_ll.S
+++ b/arch/arm/mach-mvebu/coherency_ll.S
@@ -42,9 +42,7 @@ ENTRY(ll_get_coherency_base)
 	ldr	r1, =coherency_base
 	cmp	r1, #0
 	beq	2f
-	adr	r1, 3f
-	ldr	r3, [r1]
-	ldr	r1, [r1, r3]
+	ldr_l	r1, coherency_phys_base
 	b	2f
 1:
 	/*
@@ -160,7 +158,3 @@ ENTRY(ll_disable_coherency)
 	dsb
 	ret	lr
 ENDPROC(ll_disable_coherency)
-
-	.align 2
-3:
-	.long	coherency_phys_base - .
-- 
2.11.0
