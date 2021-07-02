Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAD6C11F68
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  2 Jul 2021 13:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 222D161427
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  2 Jul 2021 13:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbhGBNxS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 2 Jul 2021 09:53:18 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:56601 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232852AbhGBNxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jul 2021 09:53:18 -0400
X-IronPort-AV: E=Sophos;i="5.83,317,1616425200"; 
   d="scan'208";a="86362037"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2021 22:50:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BFC30400619E;
        Fri,  2 Jul 2021 22:50:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 9/9] arm64: dts: renesas: r9a07g044: Add SSI DMA support
Date:   Fri,  2 Jul 2021 14:50:10 +0100
Message-Id: <20210702135010.5937-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
References: <20210702135010.5937-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSI DMA support to SoC DTS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index a14df300c8ae..27cd45b63d33 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -100,6 +100,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
+			dmas = <&dmac 0x255>,
+			       <&dmac 0x256>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -120,6 +123,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI1_RST_M2_REG>;
+			dmas = <&dmac 0x259>,
+			       <&dmac 0x25a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -140,6 +146,8 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI2_RST_M2_REG>;
+			dmas = <&dmac 0x25f>;
+			dma-names = "rt";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
@@ -160,6 +168,9 @@
 				 <&audio_clk2>;
 			clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
 			resets = <&cpg R9A07G044_SSI3_RST_M2_REG>;
+			dmas = <&dmac 0x261>,
+			       <&dmac 0x262>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
-- 
2.17.1

