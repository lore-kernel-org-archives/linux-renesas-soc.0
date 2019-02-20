Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDA3C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 15:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 48F2720859
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 15:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfBTPFu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 10:05:50 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:35312 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfBTPFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 10:05:37 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id f35b1z00k3XaVaC0135bmV; Wed, 20 Feb 2019 16:05:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gwTRH-0002IC-Iw; Wed, 20 Feb 2019 16:05:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gwTRH-0000en-HC; Wed, 20 Feb 2019 16:05:35 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Joerg Roedel <joro@8bytes.org>,
        Magnus Damm <damm+renesas@opensource.se>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] iommu/ipmmu-vmsa: Call ipmmu_ctx_write_root() instead of open coding
Date:   Wed, 20 Feb 2019 16:05:26 +0100
Message-Id: <20190220150531.2462-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190220150531.2462-1-geert+renesas@glider.be>
References: <20190220150531.2462-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

There is a helper to write to the root IPMMU instance's registers, so
let's use it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f2b781e20a0eba6..ac70cb967ff821c6 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -280,8 +280,7 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 		ipmmu_write(domain->mmu,
 			    domain->context_id * IM_CTX_SIZE + reg, data);
 
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write_root(domain, reg, data);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.17.1

