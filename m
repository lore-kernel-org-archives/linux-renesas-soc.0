Return-Path: <SRS0=ylRb=52=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A937BC2BA2B
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 833B120801
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 10 Apr 2020 10:47:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgDJKrn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 10 Apr 2020 06:47:43 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:19182 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgDJKrn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Apr 2020 06:47:43 -0400
X-IronPort-AV: E=Sophos;i="5.72,366,1580742000"; 
   d="scan'208";a="44159018"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2020 19:47:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B8434421059E;
        Fri, 10 Apr 2020 19:47:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 1/2] arm64: dts: renesas: add PWM device nodes for r8a77961
Date:   Fri, 10 Apr 2020 19:47:13 +0900
Message-Id: <1586515634-28095-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1586515634-28095-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PWM device nodes for r8a77961 (R-Car M3-W+).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 66 ++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index de27b2f..adc54ff 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -846,10 +846,74 @@
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
 		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
 			reg = <0 0xe6e31000 0 8>;
 			#pwm-cells = <2>;
-			/* placeholder */
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a77961", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 8>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 523>;
+			resets = <&cpg 523>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			status = "disabled";
 		};
 
 		scif1: serial@e6e68000 {
-- 
2.7.4

