Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbeKOI30 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Nov 2018 03:29:26 -0500
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sasha Levin <sashal@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 4.18 27/59] arm64: dts: renesas: r8a7795: add missing dma-names on hscif2
Date: Wed, 14 Nov 2018 17:22:59 -0500
Message-Id: <20181114222335.99339-27-sashal@kernel.org>
In-Reply-To: <20181114222335.99339-1-sashal@kernel.org>
References: <20181114222335.99339-1-sashal@kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

[ Upstream commit aab7a2414ba0d5c3d0571a90031b535adba7146a ]

hscif2 has 4 dmas, but has only 2 dma-names.
This patch add missing dma-names.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: e0f0bda79337701a ("arm64: dts: renesas: r8a7795: sort subnodes
of the soc node")
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 91c392f879f9..43f95c918409 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -656,7 +656,7 @@
 			clock-names = "fck", "brg_int", "scif_clk";
 			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
 			       <&dmac2 0x35>, <&dmac2 0x34>;
-			dma-names = "tx", "rx";
+			dma-names = "tx", "rx", "tx", "rx";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 518>;
 			status = "disabled";
-- 
2.17.1
