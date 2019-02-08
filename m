Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF0C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C83B420863
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 11:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="JShbsJUo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfBHLOg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 06:14:36 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:46395 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbfBHLOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 06:14:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7DDA425BF17;
        Fri,  8 Feb 2019 22:14:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549624459; bh=sLuZy0QzFzPVBjcncmY9BFc44cxWx8KnghUYUKtF36w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JShbsJUo7GRwfcIMHTIMdjQUUgIpFQsGlEqMKiWzSWjezFg8jwIacP2MYhfp/ueIS
         kSCfmWRExb5j95ZAFHtBwj7scRpzSY2dtprrY1yWOGUUhRBQgFCriavmYtwrt9jtg/
         dNtb65Xwhn4CJQwqhimI+TNVCZSFX65RG4NF+yjI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EE1C1940A31; Fri,  8 Feb 2019 12:14:15 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 10/12] ARM: dts: r7s9210-rza2mevb: Add support for RZ/A2M EVB
Date:   Fri,  8 Feb 2019 12:14:11 +0100
Message-Id: <3a62c2d2581497de89abbb2d7e0d2ade9b39433e.1549623128.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1549623128.git.horms+renesas@verge.net.au>
References: <cover.1549623128.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Add support for Renesas RZ/A2M evaluation board.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 82 ++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 arch/arm/boot/dts/r7s9210-rza2mevb.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index bd40148a15b2..3a3a931b431e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -843,6 +843,7 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r7s72100-genmai.dtb \
 	r7s72100-gr-peach.dtb \
 	r7s72100-rskrza1.dtb \
+	r7s9210-rza2mevb.dtb \
 	r8a73a4-ape6evm.dtb \
 	r8a7740-armadillo800eva.dtb \
 	r8a7743-iwg20d-q7.dtb \
diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
new file mode 100644
index 000000000000..991e09de1219
--- /dev/null
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZA2MEVB board
+ *
+ * Copyright (C) 2018 Renesas Electronics
+ *
+ */
+
+/dts-v1/;
+#include "r7s9210.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
+
+/ {
+	model = "RZA2MEVB";
+	compatible = "renesas,rza2mevb", "renesas,r7s9210";
+
+	aliases {
+		serial0 = &scif4;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x00800000>;	 /* HyperRAM */
+	};
+
+	lbsc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		red {
+			gpios = <&pinctrl RZA2_PIN(PORT6, 0) GPIO_ACTIVE_HIGH>;
+		};
+		green {
+			gpios = <&pinctrl RZA2_PIN(PORTC, 1) GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* EXTAL */
+&extal_clk {
+	clock-frequency = <24000000>;	/* 24MHz */
+};
+
+/* RTC_X1 */
+&rtc_x1_clk {
+	clock-frequency = <32768>;
+};
+
+&pinctrl {
+	/* Serial Console */
+	scif4_pins: serial4 {
+		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
+			 <RZA2_PINMUX(PORT9, 1, 4)>;	/* RxD4 */
+	};
+};
+
+/* High resolution System tick timers */
+&ostm0 {
+	status = "okay";
+};
+
+&ostm1 {
+	status = "okay";
+};
+
+/* Serial Console */
+&scif4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif4_pins>;
+
+	status = "okay";
+};
-- 
2.11.0

