Return-Path: <SRS0=bVAr=RN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CEDC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Mar 2019 13:06:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 52A05206DF
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 10 Mar 2019 13:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfCJNGU (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 10 Mar 2019 09:06:20 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:12526 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726414AbfCJNGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Mar 2019 09:06:20 -0400
X-Halon-ID: 4764ba6d-4335-11e9-985a-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 4764ba6d-4335-11e9-985a-005056917f90;
        Sun, 10 Mar 2019 14:06:16 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] arm64: dts: renesas: r8a774c0: Remove invalid compatible value for CSI40
Date:   Sun, 10 Mar 2019 14:06:11 +0100
Message-Id: <20190310130611.11114-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The compatible value renesas,rcar-gen3-csi2 was used while prototyping
the R-Car CSI-2 driver but was removed before the driver was merged.

Fixes: e961ab42e034d469 ("arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

---

Hi Simon,

The commit introducing the issue is not yet upstream and the patch is 
based on your renesas/next branch.

Best Regards,
Niklas

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 1ea684af99c4a19b..8571cc7e64ef2a21 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1740,8 +1740,7 @@
 		};
 
 		csi40: csi2@feaa0000 {
-			compatible = "renesas,r8a774c0-csi2",
-				     "renesas,rcar-gen3-csi2";
+			compatible = "renesas,r8a774c0-csi2";
 			reg = <0 0xfeaa0000 0 0x10000>;
 			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 716>;
-- 
2.21.0

