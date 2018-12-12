Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D802FC04EB8
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 12:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61F7720839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 12:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F7720839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbeLLMZ5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 12 Dec 2018 07:25:57 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:8127 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727067AbeLLMZ5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Dec 2018 07:25:57 -0500
X-IronPort-AV: E=Sophos;i="5.56,344,1539615600"; 
   d="scan'208";a="2634898"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 12 Dec 2018 21:25:54 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B2FAE400DE95;
        Wed, 12 Dec 2018 21:25:52 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B}
Date:   Wed, 12 Dec 2018 12:17:11 +0000
Message-Id: <1544617031-28114-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
domains were still initialized and powered in the wrong order, causing
3DG operation to fail.

Fix this by changing the order in the table at runtime, when running on
an affected SoC.

This work is based on the work done by Geert for R-Car E3.

Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 This patch is tested with renesas-dev.
---
 drivers/soc/renesas/r8a774c0-sysc.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/r8a774c0-sysc.c b/drivers/soc/renesas/r8a774c0-sysc.c
index e1ac4c0..11050e1 100644
--- a/drivers/soc/renesas/r8a774c0-sysc.c
+++ b/drivers/soc/renesas/r8a774c0-sysc.c
@@ -28,19 +28,6 @@ static struct rcar_sysc_area r8a774c0_areas[] __initdata = {
 	{ "3dg-b",	0x100, 1, R8A774C0_PD_3DG_B,	R8A774C0_PD_3DG_A },
 };
 
-static void __init rcar_sysc_fix_parent(struct rcar_sysc_area *areas,
-					unsigned int num_areas, u8 id,
-					int new_parent)
-{
-	unsigned int i;
-
-	for (i = 0; i < num_areas; i++)
-		if (areas[i].isr_bit == id) {
-			areas[i].parent = new_parent;
-			return;
-		}
-}
-
 /* Fixups for RZ/G2E ES1.0 revision */
 static const struct soc_device_attribute r8a774c0[] __initconst = {
 	{ .soc_id = "r8a774c0", .revision = "ES1.0" },
@@ -50,12 +37,10 @@ static const struct soc_device_attribute r8a774c0[] __initconst = {
 static int __init r8a774c0_sysc_init(void)
 {
 	if (soc_device_match(r8a774c0)) {
-		rcar_sysc_fix_parent(r8a774c0_areas,
-				     ARRAY_SIZE(r8a774c0_areas),
-				     R8A774C0_PD_3DG_A, R8A774C0_PD_3DG_B);
-		rcar_sysc_fix_parent(r8a774c0_areas,
-				     ARRAY_SIZE(r8a774c0_areas),
-				     R8A774C0_PD_3DG_B, R8A774C0_PD_ALWAYS_ON);
+		/* Fix incorrect 3DG hierarchy */
+		swap(r8a774c0_areas[6], r8a774c0_areas[7]);
+		r8a774c0_areas[6].parent = R8A774C0_PD_ALWAYS_ON;
+		r8a774c0_areas[7].parent = R8A774C0_PD_3DG_B;
 	}
 
 	return 0;
-- 
2.7.4

