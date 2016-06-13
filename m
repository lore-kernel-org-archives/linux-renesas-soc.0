Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:43521 "EHLO
	andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964910AbcFMKbY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 13 Jun 2016 06:31:24 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: shmobile: rcar-gen2: Correct arch timer frequency on R-Car V2H
Date: Mon, 13 Jun 2016 12:31:12 +0200
Message-Id: <1465813872-11937-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the datasheet, the frequency of the ARM architecture timer
on R-Car V2H depends on the frequency of the ZS clock, just like on
R-Car E2.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Against renesas-devel-20160613-v4.7-rc3 with "ARM: shmobile: rcar-gen2:
Obtain extal frequency from DT" applied.

Untested due to lack of hardware.
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index ea092d5dd475042d..afb9fdcd3d9084e2 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -76,7 +76,8 @@ void __init rcar_gen2_timer_init(void)
 	void __iomem *base;
 	u32 freq;
 
-	if (of_machine_is_compatible("renesas,r8a7794")) {
+	if (of_machine_is_compatible("renesas,r8a7792") ||
+	    of_machine_is_compatible("renesas,r8a7794")) {
 		freq = 260000000 / 8;	/* ZS / 8 */
 		/* CNTVOFF has to be initialized either from non-secure
 		 * Hypervisor mode or secure Monitor mode with SCR.NS==1.
-- 
1.9.1
