Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D55C4321A
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E711E206BF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 05:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfDZFXM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 01:23:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24967 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726628AbfDZFXM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 01:23:12 -0400
X-IronPort-AV: E=Sophos;i="5.60,396,1549897200"; 
   d="scan'208";a="14174581"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2019 14:23:09 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6B29941AF7E3;
        Fri, 26 Apr 2019 14:23:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] mmc: renesas_sdhi_internal_dmac: improve performance by using IOMMU
Date:   Fri, 26 Apr 2019 14:18:47 +0900
Message-Id: <1556255930-18188-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch set is based on renesas-drivers.git /
renesas-drivers-2019-04-23-v5.1-rc6 tag.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or more
segments, the performance rate (especially, eMMC HS400 reading) is not good.
However, if IOMMU is enabled on the DMAC, since IOMMU will map multiple
scatter gather buffers as one contignous iova, the DMAC can handle the iova
as well and then the performance rate is possible to improve. In fact,
I have measured the performance by using bonnie++, "Sequential Input - block"
rate was improved on all platforms (r8a7795, r8a77965 and r8a77990).
Please refer to the end of this email about the performance.
(I beleive if the performance is improved, the CPU load is also increased.)

However, in case of a sdio card (especiialy some WiFi cards/drivers),
scatter gather buffers are possible to be not contiguous iova because
each scatter gather buffer has only about 1500 bytes, the DMAC cannot
handle it. So, this patch set adds init_card() ops to detect the card
type, and then the driver changes the max_segs if the DMAC is under
IOMMU environment and an sd card/mmc is detected.

---
kernel v5.1-rc6 + local patches + eMMC ext4 format,,,,,,,,,,,,,,,,,,,,,,,,,,
Buildroot 2019.02.1,,,,,,,,,,,,,,,,,,,,,,,,,,
Bonnie++ 1.03e : bonnie\+\+ -d ./ -s 8192 -r 4096 -b -u root,,,,,,,,,,,,,,,,,,,,,,,,,,
,,,,,,,,,,,,,,,,,,,,,,,,,,
environment,Size,Sequential Output - per char (K/sec),<- (CPU %),Sequential Output - block (K/sec),<- (CPU %),Sequential Output - rewrite (K/sec),<- (CPU %),Sequential Input - per char (K/sec),<- (CPU %),Sequential Input - block (K/sec),<- (CPU %),Random seeks,<- (CPU %),files,Sequential Create,<- (CPU %),Sequential Read,<- (CPU %),Sequential Delete,<- (CPU %),Random Create,<- (CPU %),Random Read,<- (CPU %),Random Delete,<- (CPU %)
H3_No_IPMMU,8G,80621,97,117133,28,58619,15,70679,94,118682,16,4068.2,12,16,673,3,+++++,+++,597,3,642,3,+++++,+++,588,3
H3_IPMMU,8G,68183,97,130482,31,80730,20,74719,98,195727,25,4326.4,12,16,859,4,+++++,+++,809,4,796,4,+++++,+++,781,4
M3-N_No_IPMMU,8G,59031,96,121806,32,59500,17,54025,95,118384,17,3245.2,14,16,688,4,+++++,+++,641,3,679,4,+++++,+++,641,4
M3-N_IPMMU,8G,57414,93,136734,35,79095,22,56235,98,196351,27,3438.8,15,16,846,5,+++++,+++,809,4,830,5,+++++,+++,815,5
E3_No_IPMMU,8G,32136,96,99390,42,40603,27,28733,94,76958,26,2638.6,32,16,485,15,+++++,+++,485,11,490,15,+++++,+++,491,11
E3_IPMMU,8G,31712,95,119053,48,61360,36,30075,97,138801,44,2714.4,35,16,552,17,+++++,+++,588,13,573,17,+++++,+++,590,13
---

Yoshihiro Shimoda (3):
  mmc: tmio: add init_card ops
  mmc: tmio: No memory size limitation if runs on IOMMU
  mmc: renesas_sdhi_internal_dmac: use multiple segments if possible

 drivers/mmc/host/renesas_sdhi_core.c          |  8 ++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 ++++++++++++
 drivers/mmc/host/tmio_mmc.h                   |  2 ++
 drivers/mmc/host/tmio_mmc_core.c              | 14 ++++++++++++--
 4 files changed, 34 insertions(+), 2 deletions(-)

-- 
2.7.4

