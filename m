Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EFCC433F5
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 25 Jan 2022 13:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345175AbiAYM7T (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 07:59:19 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:9144 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236854AbiAYM4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 07:56:13 -0500
X-IronPort-AV: E=Sophos;i="5.88,314,1635174000"; 
   d="scan'208";a="107604454"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jan 2022 21:56:11 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CCB87400D4FA;
        Tue, 25 Jan 2022 21:56:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robh+dt@kernel.org
Cc:     iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
Date:   Tue, 25 Jan 2022 21:56:00 +0900
Message-Id: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on renesas-drivers-2022-01-11-v5.16 [1].
Note that we have to prepare the following registers' setting
in a bootloader (U-Boot) because the registers are protected.
Otherwise, data mismatch happened if dmatest with the ipmmu is running.

 => mw eed01500 0xc0000000; mw eed41500 0xc0000000

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/tag/?h=renesas-drivers-2022-01-11-v5.16


Yoshihiro Shimoda (2):
  dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779f0 support
  iommu/ipmmu-vmsa: Add support for R-Car Gen4

 .../devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml  |  4 ++++
 drivers/iommu/ipmmu-vmsa.c                             | 10 +++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1

