Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f173.google.com ([209.85.161.173]:35755 "EHLO
        mail-yw0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753275AbdGGChs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:37:48 -0400
Received: by mail-yw0-f173.google.com with SMTP id v193so8438529ywg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:37:48 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 4/5] arm64: dts: renesas: ulcb: Add HDMI output connector
Date: Fri,  7 Jul 2017 05:37:36 +0300
Message-Id: <1499395056-14375-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

The ULCB board has one HDMI output connector.

This connector is available on both the H3 and M3-W ULCB boards.
Add this to the ulcb.dtsi file.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index 6f0a7ca..fc5408d 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -34,6 +34,17 @@
 		clock-frequency = <11289600>;
 	};
 
+	hdmi0-out {
+		compatible = "hdmi-connector";
+		label = "HDMI0 OUT";
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
