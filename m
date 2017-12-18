Return-Path: <devicetree-owner@vger.kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 2/5] ARM: dts: iwg20d-q7-common: Sound DMA support on DTS
Date: Mon, 18 Dec 2017 18:22:38 +0000
Message-Id: <1513621361-10944-3-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
References: <1513621361-10944-1-git-send-email-biju.das@bp.renesas.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DMA transfer to/from SSI

     DMA
[MEM] -> [SSI]

     DMA
[MEM] <- [SSI]

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1->v2
  * No change

 arch/arm/boot/dts/iwg20d-q7-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
index ed67201..bc8d253 100644
--- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
@@ -243,11 +243,11 @@
 };
 
 &ssi0 {
-	pio-transfer;
+	no-busif;
 };
 
 &ssi1 {
-	pio-transfer;
+	no-busif;
 	shared-pin;
 };
 
-- 
1.9.1

