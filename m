Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54614 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753598AbdFPNam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 09:30:42 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 01/11] arm64: dts: salvator-x: add 12288000 for sound ADG
Date: Fri, 16 Jun 2017 15:30:09 +0200
Message-Id: <d37d2b3c0ec2708abd64222a04deb1bebab8213f.1497617276.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1497617276.git.horms+renesas@verge.net.au>
References: <cover.1497617276.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current rcar_sound only has 11289600 (= for 44.1kHz) clock-frequency,
but it needs 12288000 for 48kHz too.
Otherwise, 48kHz based sound can't handle correctly.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm64/boot/dts/renesas/salvator-x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/salvator-x.dtsi b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
index 5f0d4bdcd3b4..937bdf8842f2 100644
--- a/arch/arm64/boot/dts/renesas/salvator-x.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-x.dtsi
@@ -523,7 +523,7 @@
 
 	/* audio_clkout0/1/2/3 */
 	#clock-cells = <1>;
-	clock-frequency = <11289600>;
+	clock-frequency = <11289600 12288000>;
 
 	status = "okay";
 
-- 
2.1.4
