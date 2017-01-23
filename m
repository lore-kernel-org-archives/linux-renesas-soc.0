Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32825 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751038AbdAWMS2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 07:18:28 -0500
Received: by mail-pg0-f68.google.com with SMTP id 194so13667324pgd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2017 04:18:28 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: iommu@lists.linux-foundation.org
Cc: laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        joro@8bytes.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au, Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Jan 2017 21:11:35 +0900
Message-Id: <148517349585.18128.10696161017872202809.sendpatchset@little-apple>
Subject: [PATCH/RFC 0/2] iommu/ipmmu-vmsa: IPMMU slave device whitelist
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU slave device whitelist

[PATCH/RFC 1/2] arm64: mm: Silently allow devices lacking IOMMU group
[PATCH/RFC 2/2] iommu/ipmmu-vmsa: Opt-in slave devices based on ES version

Here's a little prototype that shows how DT integration of IPMMU details
may be integrated and merged upstream based on SoC data sheet ahead of
time followed by enablement in the IPMMU driver code once the appropriate
SoC ES version has been released and the hardware has been tested.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2017-01-10-v4.10-rc3

 arch/arm64/mm/dma-mapping.c |   10 +++++++++-
 drivers/iommu/ipmmu-vmsa.c  |   24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
