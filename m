Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:38326 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751399AbdGRN3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 09:29:25 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: rcar-gen2: Correct arch timer frequency on RZ/G1E
Date: Tue, 18 Jul 2017 15:29:17 +0200
Message-Id: <1500384557-22123-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the datasheet, the frequency of the ARM architecture timer
on RZ/G1E depends on the frequency of the ZS clock, just like on R-Car
E2 and V2H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.

v2:
  - Rebased to avoid dependencies.
---
 arch/arm/mach-shmobile/setup-rcar-gen2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-shmobile/setup-rcar-gen2.c b/arch/arm/mach-shmobile/setup-rcar-gen2.c
index 3bd505da31726869..7ab1690fab8299eb 100644
--- a/arch/arm/mach-shmobile/setup-rcar-gen2.c
+++ b/arch/arm/mach-shmobile/setup-rcar-gen2.c
@@ -70,7 +70,8 @@ void __init rcar_gen2_timer_init(void)
 	void __iomem *base;
 	u32 freq;
 
-	if (of_machine_is_compatible("renesas,r8a7792") ||
+	if (of_machine_is_compatible("renesas,r8a7745") ||
+	    of_machine_is_compatible("renesas,r8a7792") ||
 	    of_machine_is_compatible("renesas,r8a7794")) {
 		freq = 260000000 / 8;	/* ZS / 8 */
 		/* CNTVOFF has to be initialized either from non-secure
-- 
2.7.4
