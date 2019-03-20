Return-Path: <SRS0=0aVP=RX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9018FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 19:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6370F20857
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Mar 2019 19:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbfCTToR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Mar 2019 15:44:17 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:46714 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfCTToQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Mar 2019 15:44:16 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id qKkD1z0073XaVaC01KkDUc; Wed, 20 Mar 2019 20:44:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6h8H-0002Nh-1X; Wed, 20 Mar 2019 20:44:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6h8H-0003sf-0f; Wed, 20 Mar 2019 20:44:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: rskrza1: Add remaining LEDs
Date:   Wed, 20 Mar 2019 20:44:10 +0100
Message-Id: <20190320194410.14870-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190320194410.14870-1-geert+renesas@glider.be>
References: <20190320194410.14870-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the remaining 3 LEDs, which are driven by the first CAT9554
port expander.

Drop the superfluous status property from the leds node while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index 60e80ecbbf6826bc..ff24301dc1be54de 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -34,12 +34,23 @@
 	};
 
 	leds {
-		status = "okay";
 		compatible = "gpio-leds";
 
 		led0 {
 			gpios = <&port7 1 GPIO_ACTIVE_LOW>;
 		};
+
+		led1 {
+			gpios = <&io_expander1 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led2 {
+			gpios = <&io_expander1 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led3 {
+			gpios = <&io_expander1 2 GPIO_ACTIVE_LOW>;
+		};
 	};
 };
 
-- 
2.17.1

