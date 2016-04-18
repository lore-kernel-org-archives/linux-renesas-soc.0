Return-Path: <SRS0+SAgi=QN=the-dreams.de=wsa@vergenet.net>
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	Simon Horman <horms@verge.net.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] ARM: shmobile: r8a7790: fix max-frequency for SDHI
Date: Mon, 18 Apr 2016 11:41:30 +0200
Message-Id: <1460972490-3033-1-git-send-email-wsa@the-dreams.de>
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The wrong values come from an old datasheet (H2 v0.6). Anything later
has the fixed value of 195MHz (H2 v0.7 up to Gen2-common V2.0).

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

V2: * better commit message mentioning document versions
    * added geerts tag

 arch/arm/boot/dts/r8a7790.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 1a3b6b08f1f3c9..e75baf369ccfb4 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -607,7 +607,7 @@
 		dmas = <&dmac1 0xcd>, <&dmac1 0xce>,
 		       <&dmac0 0xcd>, <&dmac0 0xce>;
 		dma-names = "tx", "rx", "tx", "rx";
-		max-frequency = <156000000>;
+		max-frequency = <195000000>;
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
@@ -620,7 +620,7 @@
 		dmas = <&dmac1 0xc9>, <&dmac1 0xca>,
 		       <&dmac0 0xc9>, <&dmac0 0xca>;
 		dma-names = "tx", "rx", "tx", "rx";
-		max-frequency = <156000000>;
+		max-frequency = <195000000>;
 		power-domains = <&cpg_clocks>;
 		status = "disabled";
 	};
-- 
2.7.0
