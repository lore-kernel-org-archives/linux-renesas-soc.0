Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B52C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Sep 2021 21:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F3F61107
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 22 Sep 2021 21:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238047AbhIVVWc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 22 Sep 2021 17:22:32 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47514 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238108AbhIVVWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:22:31 -0400
X-IronPort-AV: E=Sophos;i="5.85,315,1624287600"; 
   d="scan'208";a="94853365"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2021 06:21:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4F63B41041EC;
        Thu, 23 Sep 2021 06:20:58 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable ADC on SMARC platform
Date:   Wed, 22 Sep 2021 22:20:48 +0100
Message-Id: <20210922212049.19851-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the ADC which is present on RZ/G2L SMARC SOM.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index 0748f2e7396a..da1ee2206e1a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2021 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
 / {
 	memory@48000000 {
 		device_type = "memory";
@@ -13,6 +15,21 @@
 	};
 };
 
+&adc {
+	pinctrl-0 = <&adc_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	/delete-node/ channel@6;
+	/delete-node/ channel@7;
+};
+
 &extal_clk {
 	clock-frequency = <24000000>;
 };
+
+&pinctrl {
+	adc_pins: adc {
+		pinmux = <RZG2L_PORT_PINMUX(9, 0, 2)>; /* ADC_TRG */
+	};
+};
-- 
2.17.1

