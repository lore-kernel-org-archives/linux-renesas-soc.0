Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91BFC77B7C
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  5 May 2023 17:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjEERZy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 5 May 2023 13:25:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjEERZy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 May 2023 13:25:54 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 47491160B3;
        Fri,  5 May 2023 10:25:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,252,1677510000"; 
   d="scan'208";a="161757944"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 May 2023 02:25:52 +0900
Received: from localhost.localdomain (unknown [10.226.92.145])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 425DA4073782;
        Sat,  6 May 2023 02:25:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 5/5] arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC
Date:   Fri,  5 May 2023 18:25:30 +0100
Message-Id: <20230505172530.357455-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable PMIC RAA215300 and the built-in RTC on the RZ/{G2L,V2L} SMARC
EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->V2:
 * Updated pmic device node based on the bindings.
---
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index fbbb4f03440b..ffe19d2f0e37 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -351,3 +351,13 @@ &wdt1 {
 	status = "okay";
 	timeout-sec = <60>;
 };
+
+&i2c3 {
+	raa215300: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+
+		renesas,rtc-enabled;
+	};
+};
-- 
2.25.1

