Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34465 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161471AbdKRE13 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 23:27:29 -0500
Received: by mail-pg0-f67.google.com with SMTP id 4so3415152pge.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Nov 2017 20:27:29 -0800 (PST)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Sat, 18 Nov 2017 13:25:59 +0900
Message-Id: <151097915979.24365.675151091819205104.sendpatchset@little-apple>
Subject: [PATCH/RFC 00/04] iommu/ipmmu-vmsa: IPMMU IOVA prototyping on r8a7796 ES1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

iommu/ipmmu-vmsa: IPMMU IOVA prototyping on r8a7796 ES1.0

[PATCH/RFC 01/04] iommu: Hack to dump page table configuration on boot
[PATCH/RFC 02/04] iommu/ipmmu-vmsa: VA64 mode with 32-bit IOVA
[PATCH/RFC 03/04] iommu/ipmmu-vmsa: VA64 mode with 31-bit IOVA
[PATCH/RFC 04/04] iommu/ipmmu-vmsa: VA64 mode with 30-bit IOVA

This series contains a collection of prototype patches to play with
various IOVA space sizes on the r8a7796 IPMMU. Use one of patches
2-4 to test the desired mode and use patch 1 to dump the page table
configuration on boot to see the size of the pgd and other things.

The actual goal with this activity is to play with the page table
concatenation feature that is needed for 40-bit IOVA support. The
Renesas IPMMU hardware according to the friendly documentation
supports stage 1 translation with concatenation as opposed to other
implementations that only use concatenation for stage 2 translation.

My early investigation of the IPMMMU on r8a7996 ES1.0 only allowed me
to successfully scale down the IOVA from 32 to lower values. The patches
in this series has allowed me to test "Initial lookup level" settings
but without concatenation.

In the not so distant future my plan is to continue this activity on
more recent hardware such as the r8a77965 SoC (R-Car M3-N).

Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---
 drivers/iommu/io-pgtable-arm.c |   12 ++++
 drivers/iommu/io-pgtable.c     |    4 +
 drivers/iommu/ipmmu-vmsa.c     |  116 +++++++++++++++++++++++++++-------------
 3 files changed, 95 insertions(+), 37 deletions(-)
