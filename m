Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A3BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 46E54217FB
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 11:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lkSIlE6d"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbeLPLrA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 06:47:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55556 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729820AbeLPLrA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 06:47:00 -0500
Received: from avalon.bb.dnainternet.fi (dfj612ybrt5fhg77mgycy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:2e86:4862:ef6a:2804])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBC7F59
        for <linux-renesas-soc@vger.kernel.org>; Sun, 16 Dec 2018 12:46:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1544960818;
        bh=18xvJvNPrpdK09qgjp4AEOB9ObtjJjyI0GiviA0yNjU=;
        h=From:To:Subject:Date:From;
        b=lkSIlE6d1JIZCtZ/5xfH8dLZNJ6BensRmCYh9v6r8yfGw0gDcOUFEYmbUP/gmDE5/
         FUqv4jnJr1Lzwes+d81lySMj0TpzAea0pJMIvE/IMQTd0Y2WSKxJAbDidNjlUvVqLu
         yzjtPznancQwOWYs21wZEzcG+q2zmtPLVhljUDgY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Add backlight
Date:   Sun, 16 Dec 2018 13:47:44 +0200
Message-Id: <20181216114744.15263-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the backlight device for the LVDS1 output, in preparation for panel
support.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../arm64/boot/dts/renesas/r8a77990-ebisu.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 528e805a9d52..b8ba790907af 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -29,6 +29,16 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm3 0 50000>;
+
+		brightness-levels = <512 511 505 494 473 440 392 327 241 133 0>;
+		default-brightness-level = <10>;
+
+		power-supply = <&reg_12p0v>;
+	};
+
 	cvbs-in {
 		compatible = "composite-video-connector";
 		label = "CVBS IN";
@@ -128,6 +138,15 @@
 		regulator-always-on;
 	};
 
+	reg_12p0v: regulator1 {
+		compatible = "regulator-fixed";
+		regulator-name = "D12.0V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	x13_clk: x13 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
Regards,

Laurent Pinchart

