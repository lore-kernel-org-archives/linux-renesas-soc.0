Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Yangbo Lu <yangbo.lu@nxp.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/4] soc: renesas: Identify SoC and register with the SoC bus
Date: Tue,  4 Oct 2016 11:09:27 +0200
Message-Id: <1475572167-29581-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
References: <1475572167-29581-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Identify the SoC type and revision, and register this information with
the SoC bus, so it is available under /sys/devices/soc0/, and can be
checked where needed using soc_device_match().

In addition, on SoCs that support it, the product ID is read from a
hardware register and validated, to catch accidental use of a DTB for a
different SoC.

Example:

    Detected Renesas r8a7791 ES1.0
    ...
    # cat /sys/devices/soc0/{family,machine,soc_id,revision}
    R-Car Gen2
    Koelsch
    r8a7791
    ES1.0

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch does NOT add a call to

        of_platform_default_populate(NULL, NULL,
                                     soc_device_to_device(soc_dev));

Contrary to suggested by commit 74d1d82cdaaec727 ("drivers/base: add bus
for System-on-Chip devices), doing so would not only move on-SoC devices
from /sys/devices/platform/ to /sys/devices/soc0/, but also all other
board (off-SoC) devices specified in the DTB.
---
 arch/arm/mach-shmobile/Kconfig    |   1 +
 arch/arm64/Kconfig.platforms      |   1 +
 drivers/soc/renesas/Makefile      |   2 +
 drivers/soc/renesas/renesas-soc.c | 266 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 270 insertions(+)
 create mode 100644 drivers/soc/renesas/renesas-soc.c

diff --git a/arch/arm/mach-shmobile/Kconfig b/arch/arm/mach-shmobile/Kconfig
index b5a3cbe81dd1d1f0..e41d2cbb2c825981 100644
--- a/arch/arm/mach-shmobile/Kconfig
+++ b/arch/arm/mach-shmobile/Kconfig
@@ -42,6 +42,7 @@ menuconfig ARCH_RENESAS
 	select HAVE_ARM_TWD if SMP
 	select NO_IOPORT_MAP
 	select PINCTRL
+	select SOC_BUS
 	select ZONE_DMA if ARM_LPAE
 
 if ARCH_RENESAS
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index be5d824ebdba2dab..a2675afc61baba8d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -131,6 +131,7 @@ config ARCH_RENESAS
 	select PM
 	select PM_GENERIC_DOMAINS
 	select RENESAS_IRQC
+	select SOC_BUS
 	help
 	  This enables support for the ARMv8 based Renesas SoCs.
 
diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile
index 623039c3514cdc34..ae6ae8a11f98aba1 100644
--- a/drivers/soc/renesas/Makefile
+++ b/drivers/soc/renesas/Makefile
@@ -1,3 +1,5 @@
+obj-y				+= renesas-soc.o
+
 obj-$(CONFIG_ARCH_R8A7779)	+= rcar-sysc.o r8a7779-sysc.o
 obj-$(CONFIG_ARCH_R8A7790)	+= rcar-sysc.o r8a7790-sysc.o
 obj-$(CONFIG_ARCH_R8A7791)	+= rcar-sysc.o r8a7791-sysc.o
diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
new file mode 100644
index 0000000000000000..74b72e4112b8889e
--- /dev/null
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -0,0 +1,266 @@
+/*
+ * Renesas SoC Identification
+ *
+ * Copyright (C) 2014-2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+
+struct renesas_family {
+	const char name[16];
+	u32 reg;			/* CCCR, PVR, or PRR */
+};
+
+static const struct renesas_family fam_emev2 __initconst = {
+	.name	= "Emma Mobile EV2",
+};
+
+static const struct renesas_family fam_rmobile __initconst = {
+	.name	= "R-Mobile",
+	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
+};
+
+static const struct renesas_family fam_rcar_gen1 __initconst = {
+	.name	= "R-Car Gen1",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rcar_gen2 __initconst = {
+	.name	= "R-Car Gen2",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rcar_gen3 __initconst = {
+	.name	= "R-Car Gen3",
+	.reg	= 0xfff00044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_rza __initconst = {
+	.name	= "RZ/A",
+};
+
+static const struct renesas_family fam_rzg __initconst = {
+	.name	= "RZ/G",
+	.reg	= 0xff000044,		/* PRR (Product Register) */
+};
+
+static const struct renesas_family fam_shmobile __initconst = {
+	.name	= "SH-Mobile",
+	.reg	= 0xe600101c,		/* CCCR (Common Chip Code Register) */
+};
+
+
+struct renesas_soc {
+	const struct renesas_family *family;
+	u8 id;
+};
+
+static const struct renesas_soc soc_emev2 __initconst = {
+	.family	= &fam_emev2,
+};
+
+static const struct renesas_soc soc_rz_a1h __initconst = {
+	.family	= &fam_rza,
+};
+
+static const struct renesas_soc soc_rmobile_ape6 __initconst = {
+	.family	= &fam_rmobile,
+	.id	= 0x3f,
+};
+
+static const struct renesas_soc soc_rmobile_a1 __initconst = {
+	.family	= &fam_rmobile,
+	.id	= 0x40,
+};
+
+static const struct renesas_soc soc_rz_g1m __initconst = {
+	.family	= &fam_rzg,
+	.id	= 0x47,
+};
+
+static const struct renesas_soc soc_rz_g1e __initconst = {
+	.family	= &fam_rzg,
+	.id	= 0x4c,
+};
+
+static const struct renesas_soc soc_rcar_m1a __initconst = {
+	.family	= &fam_rcar_gen1,
+};
+
+static const struct renesas_soc soc_rcar_h1 __initconst = {
+	.family	= &fam_rcar_gen1,
+	.id	= 0x3b,
+};
+
+static const struct renesas_soc soc_rcar_h2 __initconst = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x45,
+};
+
+static const struct renesas_soc soc_rcar_m2_w __initconst = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x47,
+};
+
+static const struct renesas_soc soc_rcar_v2h __initconst = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4a,
+};
+
+static const struct renesas_soc soc_rcar_m2_n __initconst = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4b,
+};
+
+static const struct renesas_soc soc_rcar_e2 __initconst = {
+	.family	= &fam_rcar_gen2,
+	.id	= 0x4c,
+};
+
+static const struct renesas_soc soc_rcar_h3 __initconst = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x4f,
+};
+
+static const struct renesas_soc soc_rcar_m3_w __initconst = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x52,
+};
+
+static const struct renesas_soc soc_shmobile_ag5 __initconst = {
+	.family	= &fam_shmobile,
+	.id	= 0x37,
+};
+
+static const struct of_device_id renesas_socs[] __initconst = {
+#ifdef CONFIG_ARCH_EMEV2
+	{ .compatible = "renesas,emev2",	.data = &soc_emev2 },
+#endif
+#ifdef CONFIG_ARCH_R7S72100
+	{ .compatible = "renesas,r7s72100",	.data = &soc_rz_a1h },
+#endif
+#ifdef CONFIG_ARCH_R8A73A4
+	{ .compatible = "renesas,r8a73a4",	.data = &soc_rmobile_ape6 },
+#endif
+#ifdef CONFIG_ARCH_R8A7740
+	{ .compatible = "renesas,r8a7740",	.data = &soc_rmobile_a1 },
+#endif
+#ifdef CONFIG_ARCH_R8A7743
+	{ .compatible = "renesas,r8a7743",	.data = &soc_rz_g1m },
+#endif
+#ifdef CONFIG_ARCH_R8A7745
+	{ .compatible = "renesas,r8a7745",	.data = &soc_rz_g1e },
+#endif
+#ifdef CONFIG_ARCH_R8A7778
+	{ .compatible = "renesas,r8a7778",	.data = &soc_rcar_m1a },
+#endif
+#ifdef CONFIG_ARCH_R8A7779
+	{ .compatible = "renesas,r8a7779",	.data = &soc_rcar_h1 },
+#endif
+#ifdef CONFIG_ARCH_R8A7790
+	{ .compatible = "renesas,r8a7790",	.data = &soc_rcar_h2 },
+#endif
+#ifdef CONFIG_ARCH_R8A7791
+	{ .compatible = "renesas,r8a7791",	.data = &soc_rcar_m2_w },
+#endif
+#ifdef CONFIG_ARCH_R8A7792
+	{ .compatible = "renesas,r8a7792",	.data = &soc_rcar_v2h },
+#endif
+#ifdef CONFIG_ARCH_R8A7793
+	{ .compatible = "renesas,r8a7793",	.data = &soc_rcar_m2_n },
+#endif
+#ifdef CONFIG_ARCH_R8A7794
+	{ .compatible = "renesas,r8a7794",	.data = &soc_rcar_e2 },
+#endif
+#ifdef CONFIG_ARCH_R8A7795
+	{ .compatible = "renesas,r8a7795",	.data = &soc_rcar_h3 },
+#endif
+#ifdef CONFIG_ARCH_R8A7796
+	{ .compatible = "renesas,r8a7796",	.data = &soc_rcar_m3_w },
+#endif
+#ifdef CONFIG_ARCH_SH73A0
+	{ .compatible = "renesas,sh73a0",	.data = &soc_shmobile_ag5 },
+#endif
+	{ /* sentinel */ }
+};
+
+static int __init renesas_soc_init(void)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	const struct renesas_family *family;
+	unsigned int product, esi = 0, esf;
+	const struct of_device_id *match;
+	const struct renesas_soc *soc;
+	struct soc_device *soc_dev;
+	struct device_node *np;
+	void __iomem *mapped;
+
+	np = of_find_matching_node_and_match(NULL, renesas_socs, &match);
+	if (!np)
+		return -ENODEV;
+
+	of_node_put(np);
+	soc = match->data;
+	family = soc->family;
+
+	if (soc->id) {
+		mapped = ioremap(family->reg, 4);
+		if (!mapped)
+			return -ENOMEM;
+
+		product = readl(mapped);
+		iounmap(mapped);
+
+		if (((product >> 8) & 0xff) != soc->id) {
+			pr_crit("SoC mismatch (product = 0x%x)\n", product);
+			return -ENODEV;
+		}
+
+		esi = ((product >> 4) & 0x0f) + 1;
+		esf = product & 0xf;
+	}
+
+	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &soc_dev_attr->machine);
+	of_node_put(np);
+
+	soc_dev_attr->family = kstrdup_const(family->name, GFP_KERNEL);
+	soc_dev_attr->soc_id = kstrdup_const(strchr(match->compatible, ',') + 1,
+					     GFP_KERNEL);
+	if (esi > 0)
+		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "ES%u.%u", esi,
+						   esf);
+
+	pr_info("Detected Renesas %s %s\n", soc_dev_attr->soc_id,
+		soc_dev_attr->revision ?: "");
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev)) {
+		kfree(soc_dev_attr->revision);
+		kfree_const(soc_dev_attr->soc_id);
+		kfree_const(soc_dev_attr->family);
+		kfree(soc_dev_attr);
+		return PTR_ERR(soc_dev);
+	}
+
+	return 0;
+}
+core_initcall(renesas_soc_init);
-- 
1.9.1
