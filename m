Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52474 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785AbcDZB3D (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 25 Apr 2016 21:29:03 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 09/11] soc: renesas: rcar-sysc: Add support for R-Car M2-N power areas
Date: Tue, 26 Apr 2016 11:28:44 +1000
Message-Id: <a247eb93ef73b56aab68c47608245e2b4a713585.1461632180.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461632180.git.horms+renesas@verge.net.au>
References: <cover.1461632180.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

R-Car M2-N is identical to R-Car M2-W w.r.t. power domains, so reuse the
definitions from the latter.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/Makefile    | 3 ++-
 drivers/soc/renesas/rcar-sysc.c | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 96463c05ee59..c6c4ce7ef8a1 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
 obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
-obj-$(CONFIG_ARCH_R8A7793)	+= rcar-sysc.o
+# R-Car M2-N is identical to R-Car M2-W w.r.t. power domains.
+obj-$(CONFIG_ARCH_R8A7793)	+= rcar-sysc.o r8a7791-sysc.o
 obj-$(CONFIG_ARCH_R8A7794)	+= rcar-sysc.o
diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 5b70b93a2aa7..d8eaf8b2ee20 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -293,6 +293,10 @@ static const struct of_device_id rcar_sysc_matches[] = {
 #ifdef CONFIG_ARCH_R8A7791
 	{ .compatible = "renesas,r8a7791-sysc", .data = &r8a7791_sysc_info },
 #endif
+#ifdef CONFIG_ARCH_R8A7793
+	/* R-Car M2-N is identical to R-Car M2-W w.r.t. power domains. */
+	{ .compatible = "renesas,r8a7793-sysc", .data = &r8a7791_sysc_info },
+#endif
 	{ /* sentinel */ }
 };
 
-- 
2.7.0.rc3.207.g0ac5344
