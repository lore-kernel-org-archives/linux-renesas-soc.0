Return-Path: <SRS0=XexY=W7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB84C3A5A9
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  4 Sep 2019 12:08:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 72E6F22CF5
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  4 Sep 2019 12:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfIDMIG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 4 Sep 2019 08:08:06 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:45004 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbfIDMIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 08:08:05 -0400
Received: from ramsan ([84.194.98.4])
        by albert.telenet-ops.be with bizsmtp
        id xQ832000m05gfCL06Q83Ze; Wed, 04 Sep 2019 14:08:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0001ak-IL; Wed, 04 Sep 2019 14:08:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i5U4x-0000Zg-HI; Wed, 04 Sep 2019 14:08:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Magnus Damm <damm+renesas@opensource.se>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] iommu/ipmmu-vmsa: Move IMTTBCR_SL0_TWOBIT_* to restore sort order
Date:   Wed,  4 Sep 2019 14:08:01 +0200
Message-Id: <20190904120802.2163-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904120802.2163-1-geert+renesas@glider.be>
References: <20190904120802.2163-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move the recently added IMTTBCR_SL0_TWOBIT_* definitions up, to make
sure all IMTTBCR register bit definitions are sorted by decreasing bit
index.  Add comments to make it clear that they exist on R-Car Gen3
only.

Fixes: c295f504fb5a38ab ("iommu/ipmmu-vmsa: Allow two bit SL0")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 76a8ec343d53252e..1baabeaddc9cba1b 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -145,15 +145,14 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMTTBCR_IRGN0_WT		(2 << 8)
 #define IMTTBCR_IRGN0_WB		(3 << 8)
 #define IMTTBCR_IRGN0_MASK		(3 << 8)
+#define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)	/* R-Car Gen3 only */
+#define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)	/* R-Car Gen3 only */
+#define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
 #define IMTTBCR_SL0_LVL_2		(0 << 4)
 #define IMTTBCR_SL0_LVL_1		(1 << 4)
 #define IMTTBCR_TSZ0_MASK		(7 << 0)
 #define IMTTBCR_TSZ0_SHIFT		O
 
-#define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)
-#define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)
-#define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)
-
 #define IMBUSCR				0x000c
 #define IMBUSCR_DVM			(1 << 2)
 #define IMBUSCR_BUSSEL_SYS		(0 << 0)
-- 
2.17.1

