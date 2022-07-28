Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A199C3F6B0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 Jul 2022 12:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236295AbiG1MXZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 Jul 2022 08:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235980AbiG1MXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Jul 2022 08:23:24 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6E9015828;
        Thu, 28 Jul 2022 05:23:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,196,1654527600"; 
   d="scan'208";a="127678690"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2022 21:23:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.50])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B85DB400F4FB;
        Thu, 28 Jul 2022 21:23:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a07g043: Add DMA support to RSPI
Date:   Thu, 28 Jul 2022 13:23:10 +0100
Message-Id: <20220728122312.189766-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220728122312.189766-1-biju.das.jz@bp.renesas.com>
References: <20220728122312.189766-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dmac phandles to RSPI nodes to support DMA operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 40201a16d653..f61459a98c51 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -196,6 +196,8 @@ spi0: spi@1004ac00 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G043_RSPI0_CLKB>;
 			resets = <&cpg R9A07G043_RSPI0_RST>;
+			dmas = <&dmac 0x2e95>, <&dmac 0x2e96>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -212,6 +214,8 @@ spi1: spi@1004b000 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G043_RSPI1_CLKB>;
 			resets = <&cpg R9A07G043_RSPI1_RST>;
+			dmas = <&dmac 0x2e99>, <&dmac 0x2e9a>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
@@ -228,6 +232,8 @@ spi2: spi@1004b400 {
 			interrupt-names = "error", "rx", "tx";
 			clocks = <&cpg CPG_MOD R9A07G043_RSPI2_CLKB>;
 			resets = <&cpg R9A07G043_RSPI2_RST>;
+			dmas = <&dmac 0x2e9d>, <&dmac 0x2e9e>;
+			dma-names = "tx", "rx";
 			power-domains = <&cpg>;
 			num-cs = <1>;
 			#address-cells = <1>;
-- 
2.25.1

