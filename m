Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:58636 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751749AbdAYMz6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2017 07:55:58 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <joro@8bytes.org>
CC: <magnus.damm@gmail.com>, <iommu@lists.linux-foundation.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 2/4] iommu: iova: use __alloc_percpu_gfp() with GFP_NOWAIT in init_iova_rcaches()
Date: Wed, 25 Jan 2017 21:54:00 +0900
Message-ID: <1485348842-23712-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1485348842-23712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1485348842-23712-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

In the future, the init_iova_rcaches will be called in atomic.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/iova.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index b7268a1..866ad65 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -723,7 +723,9 @@ static void init_iova_rcaches(struct iova_domain *iovad)
 		rcache = &iovad->rcaches[i];
 		spin_lock_init(&rcache->lock);
 		rcache->depot_size = 0;
-		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
+		rcache->cpu_rcaches = __alloc_percpu_gfp(sizeof(*cpu_rcache),
+							 cache_line_size(),
+							 GFP_NOWAIT);
 		if (WARN_ON(!rcache->cpu_rcaches))
 			continue;
 		for_each_possible_cpu(cpu) {
-- 
1.9.1
