Return-Path: <SRS0=jr3J=V4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F357C32750
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 31 Jul 2019 01:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2B6A52067D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 31 Jul 2019 01:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfGaBuT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 30 Jul 2019 21:50:19 -0400
Received: from twhmllg4.macronix.com ([122.147.135.202]:30218 "EHLO
        TWHMLLG4.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbfGaBuS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jul 2019 21:50:18 -0400
Received: from localhost.localdomain ([172.17.195.96])
        by TWHMLLG4.macronix.com with ESMTP id x6V1o3PV061827;
        Wed, 31 Jul 2019 09:50:05 +0800 (GMT-8)
        (envelope-from masonccyang@mxic.com.tw)
From:   Mason Yang <masonccyang@mxic.com.tw>
To:     broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        lee.jones@linaro.org, sergei.shtylyov@cogentembedded.com,
        Mason Yang <masonccyang@mxic.com.tw>, marek.vasut@gmail.com,
        miquel.raynal@bootlin.com
Subject: [PATCH v16 2/2] dt-bindings: spi: Document Renesas R-Car Gen3 RPC-IF controller bindings
Date:   Wed, 31 Jul 2019 10:14:18 +0800
Message-Id: <1564539258-16313-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1564539258-16313-1-git-send-email-masonccyang@mxic.com.tw>
References: <1564539258-16313-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x6V1o3PV061827
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the bindings used by the Renesas R-Car Gen3 RPC-IF controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/spi/spi-renesas-rpc.txt    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt

diff --git a/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
new file mode 100644
index 0000000..d4344c9
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt
@@ -0,0 +1,45 @@
+Renesas R-Car Gen3 RPC-IF controller Device Tree Bindings
+---------------------------------------------------------
+
+Required properties:
+- compatible: should be an SoC-specific compatible value, followed by
+		"renesas,rcar-gen3-rpc" as a fallback.
+		supported SoC-specific values are:
+		"renesas,r8a77980-rpc"	(R-Car V3H)
+		"renesas,r8a77995-rpc"	(R-Car D3)
+- reg: should contain three register areas:
+       first for the base address of RPC-IF registers,
+       second for the direct mapping read mode and
+       third for the write buffer area.
+- reg-names: should contain "regs", "dirmap" and "wbuf"
+- clocks: should contain the clock phandle/specifier pair for the module clock.
+- clock-names: should contain "rpc"
+- power-domains: should contain the power domain phandle/secifier pair.
+- resets: should contain the reset controller phandle/specifier pair.
+- #address-cells: should be 1
+- #size-cells: should be 0
+- flash: should be represented by a subnode of the RPC-IF node,
+	 its "compatible" property contains "jedec,spi-nor" if SPI is used.
+
+Example:
+
+	rpc: spi@ee200000 {
+		compatible = "renesas,r8a77995-rpc", "renesas,rcar-gen3-rpc";
+		reg = <0 0xee200000 0 0x200>, <0 0x08000000 0 0x4000000>,
+		      <0 0xee208000 0 0x100>;
+		reg-names = "regs", "dirmap", "wbuf";
+		clocks = <&cpg CPG_MOD 917>;
+		clock-names = "rpc";
+		power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
+		resets = <&cpg 917>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-max-frequency = <40000000>;
+			spi-tx-bus-width = <4>;
+			spi-rx-bus-width = <4>;
+		};
+	};
-- 
1.9.1

