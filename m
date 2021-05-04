Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C907C433ED
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  4 May 2021 14:41:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C68D613B3
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  4 May 2021 14:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231480AbhEDOmY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 4 May 2021 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbhEDOmY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 10:42:24 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE7AC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 07:41:29 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by michel.telenet-ops.be with bizsmtp
        id 0ehT2500x3aEpPb06ehTyh; Tue, 04 May 2021 16:41:27 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEp-002nqm-A1; Tue, 04 May 2021 16:41:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldwEo-00HQGi-Dw; Tue, 04 May 2021 16:41:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/2] ARM: dts: r8a7779: Correct internal delay for i2c[123]
Date:   Tue,  4 May 2021 16:41:25 +0200
Message-Id: <73c96fd455df82ef04fd1db6d7dd79b4679f6c56.1620138979.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620138979.git.geert+renesas@glider.be>
References: <cover.1620138979.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to the R-Car H1 Hardware User's Manual Rev. 1.00, the LSI
internal delay for I2C instances 1 to 3 is 5 ns (typ.), which differs
from the default 50 ns as specified for instance 0.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
i2c[123] are not used in upstream DTS files.
---
 arch/arm/boot/dts/r8a7779.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 3c5fcdfe16b87182..39fc58f32df61b9a 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -198,6 +198,7 @@ i2c1: i2c@ffc71000 {
 		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C1>;
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
@@ -209,6 +210,7 @@ i2c2: i2c@ffc72000 {
 		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C2>;
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
@@ -220,6 +222,7 @@ i2c3: i2c@ffc73000 {
 		interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp0_clks R8A7779_CLK_I2C3>;
 		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		i2c-scl-internal-delay-ns = <5>;
 		status = "disabled";
 	};
 
-- 
2.25.1

