Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 7/9] ARM: dts: iwg22d-sodimm: Sound DMA support via BUSIF on DTS
Date: Wed, 20 Dec 2017 20:02:03 +0000
Message-Id: <1513800125-53213-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
References: <1513800125-53213-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DMA transfer to/from SSIU

     DMA
[MEM] -> [SSIU] -> [SSI]

     DMA
[MEM] <- [SSIU] <- [SSI]

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index a9ba46d..0f880c1 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -206,12 +206,7 @@
 	status = "okay";
 };
 
-&ssi3 {
-	no-busif;
-};
-
 &ssi4 {
-	no-busif;
 	shared-pin;
 };
 
-- 
1.9.1

