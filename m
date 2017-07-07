Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f171.google.com ([209.85.161.171]:35776 "EHLO
        mail-yw0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753290AbdGGChx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:37:53 -0400
Received: by mail-yw0-f171.google.com with SMTP id v193so8439367ywg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:37:53 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 5/5] arm64: dts: renesas: ulcb: Enable HDMI output
Date: Fri,  7 Jul 2017 05:37:48 +0300
Message-Id: <1499395068-14412-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

Enable the HDMI encoder for ULCB board and hook it up to the HDMI connector.

The HDMI encoder and connector are available on both the H3 and M3-W ULCB boards.
Add them to the ulcb.dtsi file.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/ulcb.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
index fc5408d..89a8cb2 100644
--- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
@@ -170,6 +170,23 @@
 	clock-frequency = <32768>;
 };
 
+&hdmi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			rcar_dw_hdmi0_out: endpoint {
+				remote-endpoint = <&hdmi0_con>;
+			};
+		};
+	};
+};
+
+&hdmi0_con {
+	remote-endpoint = <&rcar_dw_hdmi0_out>;
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
-- 
1.9.1
