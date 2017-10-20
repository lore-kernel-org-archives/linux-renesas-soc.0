Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38914 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752092AbdJTK3l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:29:41 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 27/31] arm64: renesas: salvator-common: fixup audio_clkout
Date: Fri, 20 Oct 2017 12:28:30 +0200
Message-Id: <64097f4c158199f520c483af0380cb58b23dff0a.1508495040.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1508495040.git.horms+renesas@verge.net.au>
References: <cover.1508495040.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

"audio_clkout" is dummy clock of <&rcar_sound 0> to avoid clock loop
which invites probe conflict. Thus <&rcar_sound 0> and "audio_clkout"
should be same value.

On commit 5e2feac33095 ("arm64: renesas: salvator-common: sound
clock-frequency needs descending order") exchanged <&rcar_sound 0>,
but it didn't modify "audio_clkout".
This patch fixup it.

Fixes: 5e2feac33095 ("arm64: renesas: salvator-common: sound clock-frequency needs descending order")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index af434dcd2197..c883e46c06ac 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -52,7 +52,7 @@
 		 */
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <11289600>;
+		clock-frequency = <12288000>;
 	};
 
 	backlight: backlight {
-- 
2.11.0
