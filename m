Return-Path: <SRS0=oyWW=YC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E08E1C47404
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Oct 2019 08:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1BE421721
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Oct 2019 08:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729931AbfJII0v (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Oct 2019 04:26:51 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:22208 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725776AbfJII0v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 04:26:51 -0400
X-IronPort-AV: E=Sophos;i="5.67,273,1566831600"; 
   d="scan'208";a="28670609"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Oct 2019 17:26:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1EE6F41A3B1F;
        Wed,  9 Oct 2019 17:26:50 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org
Cc:     iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] iommu/ipmmu-vmsa: minor updates
Date:   Wed,  9 Oct 2019 17:26:46 +0900
Message-Id: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on the latest iommu.git / next branch
to modify the driver in the future's new hardware.

Yoshihiro Shimoda (3):
  iommu/ipmmu-vmsa: Remove some unused register declarations
  iommu/ipmmu-vmsa: Calculate context registers' offset instead of a
    macro
  iommu/ipmmu-vmsa: Add utlb_offset_base

 drivers/iommu/ipmmu-vmsa.c | 52 ++++++++++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 22 deletions(-)

-- 
2.7.4

