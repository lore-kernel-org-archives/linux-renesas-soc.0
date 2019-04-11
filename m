Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB51C10F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:54:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D40A217D4
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 07:54:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfDKHy6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 03:54:58 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:49945 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfDKHy6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 03:54:58 -0400
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3B7slHg037649;
        Thu, 11 Apr 2019 16:54:47 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp);
 Thu, 11 Apr 2019 16:54:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav301.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3B7sjeI037630
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 11 Apr 2019 16:54:47 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp,
        cv-dong@jinso.co.jp
Subject: [PATCH v2 07/20] ARM: dts: r8a77470: Add Audio-DMAC support
Date:   Thu, 11 Apr 2019 16:54:09 +0900
Message-Id: <1554969262-15028-8-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add audma0 node to dtsi for audio support on the RZ/G1C (r8a77470) SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm/boot/dts/r8a77470.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470.dtsi b/arch/arm/boot/dts/r8a77470.dtsi
index a5a1918..9fc9f6a 100644
--- a/arch/arm/boot/dts/r8a77470.dtsi
+++ b/arch/arm/boot/dts/r8a77470.dtsi
@@ -1068,6 +1068,37 @@
 			};
 		};
 
+		audma0: dma-controller@ec700000 {
+			compatible = "renesas,dmac-r8a77470",
+				     "renesas,rcar-dmac";
+			reg = <0 0xec700000 0 0x10000>;
+			interrupts = <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH
+				      GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12";
+			clocks = <&cpg CPG_MOD 502>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 502>;
+			#dma-cells = <1>;
+			dma-channels = <13>;
+		};
+
 		sdhi0: sd@ee100000 {
 			compatible = "renesas,sdhi-r8a77470",
 				     "renesas,rcar-gen2-sdhi";
-- 
2.7.4

