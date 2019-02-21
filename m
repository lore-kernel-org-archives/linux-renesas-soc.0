Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B659C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A5042084D
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 14:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725891AbfBUOEd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 09:04:33 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:51092 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfBUOEc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 09:04:32 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id fS4V1z00J3XaVaC06S4VvY; Thu, 21 Feb 2019 15:04:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gwoxh-0008Vs-E2; Thu, 21 Feb 2019 15:04:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gwoxh-0004Xb-BD; Thu, 21 Feb 2019 15:04:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774c0: Fix SCIF5 DMA channels
Date:   Thu, 21 Feb 2019 15:04:28 +0100
Message-Id: <20190221140428.17411-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Correct the DMA channels for SCIF5 from 16..47 to 0..15, as was done for
R-Car E3.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Fixes: 2660a6af690ebbb4 ("arm64: dts: renesas: r8a774c0: Add SCIF and HSCIF nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
---
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 61a0afb74e6310b2..1ea684af99c4a19b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -2,7 +2,7 @@
 /*
  * Device Tree Source for the RZ/G2E (R8A774C0) SoC
  *
- * Copyright (C) 2018 Renesas Electronics Corp.
+ * Copyright (C) 2018-2019 Renesas Electronics Corp.
  */
 
 #include <dt-bindings/clock/r8a774c0-cpg-mssr.h>
@@ -1150,9 +1150,8 @@
 				 <&cpg CPG_CORE R8A774C0_CLK_S3D1C>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
-			dmas = <&dmac1 0x5b>, <&dmac1 0x5a>,
-			       <&dmac2 0x5b>, <&dmac2 0x5a>;
-			dma-names = "tx", "rx", "tx", "rx";
+			dmas = <&dmac0 0x5b>, <&dmac0 0x5a>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 202>;
 			status = "disabled";
-- 
2.17.1

