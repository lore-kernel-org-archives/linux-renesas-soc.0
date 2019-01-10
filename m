Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75672C43444
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 47B0A214DA
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 10:18:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="PBJu1RiU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbfAJKSp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 05:18:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:36415 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfAJKSo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 05:18:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 05F9D25BED4;
        Thu, 10 Jan 2019 21:18:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547115521; bh=YCDZjYmxk4Z3QPKyyrQSn8Ri32Gtj0IKGnbSmDb49qI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PBJu1RiUOSj8FSyBN5Iu9YwiJTo8mu7F0CzNUNu7QgpFZiW+BaQY38vzmq3sZgZHA
         BIOrrMJG4MvZyivLqh/AJj7BCkMFp9kJqDtsjoARc7t/nevRYm1MAYXRbhiJEXJpFX
         cmbBl49pRqzMll0vm6+KP8FMTCQGpCGg5VoE9PYw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 428A59402F6; Thu, 10 Jan 2019 11:18:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] soc: renesas: r8a774c0-sysc: Fix initialization order of 3DG-{A,B}
Date:   Thu, 10 Jan 2019 11:18:38 +0100
Message-Id: <a64597227d0de5610407fcc95dc835745a53f5d0.1547115367.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1547115367.git.horms+renesas@verge.net.au>
References: <cover.1547115367.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das@bp.renesas.com>

The workaround for the wrong hierarchy of the 3DG-{A,B} power domains on
RZ/G2E ES1.0 corrected the parent domains. However, the 3DG-{A,B} power
domains were still initialized and powered in the wrong order, causing
3DG operation to fail.

Fix this by changing the order in the table at runtime, when running on
an affected SoC.

This work is based on the work done by Geert for R-Car E3.

Fixes: f37d211c687588328 ("soc: renesas: rcar-sysc: Add r8a774c0 support")

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/soc/renesas/r8a774c0-sysc.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/soc/renesas/r8a774c0-sysc.c b/drivers/soc/renesas/r8a774c0-sysc.c
index e1ac4c0f6640..11050e17ea81 100644
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
2.11.0

