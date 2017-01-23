Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34991 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbdAWLqh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 06:46:37 -0500
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 23 Jan 2017 20:39:49 +0900
Message-Id: <148517158986.13306.314435910710426381.sendpatchset@little-apple>
Subject: [PATCH v2 0/3] iommu/ipmmu-vmsa: r8a7796 support V2
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: r8a7796 support V2

[PATCH v2 1/3] iommu/ipmmu-vmsa: Add r8a7796 DT binding
[PATCH v2 2/3] iommu/ipmmu-vmsa: Increase maximum micro-TLBS to 48
[PATCH v2 3/3] iommu/ipmmu-vmsa: Hook up r8a7796 DT matching code

This series adds r8a7796 support to the IPMMU driver. The DT binding
gets updated, maximum number of micro-TLBs are increased and the
driver is adjusted to match on the new DT binding.

Changes since last version include:
- Patch #1 (DT binding patch) updated with more Acked-by tags
- Patch #2 (micro-TLB patch) updated with high I/O register range support

If possible I would like to fast-track merge of patch #1 to fix DT interface.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-01-10-v4.10-rc3 with locally reverted
 "[PATCH 0/3] iommu/ipmmu-vmsa: Initial r8a7796 support"

 More detailed patch stack dependency is v4.10-rc3 + iommu/next and:
 [PATCH v6 00/07] iommu/ipmmu-vmsa: IPMMU multi-arch update V6
 [PATCH v2 00/11] iommu/ipmmu-vmsa: r8a7795 support V2

Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 
 drivers/iommu/ipmmu-vmsa.c                                     |   19 +++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)
