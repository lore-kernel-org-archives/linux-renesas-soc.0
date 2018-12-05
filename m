Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:38236 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728000AbeLEPuc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:32 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 2/7] soc: renesas: r8a7795-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:23 +0100
Message-Id: <20181205155028.14335-3-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
H3, to prevent conflicts between internal and external power requests.

This register does not exist on R-Car H3 ES1.x and ES2.x.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a7795-sysc.c | 32 +++++++++++++++++++++++++-----
 drivers/soc/renesas/rcar-sysc.h    |  2 +-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/renesas/r8a7795-sysc.c b/drivers/soc/renesas/r8a7795-sysc.c
index cda27a67de9876af..7e15cd09c4eb4780 100644
--- a/drivers/soc/renesas/r8a7795-sysc.c
+++ b/drivers/soc/renesas/r8a7795-sysc.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016-2017 Glider bvba
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
 #include <linux/sys_soc.h>
@@ -51,25 +52,46 @@ static struct rcar_sysc_area r8a7795_areas[] __initdata = {
 
 
 	/*
-	 * Fixups for R-Car H3 revisions after ES1.x
+	 * Fixups for R-Car H3 revisions
 	 */
 
-static const struct soc_device_attribute r8a7795es1[] __initconst = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*" },
+#define HAS_A2VC0	BIT(0)		/* Power domain A2VC0 is present */
+#define NO_EXTMASK	BIT(1)		/* Missing SYSCEXTMASK register */
+
+static const struct soc_device_attribute r8a7795_quirks_match[] __initconst = {
+	{
+		.soc_id = "r8a7795", .revision = "ES1.*",
+		.data = (void *)(HAS_A2VC0 | NO_EXTMASK),
+	}, {
+		.soc_id = "r8a7795", .revision = "ES2.*",
+		.data = (void *)(NO_EXTMASK),
+	},
 	{ /* sentinel */ }
 };
 
 static int __init r8a7795_sysc_init(void)
 {
-	if (!soc_device_match(r8a7795es1))
+	const struct soc_device_attribute *attr;
+	u32 quirks = 0;
+
+	attr = soc_device_match(r8a7795_quirks_match);
+	if (attr)
+		quirks = (uintptr_t)attr->data;
+
+	if (!(quirks & HAS_A2VC0))
 		rcar_sysc_nullify(r8a7795_areas, ARRAY_SIZE(r8a7795_areas),
 				  R8A7795_PD_A2VC0);
 
+	if (quirks & NO_EXTMASK)
+		r8a7795_sysc_info.extmask_val = 0;
+
 	return 0;
 }
 
-const struct rcar_sysc_info r8a7795_sysc_info __initconst = {
+struct rcar_sysc_info r8a7795_sysc_info __initdata = {
 	.init = r8a7795_sysc_init,
 	.areas = r8a7795_areas,
 	.num_areas = ARRAY_SIZE(r8a7795_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 21ee3ff8620bbafe..499797a9e18c2f10 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -59,7 +59,7 @@ extern const struct rcar_sysc_info r8a7790_sysc_info;
 extern const struct rcar_sysc_info r8a7791_sysc_info;
 extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
-extern const struct rcar_sysc_info r8a7795_sysc_info;
+extern struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
-- 
2.17.1
