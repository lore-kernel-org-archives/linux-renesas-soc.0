Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f178.google.com ([209.85.213.178]:32984 "EHLO
        mail-yb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753278AbdGGChb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jul 2017 22:37:31 -0400
Received: by mail-yb0-f178.google.com with SMTP id 84so6595992ybe.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Jul 2017 19:37:31 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 3/5] arm64: dts: renesas: r8a7796-m3ulcb: Add DU external dot clocks
Date: Fri,  7 Jul 2017 05:37:26 +0300
Message-Id: <1499395046-14338-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1499394976-14201-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>

The DU0/DU1/DU2 external dot clocks are provided by the programmable
Versaclock5 clock generator.

Signed-off-by: Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index 38b58b7..93446d1 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -30,3 +30,15 @@
 		reg = <0x6 0x00000000 0x0 0x40000000>;
 	};
 };
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 727>,
+		 <&versaclock5 1>,
+		 <&versaclock5 3>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2", "lvds.0",
+		      "dclkin.0", "dclkin.1", "dclkin.2";
+};
-- 
1.9.1
