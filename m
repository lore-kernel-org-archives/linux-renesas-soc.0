Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A847C48BDF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1468861369
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jun 2021 09:58:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233193AbhFRKAu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jun 2021 06:00:50 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:32511 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233187AbhFRKAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:00:47 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84638764"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:38 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5CB9C401BEE1;
        Fri, 18 Jun 2021 18:58:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: renesas: r9a07g044: Update SCIF0 clock
Date:   Fri, 18 Jun 2021 10:58:20 +0100
Message-Id: <20210618095823.19885-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update SCIF0 clock index in SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 476ee9a69065..544f040a4e1d 100644
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
+			resets = <&cpg R9A07G044_SCIF0_CLK_PCK>;
 			status = "disabled";
 		};
 
-- 
2.17.1

