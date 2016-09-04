Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36454 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753425AbcIDT4E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Sep 2016 15:56:04 -0400
Received: by mail-lf0-f42.google.com with SMTP id g62so114658829lfe.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 04 Sep 2016 12:55:41 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: r8a7794: fix PWM clock parent
Date: Sun, 04 Sep 2016 22:55:37 +0300
Message-ID: <1994467.CVFvpbaMyF@wasted.cogentembedded.com>
In-Reply-To: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
References: <1618499.8bcj8adpVO@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

When removing the non-existing thermal clock I forgot to remove its
parent from the node's "clocks" property  -- this led to a wrong PWM
clock's parent clock.

Fixes: 2a29f9d6fea8 ("ARM: dts: r8a7794: add MSTP5 clocks")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'renesas-devel-20160902-v4.8-rc4' branch of Simon
Horman's 'renesas.git' repo...

arch/arm/boot/dts/r8a7794.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: renesas/arch/arm/boot/dts/r8a7794.dtsi
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7794.dtsi
+++ renesas/arch/arm/boot/dts/r8a7794.dtsi
@@ -1251,7 +1251,7 @@
 		mstp5_clks: mstp5_clks@e6150144 {
 			compatible = "renesas,r8a7794-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150144 0 4>, <0 0xe615003c 0 4>;
-			clocks = <&hp_clk>, <&extal_clk>, <&p_clk>;
+			clocks = <&hp_clk>, <&p_clk>;
 			#clock-cells = <1>;
 			clock-indices = <R8A7794_CLK_AUDIO_DMAC0
 					 R8A7794_CLK_PWM>;
