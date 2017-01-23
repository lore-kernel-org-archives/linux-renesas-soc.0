Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 23 Jan 2017 20:40:29 +0900
Message-Id: <148517162908.13306.2467186615655446796.sendpatchset@little-apple>
In-Reply-To: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
References: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
Subject: [PATCH v2 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Bump up the maximum numbers of micro-TLBS to 48.

Each IPMMU device instance get micro-TLB assignment via
the "iommus" property in DT. Older SoCs tend to use a
maximum number of 32 micro-TLBs per IPMMU instance however
newer SoCs such as r8a7796 make use of up to 48 micro-TLBs.

At this point no SoC specific handling is done to validate
the maximum number of micro-TLBs, and because of that the
DT information is assumed to be within correct range for
each particular SoC.

If needed in the future SoC specific feature flags can be
added to handle the maximum number of micro-TLBs without
requiring DT changes, however at this point this does not
seem necessary.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Changes since V1:
 - Added support for the second I/O range at 0x600.

 drivers/iommu/ipmmu-vmsa.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

--- 0008/drivers/iommu/ipmmu-vmsa.c
+++ work/drivers/iommu/ipmmu-vmsa.c	2017-01-23 19:22:54.150607110 +0900
@@ -214,7 +214,9 @@ static void set_archdata(struct device *
 #define IMPMBA(n)			(0x0280 + ((n) * 4))
 #define IMPMBD(n)			(0x02c0 + ((n) * 4))
 
-#define IMUCTR(n)			(0x0300 + ((n) * 16))
+#define IMUCTR(n)			(n) < 32 ? IMUCTR0(n) : IMUCTR32(n)
+#define IMUCTR0(n)			(0x0300 + ((n) * 16))
+#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
 #define IMUCTR_FIXADDEN			(1 << 31)
 #define IMUCTR_FIXADD_MASK		(0xff << 16)
 #define IMUCTR_FIXADD_SHIFT		16
@@ -224,7 +226,9 @@ static void set_archdata(struct device *
 #define IMUCTR_FLUSH			(1 << 1)
 #define IMUCTR_MMUEN			(1 << 0)
 
-#define IMUASID(n)			(0x0308 + ((n) * 16))
+#define IMUASID(n)			(n) < 32 ? IMUASID0(n) : IMUASID32(n)
+#define IMUASID0(n)			(0x0308 + ((n) * 16))
+#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))
 #define IMUASID_ASID8_MASK		(0xff << 8)
 #define IMUASID_ASID8_SHIFT		8
 #define IMUASID_ASID0_MASK		(0xff << 0)
@@ -1141,7 +1145,7 @@ static int ipmmu_probe(struct platform_d
 	}
 
 	mmu->dev = &pdev->dev;
-	mmu->num_utlbs = 32;
+	mmu->num_utlbs = 48;
 	spin_lock_init(&mmu->lock);
 	bitmap_zero(mmu->ctx, IPMMU_CTX_MAX);
 	mmu->features = match->data;
