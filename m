Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:59146 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbeLEPud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Dec 2018 10:50:33 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC PATCH 3/7] soc: renesas: r8a7796-sysc: Fix power request conflicts
Date: Wed,  5 Dec 2018 16:50:24 +0100
Message-Id: <20181205155028.14335-4-geert+renesas@glider.be>
In-Reply-To: <20181205155028.14335-1-geert+renesas@glider.be>
References: <20181205155028.14335-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Describe the location and contents of the SYSCEXTMASK register on R-Car
M3-W, to prevent conflicts between internal and external power requests.

This register does not exist on R-Car M3-W ES1.x.

Based on a patch in the BSP by Dien Pham <dien.pham.ry@renesas.com>.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/r8a7796-sysc.c | 22 +++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.h    |  2 +-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/r8a7796-sysc.c b/drivers/soc/renesas/r8a7796-sysc.c
index 1b06f868b6e81c79..a4eaa8d1f5d0f49d 100644
--- a/drivers/soc/renesas/r8a7796-sysc.c
+++ b/drivers/soc/renesas/r8a7796-sysc.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2016 Glider bvba
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
+#include <linux/sys_soc.h>
 
 #include <dt-bindings/power/r8a7796-sysc.h>
 
@@ -39,7 +41,25 @@ static const struct rcar_sysc_area r8a7796_areas[] __initconst = {
 	{ "a3ir",	0x180, 0, R8A7796_PD_A3IR,	R8A7796_PD_ALWAYS_ON },
 };
 
-const struct rcar_sysc_info r8a7796_sysc_info __initconst = {
+
+/* Fixups for R-Car M3-W ES1.x revision */
+static const struct soc_device_attribute r8a7796es1[] __initconst = {
+	{ .soc_id = "r8a7796", .revision = "ES1.*" },
+	{ /* sentinel */ }
+};
+
+static int __init r8a7796_sysc_init(void)
+{
+	if (soc_device_match(r8a7796es1))
+		r8a7796_sysc_info.extmask_val = 0;
+
+	return 0;
+}
+
+struct rcar_sysc_info r8a7796_sysc_info __initdata = {
+	.init = r8a7796_sysc_init,
 	.areas = r8a7796_areas,
 	.num_areas = ARRAY_SIZE(r8a7796_areas),
+	.extmask_offs = 0x2f8,
+	.extmask_val = BIT(0),
 };
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index 499797a9e18c2f10..64c2a0fa7945d80b 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -60,7 +60,7 @@ extern const struct rcar_sysc_info r8a7791_sysc_info;
 extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern struct rcar_sysc_info r8a7795_sysc_info;
-extern const struct rcar_sysc_info r8a7796_sysc_info;
+extern struct rcar_sysc_info r8a7796_sysc_info;
 extern const struct rcar_sysc_info r8a77965_sysc_info;
 extern const struct rcar_sysc_info r8a77970_sysc_info;
 extern const struct rcar_sysc_info r8a77980_sysc_info;
-- 
2.17.1
