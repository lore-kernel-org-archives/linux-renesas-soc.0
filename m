Return-Path: <SRS0=xIzj=SV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DDAC282DF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 73A56222AF
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 19 Apr 2019 18:23:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfDSSXM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 19 Apr 2019 14:23:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58840 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfDSSXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:23:11 -0400
Received: from penelope.horms.nl (unknown [62.153.215.140])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 08B4125B7E8;
        Sat, 20 Apr 2019 00:34:03 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 22A90E21BF3; Fri, 19 Apr 2019 16:34:00 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 6/6] arm64: dts: renesas: r8a77980: Add "renesas,id" to VIN
Date:   Fri, 19 Apr 2019 16:33:58 +0200
Message-Id: <b7f5a8e435ecc7198407f44a2a5a6cdae1056b0d.1555683861.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1555683861.git.horms+renesas@verge.net.au>
References: <cover.1555683861.git.horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Jacopo Mondi <jacopo+renesas@jmondi.org>

Add the "renesas,id" property to VIN nodes in the R-Car V3H R8A77980
device tree.

Fixes: 3182aa4e0bf4 ("arm64: dts: renesas: r8a77980: add CSI2/VIN support")
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund@ragnatech.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 4081622d548a..a901a341dcf7 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -865,6 +865,7 @@
 			clocks = <&cpg CPG_MOD 811>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 811>;
+			renesas,id = <0>;
 			status = "disabled";
 
 			ports {
@@ -892,6 +893,7 @@
 			clocks = <&cpg CPG_MOD 810>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			status = "disabled";
+			renesas,id = <1>;
 			resets = <&cpg 810>;
 
 			ports {
@@ -919,6 +921,7 @@
 			clocks = <&cpg CPG_MOD 809>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 809>;
+			renesas,id = <2>;
 			status = "disabled";
 
 			ports {
@@ -946,6 +949,7 @@
 			clocks = <&cpg CPG_MOD 808>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 808>;
+			renesas,id = <3>;
 			status = "disabled";
 
 			ports {
@@ -973,6 +977,7 @@
 			clocks = <&cpg CPG_MOD 807>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 807>;
+			renesas,id = <4>;
 			status = "disabled";
 
 			ports {
@@ -1000,6 +1005,7 @@
 			clocks = <&cpg CPG_MOD 806>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 806>;
+			renesas,id = <5>;
 			status = "disabled";
 
 			ports {
@@ -1027,6 +1033,7 @@
 			clocks = <&cpg CPG_MOD 805>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 805>;
+			renesas,id = <6>;
 			status = "disabled";
 
 			ports {
@@ -1054,6 +1061,7 @@
 			clocks = <&cpg CPG_MOD 804>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 804>;
+			renesas,id = <7>;
 			status = "disabled";
 
 			ports {
@@ -1081,6 +1089,7 @@
 			clocks = <&cpg CPG_MOD 628>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 628>;
+			renesas,id = <8>;
 			status = "disabled";
 		};
 
@@ -1091,6 +1100,7 @@
 			clocks = <&cpg CPG_MOD 627>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 627>;
+			renesas,id = <9>;
 			status = "disabled";
 		};
 
@@ -1101,6 +1111,7 @@
 			clocks = <&cpg CPG_MOD 625>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 625>;
+			renesas,id = <10>;
 			status = "disabled";
 		};
 
@@ -1111,6 +1122,7 @@
 			clocks = <&cpg CPG_MOD 618>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 618>;
+			renesas,id = <11>;
 			status = "disabled";
 		};
 
@@ -1121,6 +1133,7 @@
 			clocks = <&cpg CPG_MOD 612>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 612>;
+			renesas,id = <12>;
 			status = "disabled";
 		};
 
@@ -1131,6 +1144,7 @@
 			clocks = <&cpg CPG_MOD 608>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 608>;
+			renesas,id = <13>;
 			status = "disabled";
 		};
 
@@ -1141,6 +1155,7 @@
 			clocks = <&cpg CPG_MOD 605>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 605>;
+			renesas,id = <14>;
 			status = "disabled";
 		};
 
@@ -1151,6 +1166,7 @@
 			clocks = <&cpg CPG_MOD 604>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 604>;
+			renesas,id = <15>;
 			status = "disabled";
 		};
 
-- 
2.11.0

