Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:36320 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752728AbdHEUxZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 5 Aug 2017 16:53:25 -0400
Received: by mail-wr0-f174.google.com with SMTP id y43so27167955wrd.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Aug 2017 13:53:24 -0700 (PDT)
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
Subject: [PATCH 05/15] ARM: head: use PC-relative insn sequence for __smp_alt
Date: Sat,  5 Aug 2017 21:52:12 +0100
Message-Id: <20170805205222.19868-6-ard.biesheuvel@linaro.org>
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
index 6e9df3663a57..aed341e0f530 100644
--- a/arch/arm/kernel/head.S
+++ b/arch/arm/kernel/head.S
@@ -523,19 +523,11 @@ ARM_BE8(rev	r0, r0)			@ byteswap if big endian
 	retne	lr
 
 __fixup_smp_on_up:
-	adr	r0, 1f
-	ldmia	r0, {r3 - r5}
-	sub	r3, r0, r3
-	add	r4, r4, r3
-	add	r5, r5, r3
+	adr_l	r4, __smpalt_begin
+	adr_l	r5, __smpalt_end
 	b	__do_fixup_smp_on_up
 ENDPROC(__fixup_smp)
 
-	.align
-1:	.word	.
-	.word	__smpalt_begin
-	.word	__smpalt_end
-
 	.pushsection .data
 	.globl	smp_on_up
 smp_on_up:
-- 
2.11.0
