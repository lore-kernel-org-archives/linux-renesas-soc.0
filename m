Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] soc: renesas: rcar-sysc: Add support for fixing up power areas
Date: Mon, 13 Mar 2017 18:13:16 +0100
Message-Id: <1489425197-22859-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489425197-22859-1-git-send-email-geert+renesas@glider.be>
References: <1489425197-22859-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The same SoC may have different power areas, depending on SoC revision.
One option is to use different sets of power area tables for each SoC
revision.  However, if the differences are small, it is much more
space-efficient to have a single set of tables, and fix those up at
runtime instead.

Hence provide a helper to NULLify power areas that do not exist on some
revisions (NULLified power areas are skipped during the registration
phase), and support for an optional initialization callback to e.g. fix
up power area tables.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/soc/renesas/rcar-sysc.c | 25 ++++++++++++++++++++++++-
 drivers/soc/renesas/rcar-sysc.h | 10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
index 225c35c79d9abad0..528a13742aeb98d8 100644
--- a/drivers/soc/renesas/rcar-sysc.c
+++ b/drivers/soc/renesas/rcar-sysc.c
@@ -2,7 +2,7 @@
  * R-Car SYSC Power management support
  *
  * Copyright (C) 2014  Magnus Damm
- * Copyright (C) 2015-2016 Glider bvba
+ * Copyright (C) 2015-2017 Glider bvba
  *
  * This file is subject to the terms and conditions of the GNU General Public
  * License.  See the file "COPYING" in the main directory of this archive
@@ -334,6 +334,12 @@ static int __init rcar_sysc_pd_init(void)
 
 	info = match->data;
 
+	if (info->init) {
+		error = info->init();
+		if (error)
+			return error;
+	}
+
 	has_cpg_mstp = of_find_compatible_node(NULL, NULL,
 					       "renesas,cpg-mstp-clocks");
 
@@ -377,6 +383,11 @@ static int __init rcar_sysc_pd_init(void)
 		const struct rcar_sysc_area *area = &info->areas[i];
 		struct rcar_sysc_pd *pd;
 
+		if (!area->name) {
+			/* Skip NULLified area */
+			continue;
+		}
+
 		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
 		if (!pd) {
 			error = -ENOMEM;
@@ -406,6 +417,18 @@ static int __init rcar_sysc_pd_init(void)
 }
 early_initcall(rcar_sysc_pd_init);
 
+void __init rcar_sysc_nullify(struct rcar_sysc_area *areas,
+			      unsigned int num_areas, u8 id)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_areas; i++)
+		if (areas[i].isr_bit == id) {
+			areas[i].name = NULL;
+			return;
+		}
+}
+
 void __init rcar_sysc_init(phys_addr_t base, u32 syscier)
 {
 	u32 syscimr;
diff --git a/drivers/soc/renesas/rcar-sysc.h b/drivers/soc/renesas/rcar-sysc.h
index f6e842e2976ebe32..07edb049a401196c 100644
--- a/drivers/soc/renesas/rcar-sysc.h
+++ b/drivers/soc/renesas/rcar-sysc.h
@@ -46,6 +46,7 @@ struct rcar_sysc_area {
  */
 
 struct rcar_sysc_info {
+	int (*init)(void);	/* Optional */
 	const struct rcar_sysc_area *areas;
 	unsigned int num_areas;
 };
@@ -59,4 +60,13 @@ extern const struct rcar_sysc_info r8a7792_sysc_info;
 extern const struct rcar_sysc_info r8a7794_sysc_info;
 extern const struct rcar_sysc_info r8a7795_sysc_info;
 extern const struct rcar_sysc_info r8a7796_sysc_info;
+
+
+    /*
+     * Helpers for fixing up power area tables depending on SoC revision
+     */
+
+extern void rcar_sysc_nullify(struct rcar_sysc_area *areas,
+			      unsigned int num_areas, u8 id);
+
 #endif /* __SOC_RENESAS_RCAR_SYSC_H__ */
-- 
2.7.4
