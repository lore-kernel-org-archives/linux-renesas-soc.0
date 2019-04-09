Return-Path: <SRS0=/dFS=SL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5AFC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 08:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7C5902070D
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  9 Apr 2019 08:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbfDIIwx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 9 Apr 2019 04:52:53 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:30151 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfDIIwx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Apr 2019 04:52:53 -0400
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x398qkIW010781;
        Tue, 9 Apr 2019 17:52:46 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp);
 Tue, 09 Apr 2019 17:52:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x398qhZP010711
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 9 Apr 2019 17:52:45 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: [PATCH 09/11] ARM: dts: r8a77470: Add VSP support
Date:   Tue,  9 Apr 2019 17:51:50 +0900
Message-Id: <1554799912-24764-10-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554799912-24764-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add vsp nodes to dtsi for VSP support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index c66a3c4..13d3f07 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -1027,6 +1027,24 @@
 			status = "disabled";
 		};
 
+		vsp@fe928000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe928000 0 0x8000>;
+			interrupts = <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 131>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 131>;
+		};
+
+		vsp@fe930000 {
+			compatible = "renesas,vsp1";
+			reg = <0 0xfe930000 0 0x8000>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 128>;
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 128>;
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4

