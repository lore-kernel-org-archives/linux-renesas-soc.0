Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:32775 "EHLO
	mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161249AbcE3QBQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 30 May 2016 12:01:16 -0400
Received: by mail-lf0-f65.google.com with SMTP id w16so12125544lfd.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 May 2016 09:01:15 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: kuninori.morimoto.gx@renesas.com,
	laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
	architt@codeaurora.org, vz@mleia.com, koji.matsuoka.xm@renesas.com,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [RFC 20/21] arm64: dts: r8a7795: add HDMI support to DU
Date: Mon, 30 May 2016 18:00:19 +0200
Message-Id: <1464624020-27709-21-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1464624020-27709-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index fcad91a..6e0737b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1555,12 +1555,25 @@
 				 <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>,
 				 <&cpg CPG_MOD 721>,
-				 <&cpg CPG_MOD 727>;
-			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+				 <&cpg CPG_MOD 727>,
+				 <&cpg CPG_MOD 729>,
+				 <&cpg CPG_MOD 728>,
+				 <&programable_clk0>,
+				 <&x21_clk>,
+				 <&x22_clk>,
+				 <&programable_clk1>;
+			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0",
+				      "isfr.0", "isfr.1", "dclkin.0",
+				      "dclkin.1", "dclkin.2", "dclkin.3";
 			status = "disabled";
 
 			vsps = <&vspd0 &vspd1 &vspd2 &vspd3>;
 
+			hdmi = <&hdmi0 &hdmi1>;
+			interlaced = <1>;
+			clock-iahb = <0>;
+			hdmi-num = <2>;
+
 			ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.7.4
