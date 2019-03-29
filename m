Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51E4C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 08:11:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 903A72054F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 08:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbfC2ILu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 04:11:50 -0400
Received: from twhmllg3.macronix.com ([211.75.127.131]:11785 "EHLO
        TWHMLLG3.macronix.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbfC2ILu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 04:11:50 -0400
Received: from TWHMLLG3.macronix.com (localhost [127.0.0.2] (may be forged))
        by TWHMLLG3.macronix.com with ESMTP id x2T80Rkh092041
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Mar 2019 16:00:27 +0800 (GMT-8)
        (envelope-from masonccyang@mxic.com.tw)
Received: from localhost.localdomain ([172.17.195.96])
        by TWHMLLG3.macronix.com with ESMTP id x2T804vj091366;
        Fri, 29 Mar 2019 16:00:07 +0800 (GMT-8)
        (envelope-from masonccyang@mxic.com.tw)
From:   Mason Yang <masonccyang@mxic.com.tw>
To:     broonie@kernel.org, marek.vasut@gmail.com,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        bbrezillon@kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        sergei.shtylyov@cogentembedded.com, devicetree@vger.kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org, lee.jones@linaro.org
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw, Mason Yang <masonccyang@mxic.com.tw>
Subject: [PATCH v9 3/3] dt-bindings: mfd: Document Renesas R-Car Gen3 RPC-IF controller bindings
Date:   Fri, 29 Mar 2019 16:20:06 +0800
Message-Id: <1553847606-18122-4-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw>
References: <1553847606-18122-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG3.macronix.com x2T804vj091366
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the bindings used by the Renesas R-Car Gen3 RPC-IF MFD controller.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/mfd/mfd-renesas-rpc.txt    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt

diff --git a/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
new file mode 100644
index 0000000..577986b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/mfd-renesas-rpc.txt
@@ -0,0 +1,57 @@
+Renesas R-Car Gen3 RPC-IF MFD controller Device Tree Bindings
+---------------------------------------------------------------------
+
+Required properties:
+- compatible: should be an SoC-specific compatible value, followed by
+		"renesas,rcar-gen3-rpc" as a fallback.
+		supported SoC-specific values are:
+		"renesas,r8a77995-rpc"	(R-Car D3)
+- reg: should contain three register areas:
+	first for the base address of rpc-if registers,
+	second for the direct mapping read mode and
+	third for the write buffer area.
+- reg-names: should contain "regs", "dirmap" and "wbuf"
+- clocks: should contain 1 entries for the module's clock
+- clock-names: should contain "rpc"
+- #address-cells: should be 1
+- #size-cells: should be 0
+
+Required nodes:
+	spi:
+	Node for configuring the SPI controller driver.
+	Required properties:
+		compatible = "renesas,rcar-rpc-spi";
+
+	hf:
+	Node for configuring the hyperflash controller driver.
+	Required properties:
+		compatible = "renesas,rcar-rpc-hf";
+
+Example:
+
+	rpc_mfd: rpc-mfd@ee200000 {
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
+		spi {
+			compatible = "renesas,rcar-rpc-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			flash@0 {
+				compatible = "jedec,spi-nor";
+				reg = <0>;
+				spi-max-frequency = <40000000>;
+				spi-tx-bus-width = <1>;
+				spi-rx-bus-width = <1>;
+			};
+		};
+	};
-- 
1.9.1

