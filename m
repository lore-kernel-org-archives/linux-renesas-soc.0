Return-Path: <devicetree-owner@vger.kernel.org>
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
To: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCHv2 23/31] ARM: dts: r8a7793: Reference both DMA controllers in QSPI node
Date: Tue, 15 Mar 2016 13:42:00 +0100
Message-Id: <1458045728-4758-24-git-send-email-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
References: <1458045728-4758-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen2 have two DMA controllers, which are equivalent. Add
references to both dmac0 and dmac1 so the driver can fallback to the
later if the first one is unavailable.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7793.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 88164ac..b16b0cc 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -785,8 +785,9 @@
 		reg = <0 0xe6b10000 0 0x2c>;
 		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&mstp9_clks R8A7793_CLK_QSPI_MOD>;
-		dmas = <&dmac0 0x17>, <&dmac0 0x18>;
-		dma-names = "tx", "rx";
+		dmas = <&dmac0 0x17>, <&dmac0 0x18>,
+		       <&dmac1 0x17>, <&dmac1 0x18>;
+		dma-names = "tx", "rx", "tx", "rx";
 		power-domains = <&cpg_clocks>;
 		num-cs = <1>;
 		#address-cells = <1>;
-- 
2.7.2

