Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53045C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1CAF52184C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 15:12:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="lc/7KhbT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfAXPMn (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:12:43 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:39115 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbfAXPMn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 10:12:43 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 11B2825B791;
        Fri, 25 Jan 2019 02:12:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548342761; bh=wk4BSKeHYMuJlEf+XU36B6dBeBYf6fDHT4zQzpFGXE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lc/7KhbTgTNeDFy7+3YTYrHv0KpeDo4hMxWKvPAjuOAw4NzzdpeAM1occ0GtNiNv3
         AXBBWc40tZhY8yHT01AgHDg9+EwDVmQavBe+2fPnWVUDnvxFr0f8UuWK4uyGeKHqky
         ovcpg2cnzh8O3RuC52Yk4/2weFKay7t8XlnqESoQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3C0EF940708; Thu, 24 Jan 2019 16:12:39 +0100 (CET)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/44] arm64: dts: renesas: r8a77990: ebisu: Add backlight
Date:   Thu, 24 Jan 2019 16:11:55 +0100
Message-Id: <9d16c4a10e072e6dd5ec526cd45b37ee7dca06c3.1548233325.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1548233325.git.horms+renesas@verge.net.au>
References: <cover.1548233325.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Add the backlight device for the LVDS1 output, in preparation for panel
support.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
index 62bdddcbbae7..24beb0e22cb0 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
@@ -39,6 +39,16 @@
 		clock-frequency = <11289600>;
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
@@ -184,6 +194,15 @@
 		clock-frequency = <24576000>;
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
2.11.0

