Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:36361 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753841AbdA0GVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2017 01:21:48 -0500
Received: by mail-pf0-f193.google.com with SMTP id 19so17915725pfo.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 22:20:25 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Date: Fri, 27 Jan 2017 15:14:07 +0900
Message-Id: <148549764733.22203.16459470412085471955.sendpatchset@little-apple>
Subject: [PATCH/RFC v2 0/4] iommu/ipmmu-vmsa: IPMMU slave device whitelist V2
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU slave device whitelist V2

[PATCH/RFC v2 1/4] iommu/of: Skip IOMMU devices disabled in DT
[PATCH/RFC v2 2/4] iommu/ipmmu-vmsa: Get rid of disabled device check
[PATCH/RFC v2 3/4] iommu/ipmmu-vmsa: Check devices in xlate()
[PATCH/RFC v2 3/4] iommu/ipmmu-vmsa: Opt-in slave devices based on ES version

Here's an updated prototype that shows how DT integration of IPMMU details
may be integrated and merged upstream based on SoC data sheet ahead of
time followed by enablement in the IPMMU driver code once the appropriate
SoC ES version has been released and the hardware has been tested.

Changes since V1:
 - Broke out patch 1 from the IPMMU driver
 - Moved slave device check from ->add_device() to ->xlate() (Thanks Robin!)
 - Updated white list patch to hook into ->xlate()

Patch 1 may be suitable for upstream merge, however other patches should
in the future if agreed on be rolled into the IPMMU driver series.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-01-24-v4.10-rc5

 drivers/iommu/ipmmu-vmsa.c |   59 +++++++++++++++++++++++---------------------
 drivers/iommu/of_iommu.c   |    2 -
 2 files changed, 33 insertions(+), 28 deletions(-)
