Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35218 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752781AbdAZPNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 10:13:41 -0500
Received: by mail-lf0-f43.google.com with SMTP id n124so146722310lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2017 07:13:40 -0800 (PST)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 1/2] arm64: dts: h3ulcb: Update memory node to 4 GiB map
Date: Thu, 26 Jan 2017 18:13:52 +0300
Message-Id: <1485443632-22612-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1485443606-22566-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

This patch adds memory region:

  - After changes, the H3ULCB board has the following map:
    Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff
    Bank1: 1GiB RAM : 0x000500000000 -> 0x0053fffffff
    Bank2: 1GiB RAM : 0x000600000000 -> 0x0063fffffff
    Bank3: 1GiB RAM : 0x000700000000 -> 0x0073fffffff

  - Before changes, the old map looked like this:
    Bank0: 1GiB RAM : 0x000048000000 -> 0x0007fffffff

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index b36c300..3edf966 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -33,6 +33,21 @@
 		reg = <0x0 0x48000000 0x0 0x38000000>;
 	};
 
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
1.9.1
