Return-Path: <devicetree-owner@vger.kernel.org>
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 6/9] ARM: dts: wheat: Drop MTD partitioning from DT
Date: Tue, 22 May 2018 14:02:54 +0200
Message-Id: <20180522120257.13232-6-marek.vasut+renesas@gmail.com>
In-Reply-To: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
References: <20180522120257.13232-1-marek.vasut+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Drop the MTD partitioning from DT, since it does not describe HW
and to give way to a more flexible kernel command line partition
passing.

To retain the original partitioning, assure you have enabled
CONFIG_MTD_CMDLINE_PARTS in your kernel config and add the
following to your kernel command line:

  mtdparts=spi0.0:256k@0(loader),4096k(user),-(flash)

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/r8a7792-wheat.dts | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7792-wheat.dts b/arch/arm/boot/dts/r8a7792-wheat.dts
index db01de7a3811..93f78716225a 100644
--- a/arch/arm/boot/dts/r8a7792-wheat.dts
+++ b/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -217,27 +217,6 @@
 		spi-cpol;
 		spi-cpha;
 		m25p,fast-read;
-
-		partitions {
-			compatible = "fixed-partitions";
-			#address-cells = <1>;
-			#size-cells = <1>;
-
-			partition@0 {
-				label = "loader";
-				reg = <0x00000000 0x00040000>;
-				read-only;
-			};
-			partition@40000 {
-				label = "user";
-				reg = <0x00040000 0x00400000>;
-				read-only;
-			};
-			partition@440000 {
-				label = "flash";
-				reg = <0x00440000 0x03bc0000>;
-			};
-		};
 	};
 };
 
-- 
2.16.2

