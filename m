Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Kishon Vijay Abraham I <kishon@ti.com>
To: Russell King <linux@armlinux.org.uk>,
	Benoit Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	<nsekhar@ti.com>, <kishon@ti.com>
Subject: [RESEND PATCH v3 1/3] ARM: dts: DRA7: Add "linux,pci-domain" property for pci dt nodes
Date: Wed, 10 Aug 2016 18:03:18 +0530
Message-ID: <1470832400-11929-2-git-send-email-kishon@ti.com>
In-Reply-To: <1470832400-11929-1-git-send-email-kishon@ti.com>
References: <1470832400-11929-1-git-send-email-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since DRA7 has multiple PCIe Rootcomplex, add "linux,pci-domain"
property to assign a PCI domain number to each of the host
bridges.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra7.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index d9bfb94..8a45385 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -301,6 +301,7 @@
 					  0x82000000 0 0x20013000 0x13000 0 0xffed000>;
 				#interrupt-cells = <1>;
 				num-lanes = <1>;
+				linux,pci-domain = <0>;
 				ti,hwmods = "pcie1";
 				phys = <&pcie1_phy>;
 				phy-names = "pcie-phy0";
@@ -336,6 +337,7 @@
 					  0x82000000 0 0x30013000 0x13000 0 0xffed000>;
 				#interrupt-cells = <1>;
 				num-lanes = <1>;
+				linux,pci-domain = <1>;
 				ti,hwmods = "pcie2";
 				phys = <&pcie2_phy>;
 				phy-names = "pcie-phy0";
-- 
1.7.9.5
