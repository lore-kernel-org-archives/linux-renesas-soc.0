Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f44.google.com ([74.125.83.44]:39310 "EHLO
        mail-pg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161502AbdKRE1i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 23:27:38 -0500
Received: by mail-pg0-f44.google.com with SMTP id 70so3403866pgf.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2017 20:27:38 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Sat, 18 Nov 2017 13:26:08 +0900
Message-Id: <151097916855.24365.7878516664878862365.sendpatchset@little-apple>
In-Reply-To: <151097915979.24365.675151091819205104.sendpatchset@little-apple>
References: <151097915979.24365.675151091819205104.sendpatchset@little-apple>
Subject: [PATCH/RFC 01/04] iommu: Hack to dump page table configuration on boot
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Adjust code to output page table configuration on boot. Not for upstream merge.

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/io-pgtable-arm.c |   12 ++++++++++++
 drivers/iommu/io-pgtable.c     |    4 ++++
 2 files changed, 16 insertions(+)

--- 0001/drivers/iommu/io-pgtable-arm.c
+++ work/drivers/iommu/io-pgtable-arm.c	2017-11-17 12:44:09.100607110 +0900
@@ -970,6 +970,18 @@ struct io_pgtable_init_fns io_pgtable_ar
 	.free	= arm_lpae_free_pgtable,
 };
 
+void arm_lpae_dump(struct io_pgtable_ops *ops)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+
+	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
+		cfg->pgsize_bitmap, cfg->ias);
+	pr_err("data: %d levels, 0x%zx pgd_size, %lu pg_shift, %lu bits_per_level, pgd @ %p\n",
+		data->levels, data->pgd_size, data->pg_shift,
+		data->bits_per_level, data->pgd);
+}
+
 #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
 
 static struct io_pgtable_cfg *cfg_cookie;
--- 0001/drivers/iommu/io-pgtable.c
+++ work/drivers/iommu/io-pgtable.c	2017-11-17 12:44:31.290607110 +0900
@@ -37,6 +37,8 @@ io_pgtable_init_table[IO_PGTABLE_NUM_FMT
 #endif
 };
 
+void arm_lpae_dump(struct io_pgtable_ops *ops);
+
 struct io_pgtable_ops *alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
 					    struct io_pgtable_cfg *cfg,
 					    void *cookie)
@@ -59,6 +61,8 @@ struct io_pgtable_ops *alloc_io_pgtable_
 	iop->cookie	= cookie;
 	iop->cfg	= *cfg;
 
+	arm_lpae_dump(&iop->ops);
+
 	return &iop->ops;
 }
 
