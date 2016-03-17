Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	joro@8bytes.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
	Magnus Damm <magnus.damm@gmail.com>
Date: Fri, 18 Mar 2016 01:29:28 +0900
Message-Id: <20160317162928.24104.46943.sendpatchset@little-apple>
In-Reply-To: <20160317162909.24104.31682.sendpatchset@little-apple>
References: <20160317162909.24104.31682.sendpatchset@little-apple>
Subject: [PATCH 02/10] iommu/ipmmu-vmsa: Enable multi context support
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Add support for up to 4 contexts. Each context is mapped
to one domain. One domain is associated with each device,
however one or more uTLBs for a single device are kept
in the same domain.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 drivers/iommu/ipmmu-vmsa.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

--- 0015/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2016-03-18 00:15:49.180513000 +0900
@@ -31,7 +31,7 @@
 
 #include "io-pgtable.h"
 
-#define IPMMU_CTX_MAX 1
+#define IPMMU_CTX_MAX 4
 
 struct ipmmu_vmsa_device {
 	struct device *dev;
@@ -536,6 +536,13 @@ static int ipmmu_attach_device(struct io
 		/* The domain hasn't been used yet, initialize it. */
 		domain->mmu = mmu;
 		ret = ipmmu_domain_init_context(domain);
+		if (ret < 0) {
+			dev_err(dev, "Unable to initialize IPMMU context\n");
+			domain->mmu = NULL;
+		} else {
+			dev_info(dev, "Using IPMMU context %u\n",
+				 domain->context_id);
+		}
 	} else if (domain->mmu != mmu) {
 		/*
 		 * Something is wrong, we can't attach two devices using
@@ -915,7 +922,7 @@ static void ipmmu_device_reset(struct ip
 	unsigned int i;
 
 	/* Disable all contexts. */
-	for (i = 0; i < 4; ++i)
+	for (i = 0; i < IPMMU_CTX_MAX; ++i)
 		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
 }
 
