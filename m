Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:25828 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S933634AbcIAP4H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 11:56:07 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 3/3] ARM: dts: rskrza1: add ethernet DT support
Date: Thu,  1 Sep 2016 11:54:30 -0400
Message-Id: <20160901155430.23400-3-chris.brandt@renesas.com>
In-Reply-To: <20160901155430.23400-1-chris.brandt@renesas.com>
References: <20160901155430.23400-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 arch/arm/boot/dts/r7s72100-rskrza1.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-rskrza1.dts b/arch/arm/boot/dts/r7s72100-rskrza1.dts
index aabfa04..e5dea5b 100644
--- a/arch/arm/boot/dts/r7s72100-rskrza1.dts
+++ b/arch/arm/boot/dts/r7s72100-rskrza1.dts
@@ -47,6 +47,15 @@
 	status = "okay";
 };
 
+&ether {
+	status = "okay";
+	renesas,no-ether-link;
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.9.2
