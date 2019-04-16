Return-Path: <SRS0=apzE=SS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94097C282DD
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 01:56:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 64D952064B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 01:56:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbfDPB4a (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 21:56:30 -0400
Received: from www3345.sakura.ne.jp ([49.212.235.55]:13598 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727214AbfDPB4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 21:56:30 -0400
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x3G1u3tm080470;
        Tue, 16 Apr 2019 10:56:03 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
Received: from www3345.sakura.ne.jp (49.212.235.55)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav404.sakura.ne.jp);
 Tue, 16 Apr 2019 10:56:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav404.sakura.ne.jp)
Received: from localhost (p14010-ipadfx41marunouchi.tokyo.ocn.ne.jp [61.118.107.10])
        (authenticated bits=0)
        by www3345.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x3G1u1JJ080444
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 16 Apr 2019 10:56:03 +0900 (JST)
        (envelope-from cv-dong@jinso.co.jp)
From:   Cao Van Dong <cv-dong@jinso.co.jp>
To:     linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH 1/4] arm64: dts: renesas: r8a7795: Add TPU support
Date:   Tue, 16 Apr 2019 10:55:49 +0900
Message-Id: <1555379752-5980-2-git-send-email-cv-dong@jinso.co.jp>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add TPU support on r8a7795 SoC.

Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 11 +++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c   |  1 +
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 55472b2..612761e 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1380,6 +1380,17 @@
 			status = "disabled";
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a7795", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 304>;
+			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+			resets = <&cpg 304>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a7795",
 				     "renesas,rcar-gen3-msiof";
diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 9e9a6f2..28522c1 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -138,6 +138,7 @@ static struct mssr_mod_clk r8a7795_mod_clks[] __initdata = {
 	DEF_MOD("cmt2",			 301,	R8A7795_CLK_R),
 	DEF_MOD("cmt1",			 302,	R8A7795_CLK_R),
 	DEF_MOD("cmt0",			 303,	R8A7795_CLK_R),
+	DEF_MOD("tpu0",			 304,	R8A7795_CLK_S3D4),
 	DEF_MOD("scif2",		 310,	R8A7795_CLK_S3D4),
 	DEF_MOD("sdif3",		 311,	R8A7795_CLK_SD3),
 	DEF_MOD("sdif2",		 312,	R8A7795_CLK_SD2),
-- 
2.7.4

