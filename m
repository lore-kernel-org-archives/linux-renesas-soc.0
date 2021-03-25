Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80045C433DB
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Mar 2021 04:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3391761A1B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 25 Mar 2021 04:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCYEUk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 25 Mar 2021 00:20:40 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21407 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229461AbhCYET6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Mar 2021 00:19:58 -0400
X-IronPort-AV: E=Sophos;i="5.81,276,1610377200"; 
   d="scan'208";a="76003270"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Mar 2021 13:19:57 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 50F4D401142F;
        Thu, 25 Mar 2021 13:19:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a779a0: Fix pmu node
Date:   Thu, 25 Mar 2021 13:19:49 +0900
Message-Id: <20210325041949.925777-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Should use PPI No.7 for the PMU. Otherwise, the perf command didn't
show any information.

Fixes: 834c310f5418 ("arm64: dts: renesas: Add Renesas R8A779A0 SoC support")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 6f3eba4653a3..7c43197f8dae 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -60,10 +60,7 @@ extalr_clk: extalr {
 
 	pmu_a76 {
 		compatible = "arm,cortex-a76-pmu";
-		interrupts-extended = <&gic GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	/* External SCIF clock - to be overridden by boards that provide it */
-- 
2.25.1

