Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55692 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752216AbdKAKgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Nov 2017 06:36:40 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH v4 11/15] arm64: dts: renesas: r8a7795-es1: Point VSPI via FCPVI to IPMMU-VP
Date: Wed,  1 Nov 2017 11:34:48 +0100
Message-Id: <20171101103452.7491-12-horms+renesas@verge.net.au>
In-Reply-To: <20171101103452.7491-1-horms+renesas@verge.net.au>
References: <20171101103452.7491-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Hook up the FCPVI devices to allow use of VSPI with IPMMU-VP.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
v4 [Simon Horman]
* Broke out of larger patch

v1 - v3 [Magnus Damm]
---
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
index 71cc74c54933..ae9334b25b31 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi
@@ -76,6 +76,7 @@
 		clocks = <&cpg CPG_MOD 609>;
 		power-domains = <&sysc R8A7795_PD_A3VP>;
 		resets = <&cpg 609>;
+		iommus = <&ipmmu_vp0 10>;
 	};
 
 	vspd3: vsp@fea38000 {
-- 
2.11.0
