Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:14938 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726418AbeHGKQa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 06:16:30 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 4/5] ARM: dts: iwg23s-sbc: specify EtherAVB PHY IRQ
Date: Tue,  7 Aug 2018 08:57:05 +0100
Message-Id: <1533628626-26503-5-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
References: <1533628626-26503-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Specify  EtherAVB PHY IRQ  in the board specific device tree, now that we
have GPIO support.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
---
V1-->V2
    * No change
V2-->V3
    * No change
    * compile time dependency on gpio dtsi patch
---

---
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
index 2dab6d1..a3d92d9 100644
--- a/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
+++ b/arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts
@@ -59,6 +59,8 @@
 
 	phy3: ethernet-phy@3 {
 		reg = <3>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 		micrel,led-mode = <1>;
 	};
 };
-- 
2.7.4
