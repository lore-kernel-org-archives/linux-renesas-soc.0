Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42178 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755662AbdJJIMW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 04:12:22 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] ARM: shmobile: rcar-gen2: fix non-SMP build
Date: Tue, 10 Oct 2017 10:12:15 +0200
Message-Id: <dc15ca962757ca72a4492b2e13be2eecc6dcd716.1507623048.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1507623048.git.horms+renesas@verge.net.au>
References: <cover.1507623048.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Arnd Bergmann <arnd@arndb.de>

A bugfix for the SMP case broke the build for the UP case:

arch/arm/mach-shmobile/headsmp-apmu.o: In function `shmobile_boot_apmu':
(.text+0x34): undefined reference to `secondary_startup'

The assembler file mixes code that is used for SMP with code
that we also need on a single-CPU build, so I'm leaving it
always enabled in the Makefile, but enclose the SMP code
in an #ifdef.

3fd45a136ff6 ("ARM: shmobile: rcar-gen2: Make sure CNTVOFF is initialized on CA7/15")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/mach-shmobile/headsmp-apmu.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-shmobile/headsmp-apmu.S b/arch/arm/mach-shmobile/headsmp-apmu.S
index db4743d2bf91..5672b5849401 100644
--- a/arch/arm/mach-shmobile/headsmp-apmu.S
+++ b/arch/arm/mach-shmobile/headsmp-apmu.S
@@ -31,7 +31,9 @@ ENTRY(shmobile_init_cntvoff)
 	ret	lr
 ENDPROC(shmobile_init_cntvoff)
 
+#ifdef CONFIG_SMP
 ENTRY(shmobile_boot_apmu)
 	bl	shmobile_init_cntvoff
 	b	secondary_startup
 ENDPROC(shmobile_boot_apmu)
+#endif
-- 
2.1.4
