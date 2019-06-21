Return-Path: <SRS0=6t/Y=UU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDB0C48BE3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Jun 2019 09:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AA722208C3
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 21 Jun 2019 09:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726544AbfFUJOF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 21 Jun 2019 05:14:05 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33940 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfFUJOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:14:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B48ED25BE45;
        Fri, 21 Jun 2019 19:13:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CA1A2942DE9; Fri, 21 Jun 2019 11:13:51 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 19/22] ARM: dts: rza2mevb: Add input switch
Date:   Fri, 21 Jun 2019 11:13:46 +0200
Message-Id: <4592e49225cd40dcbc4c1e91772caa80da10f785.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561104194.git.horms+renesas@verge.net.au>
References: <cover.1561104194.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Chris Brandt <chris.brandt@renesas.com>

Add support for input switch SW3 on the Renesas RZ/A2M EVB
development board.

Note that this uses the IRQ interrupt, as the RZ/A2 GPIO controller
does not include interrupt support

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 49c40065741b..d062d02865e7 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r7s9210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
 
 / {
@@ -26,6 +27,21 @@
 		stdout-path = "serial0:115200n8";
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&keyboard_pins>;
+
+		key-3 {
+			interrupt-parent = <&irqc>;
+			interrupts = <0 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_3>;
+			label = "SW3";
+			wakeup-source;
+		};
+	};
+
 	lbsc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -121,6 +137,10 @@
 			 <RZA2_PINMUX(PORTL, 1, 5)>; /* IRQ5 */
 	};
 
+	keyboard_pins: keyboard {
+		pinmux = <RZA2_PINMUX(PORTJ, 1, 6)>;	/* IRQ0 */
+	};
+
 	/* Serial Console */
 	scif4_pins: serial4 {
 		pinmux = <RZA2_PINMUX(PORT9, 0, 4)>,	/* TxD4 */
-- 
2.11.0

