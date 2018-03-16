Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:36128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753572AbeCPOxo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 10:53:44 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 06/52] ARM: dts: iwg22m: Enable cmt0
Date: Fri, 16 Mar 2018 15:52:25 +0100
Message-Id: <7d1671828696650db6123ab1d7a592a0bbf42ff2.1521208546.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1521208546.git.horms+renesas@verge.net.au>
References: <cover.1521208546.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

This patch enables cmt0 support from within the iwg22m SoM dtsi.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
index ed9a8cf3fe36..8d0a392b6811 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
+++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
@@ -29,6 +29,10 @@
 	};
 };
 
+&cmt0 {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <20000000>;
 };
-- 
2.11.0
