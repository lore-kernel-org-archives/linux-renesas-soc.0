Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751904AbdLGJzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Dec 2017 04:55:03 -0500
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 26/54] arm64: dts: renesas: r8a7795-es1: Point FDP1 via FCPF to IPMMU-VP0
Date: Thu,  7 Dec 2017 10:53:29 +0100
Message-Id: <f54d63fe7ed6d37df15ec8903302dd05375168f4.1512640145.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1512640145.git.horms+renesas@verge.net.au>
References: <cover.1512640145.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPF devices to allow use of FDP1 with IPMMU-VP0.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 6b4dfa42f5b2..736281335653 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -56,6 +56,7 @@
 		clocks = <&cpg CPG_MOD 613>;
 		power-domains = <&sysc R8A7795_PD_A3VP>;
 		resets = <&cpg 613>;
+		iommus = <&ipmmu_vp0 2>;
 	};
 
 	vspi2: vsp@fe9c0000 {
-- 
2.11.0
