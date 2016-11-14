Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:45750 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755095AbcKNShS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 13:37:18 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dirk Behme <dirk.behme@de.bosch.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 03/11] ARM: dts: r8a73a4: Add device node for PRR
Date: Mon, 14 Nov 2016 19:37:09 +0100
Message-Id: <1479148637-5399-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
References: <1479148637-5399-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a device node for the Product Register, which provides SoC product
and revision information.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - Drop CCCR, as it is not a lone register, but part of the HPB/APB
    block,

v2:
  - New.
---
 arch/arm/boot/dts/r8a73a4.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a73a4.dtsi b/arch/arm/boot/dts/r8a73a4.dtsi
index ca8672778fe067e1..53183ffe04c11c11 100644
--- a/arch/arm/boot/dts/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/r8a73a4.dtsi
@@ -751,6 +751,11 @@
 		};
 	};
 
+	prr: chipid@ff000044 {
+		compatible = "renesas,prr";
+		reg = <0 0xff000044 0 4>;
+	};
+
 	sysc: system-controller@e6180000 {
 		compatible = "renesas,sysc-r8a73a4", "renesas,sysc-rmobile";
 		reg = <0 0xe6180000 0 0x8000>, <0 0xe6188000 0 0x8000>;
-- 
1.9.1
