Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:38099 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751071AbdGKCrY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 22:47:24 -0400
Received: by mail-it0-f51.google.com with SMTP id k192so6360914ith.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jul 2017 19:47:24 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH v2 4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
Date: Tue, 11 Jul 2017 05:47:17 +0300
Message-Id: <1499741237-27407-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

The ULCB board has one HDMI output connector.

This connector is available on both the H3 and M3-W ULCB boards.
Add this to the ulcb.dtsi file.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
Changes in version 2:
- removed label

 arch/arm64/boot/dts/renesas/ulcb.dtsi | 10 +++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 6f0a7ca..fc5408d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -34,6 +34,16 @@
 		clock-frequency = <11289600>;
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con: endpoint {
+			};
+		};
+	};
+
 	keyboard {
 		compatible = "gpio-keys";
 
-- 
1.9.1
