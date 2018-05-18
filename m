Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33804 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751473AbeERLUH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 May 2018 07:20:07 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 14/14] soc: renesas: r8a77990-sysc: Add workaround for 3DG-{A,B}
Date: Fri, 18 May 2018 13:18:12 +0200
Message-Id: <086b399965a7ee7e50c3b3c57f2dba30ff0334b0.1526639075.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1526639075.git.horms+renesas@verge.net.au>
References: <cover.1526639075.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This patch adds workaround for 3DG-{A,B} of R-Car E3 ES1.0 because
the SoC has a restriction about the order.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a77990-sysc.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/r8a77990-sysc.c b/drivers/soc/renesas/r8a77990-sysc.c
index a8c6417fcd2b..15579ebc5ed2 100644
--- a/drivers/soc/renesas/r8a77990-sysc.c
+++ b/drivers/soc/renesas/r8a77990-sysc.c
@@ -7,12 +7,13 @@
 
 #include <linux/bug.h>
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a77990-sysc.h>
 
 #include "rcar-sysc.h"
 
-static const struct rcar_sysc_area r8a77990_areas[] __initconst = {
+static struct rcar_sysc_area r8a77990_areas[] __initdata = {
 	{ "always-on",	    0, 0, R8A77990_PD_ALWAYS_ON, -1, PD_ALWAYS_ON },
 	{ "ca53-scu",	0x140, 0, R8A77990_PD_CA53_SCU,  R8A77990_PD_ALWAYS_ON,
 	  PD_SCU },
@@ -27,7 +28,41 @@ static const struct rcar_sysc_area r8a77990_areas[] __initconst = {
 	{ "3dg-b",	0x100, 1, R8A77990_PD_3DG_B,	R8A77990_PD_3DG_A },
 };
 
+static void __init rcar_sysc_fix_parent(struct rcar_sysc_area *areas,
+					unsigned int num_areas, u8 id,
+					int new_parent)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_areas; i++)
+		if (areas[i].isr_bit == id) {
+			areas[i].parent = new_parent;
+			return;
+		}
+}
+
+/* Fixups for R-Car E3 ES1.0 revision */
+static const struct soc_device_attribute r8a77990[] __initconst = {
+	{ .soc_id = "r8a77990", .revision = "ES1.0" },
+	{ /* sentinel */ }
+};
+
+static int __init r8a77990_sysc_init(void)
+{
+	if (soc_device_match(r8a77990)) {
+		rcar_sysc_fix_parent(r8a77990_areas,
+				     ARRAY_SIZE(r8a77990_areas),
+				     R8A77990_PD_3DG_A, R8A77990_PD_3DG_B);
+		rcar_sysc_fix_parent(r8a77990_areas,
+				     ARRAY_SIZE(r8a77990_areas),
+				     R8A77990_PD_3DG_B, R8A77990_PD_ALWAYS_ON);
+	}
+
+	return 0;
+}
+
 const struct rcar_sysc_info r8a77990_sysc_info __initconst = {
+	.init = r8a77990_sysc_init,
 	.areas = r8a77990_areas,
 	.num_areas = ARRAY_SIZE(r8a77990_areas),
 };
-- 
2.11.0
