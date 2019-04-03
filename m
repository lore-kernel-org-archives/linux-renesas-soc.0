Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5E0C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A68720700
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 10:54:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="SdnKnKu9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbfDCKy4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 06:54:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:37176 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfDCKy4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 06:54:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 348BB25BEF5;
        Wed,  3 Apr 2019 21:54:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554288857; bh=45pDTNGCqHDRDA0GpK0b7ffSM0KQdjewQuzzHnZm5Xg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SdnKnKu9aCgYjrBLl/tHxr7U+OOjR54Vgu3N4He2nUPpbefuMqh1jF6OjsaaI09vM
         mcRFzY0vthehz9ru19PfGITM5/4sNPlozAek43PvvZcte50sTtVsP/oZST3ygF9mxI
         a5ZYoZDOnsn197nz063We8s8GZ7PaqB+ShtfduKw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2F897940B26; Wed,  3 Apr 2019 12:54:12 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/26] arm64: dts: renesas: salvator-common: Add GPIO keys support
Date:   Wed,  3 Apr 2019 12:54:09 +0200
Message-Id: <e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5.1554281697.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1554281697.git.horms+renesas@verge.net.au>
References: <cover.1554281697.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
buttons connected to SoC GPIOs, meant to be used as general-purpose test
keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
switch to keys 1-4 and the push buttons to keys A-C.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 0e5a76fee5fc..2dba1328acfa 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -29,6 +29,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	aliases {
@@ -86,6 +87,63 @@
 		};
 	};
 
+	keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&keys_pins>;
+		pinctrl-names = "default";
+
+		key-1 {
+			gpios = <&gpio5 17 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_1>;
+			label = "SW4-1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-2 {
+			gpios = <&gpio5 20 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_2>;
+			label = "SW4-2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-3 {
+			gpios = <&gpio5 22 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_3>;
+			label = "SW4-3";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-4 {
+			gpios = <&gpio5 23 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_4>;
+			label = "SW4-4";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-a {
+			gpios = <&gpio6 11 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_A>;
+			label = "TSW0";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-b {
+			gpios = <&gpio6 12 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_B>;
+			label = "TSW1";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+		key-c {
+			gpios = <&gpio6 13 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_C>;
+			label = "TSW2";
+			wakeup-source;
+			debounce-interval = <20>;
+		};
+	};
+
 	reg_1p8v: regulator0 {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -572,6 +630,11 @@
 		function = "intc_ex";
 	};
 
+	keys_pins: keys {
+		pins = "GP_5_17", "GP_5_20", "GP_5_22";
+		bias-pull-up;
+	};
+
 	pwm1_pins: pwm1 {
 		groups = "pwm1_a";
 		function = "pwm1";
-- 
2.11.0

