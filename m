Return-Path: <SRS0=s4Ke=QT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41622C282C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 030C020838
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 12 Feb 2019 14:20:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbfBLOUE (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 12 Feb 2019 09:20:04 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:56322 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729355AbfBLOUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Feb 2019 09:20:04 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id bqL11z00K3XaVaC01qL10X; Tue, 12 Feb 2019 15:20:02 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtYun-0005en-Cc; Tue, 12 Feb 2019 15:20:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtYun-00018I-Au; Tue, 12 Feb 2019 15:20:01 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add GPIO expander
Date:   Tue, 12 Feb 2019 15:20:00 +0100
Message-Id: <20190212142000.4312-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the ON Semiconductor PCA9654 I/O expander on the first I2C
bus, which provides 8 extra GPIOs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
GPIOs 5-7 are accessible on test points CP16, CP17, and CP72.

Output tested with a multi-meter using /sys/class/gpio/.
Input and interrupt capability tested using gpio-keys.
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 5ac159b7830d58c1..b5c0dbf4982febd0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -337,6 +337,15 @@
 &i2c0 {
 	status = "okay";
 
+	io_expander: gpio@20 {
+		compatible = "onnn,pca9654";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <22 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	hdmi-encoder@39 {
 		compatible = "adi,adv7511w";
 		reg = <0x39>;
-- 
2.17.1

