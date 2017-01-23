Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:35388 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750828AbdAWMSs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:18:48 -0500
Received: by mail-pg0-f68.google.com with SMTP id 204so13647658pge.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 04:18:43 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Jan 2017 21:12:16 +0900
Message-Id: <148517353630.18128.12799811817831597628.sendpatchset@little-apple>
In-Reply-To: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
References: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
Subject: [PATCH/RFC 1/2] arm64: mm: Silently allow devices lacking IOMMU group
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Consider failure of iommu_get_domain_for_dev() as non-critical and
get rid of the warning printout. This allows IOMMU properties to be
included in the DTB even though the kernel is configured with
CONFIG_IOMMU_API=n or in case a particular IOMMU driver refuses to
enable IOMMU support for a certain slave device and returns error
from the ->add_device() callback.

This is only a cosmetic change that removes console warning printouts.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 arch/arm64/mm/dma-mapping.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

--- 0001/arch/arm64/mm/dma-mapping.c
+++ work/arch/arm64/mm/dma-mapping.c	2017-01-23 20:54:40.060607110 +0900
@@ -827,11 +827,19 @@ static bool do_iommu_attach(struct devic
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 
 	/*
+	 * In case IOMMU support is excluded from the kernel or if the device
+	 * is not hooked up to any IOMMU group then be silent and keep the
+	 * old dma_ops.
+	 */
+	if (!domain)
+		return false;
+
+	/*
 	 * If the IOMMU driver has the DMA domain support that we require,
 	 * then the IOMMU core will have already configured a group for this
 	 * device, and allocated the default domain for that group.
 	 */
-	if (!domain || iommu_dma_init_domain(domain, dma_base, size, dev)) {
+	if (iommu_dma_init_domain(domain, dma_base, size, dev)) {
 		pr_warn("Failed to set up IOMMU for device %s; retaining platform DMA ops\n",
 			dev_name(dev));
 		return false;
