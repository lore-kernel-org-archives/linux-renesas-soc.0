Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:35179 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932719AbcHaKCx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Aug 2016 06:02:53 -0400
Received: by mail-lf0-f48.google.com with SMTP id f93so32947816lfi.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Aug 2016 03:02:52 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v3 03/12] arm64: dts: h3ulcb: enable SCIF clk and pins
Date: Wed, 31 Aug 2016 13:02:49 +0300
Message-Id: <1472637769-14702-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This enables the external crystal for the SCIF_CLK and its pinctrl, to
be used by the Baud Rate Generator for External Clock (BRG) on (H)SCIF.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
Changes in version 3:
- initially added

 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index ecb9e11..67ce368 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -37,10 +37,18 @@
 };
 
 &pfc {
+	pinctrl-0 = <&scif_clk_pins>;
+	pinctrl-names = "default";
+
 	scif2_pins: scif2 {
 		groups = "scif2_data_a";
 		function = "scif2";
 	};
+
+	scif_clk_pins: scif_clk {
+		groups = "scif_clk_a";
+		function = "scif_clk";
+	};
 };
 
 &scif2 {
@@ -49,3 +57,8 @@
 
 	status = "okay";
 };
+
+&scif_clk {
+	clock-frequency = <14745600>;
+	status = "okay";
+};
-- 
1.9.1
