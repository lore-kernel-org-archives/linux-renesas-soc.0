Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36673 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753116AbdCTI7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2017 04:59:14 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Keita Kobayashi <keita.kobayashi.ym@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 04/32] arm64: dts: r8a7795: salvator-x: Enable I2C for DVFS device
Date: Mon, 20 Mar 2017 09:57:15 +0100
Message-Id: <006ced572a3b2247639ce06443aff00704888001.1489999913.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1489999913.git.horms+renesas@verge.net.au>
References: <cover.1489999913.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Keita Kobayashi <keita.kobayashi.ym@renesas.com>

This patch enables I2C for DVFS device for for Salvator-X board on
R8A7795 SoC.

Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 7a8986edcdc0..dc1177c76aa5 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -485,6 +485,10 @@
 	clock-frequency = <22579200>;
 };
 
+&i2c_dvfs {
+	status = "okay";
+};
+
 &avb {
 	pinctrl-0 = <&avb_pins>;
 	pinctrl-names = "default";
-- 
2.7.0.rc3.207.g0ac5344
