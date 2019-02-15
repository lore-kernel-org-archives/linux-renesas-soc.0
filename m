Return-Path: <SRS0=NmnW=QW=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D25BC43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 12:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3AE4C2192B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 15 Feb 2019 12:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404315AbfBOM0m (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 15 Feb 2019 07:26:42 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:52937 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733121AbfBOM0l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Feb 2019 07:26:41 -0500
X-IronPort-AV: E=Sophos;i="5.58,372,1544454000"; 
   d="scan'208";a="7773839"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 15 Feb 2019 21:26:39 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.184])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 71C0841CD342;
        Fri, 15 Feb 2019 21:26:37 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix cpu nodes style
Date:   Fri, 15 Feb 2019 12:26:29 +0000
Message-Id: <1550233589-13891-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We usually leave a space between "=" and the value of device
tree properties, but unfortunately that was overlooked for the
"clocks" property of cpu@0 and cpu@1.
This patch fixes the spacing with the "clocks" property of
cpu@0 and cpu@1.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 61a0afb..0bbcaf1 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -76,7 +76,7 @@
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
@@ -87,7 +87,7 @@
 			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
 			next-level-cache = <&L2_CA53>;
 			enable-method = "psci";
-			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;
+			clocks = <&cpg CPG_CORE R8A774C0_CLK_Z2>;
 			operating-points-v2 = <&cluster1_opp>;
 		};
 
-- 
2.7.4

