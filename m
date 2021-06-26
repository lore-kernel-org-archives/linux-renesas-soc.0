Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3911EC49EAB
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 26 Jun 2021 08:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 233DA614A7
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 26 Jun 2021 08:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFZIQ3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 26 Jun 2021 04:16:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:46969 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229635AbhFZIQ3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 Jun 2021 04:16:29 -0400
X-IronPort-AV: E=Sophos;i="5.83,301,1616425200"; 
   d="scan'208";a="85483283"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 17:14:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.16])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4EE3840037CD;
        Sat, 26 Jun 2021 17:14:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 07/10] arm64: dts: renesas: r9a07g044: Update SCIF0 clock/reset
Date:   Sat, 26 Jun 2021 09:13:41 +0100
Message-Id: <20210626081344.5783-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
References: <20210626081344.5783-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update SCIF0 clock and reset index in SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * No change.
v2->v3:
 * Added Geert's Rb tag.
v1->v2:
 * Updated reset entries
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 734c8adeceba..01482d227506 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -82,10 +82,10 @@
 				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "eri", "rxi", "txi",
 					  "bri", "dri", "tei";
-			clocks = <&cpg CPG_MOD R9A07G044_CLK_SCIF0>;
+			clocks = <&cpg CPG_MOD R9A07G044_SCIF0_CLK_PCK>;
 			clock-names = "fck";
 			power-domains = <&cpg>;
-			resets = <&cpg R9A07G044_CLK_SCIF0>;
+			resets = <&cpg R9A07G044_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
 
-- 
2.17.1

