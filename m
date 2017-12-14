Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:32595 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750737AbdLNJJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 04:09:14 -0500
From: Chris Paterson <chris.paterson2@renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH 3/3] ARM: dts: r8a7793: Correct critical CPU temperature
Date: Thu, 14 Dec 2017 09:08:41 +0000
Message-Id: <1513242521-11236-4-git-send-email-chris.paterson2@renesas.com>
In-Reply-To: <1513242521-11236-1-git-send-email-chris.paterson2@renesas.com>
References: <1513242521-11236-1-git-send-email-chris.paterson2@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The R-Car M2N hardware manual states that Tc = –40°C to +105°C. The
thermal sensor has an accuracy of ±5°C and there can be a temperature
difference of 1 or 2 degrees between Tjmax and the thermal sensor due
to the location of the latter.

This means that 95°C is a safer value to use.

Fixes: 57f9156bc620ac56 ("ARM: dts: r8a7793: enable to use thermal-zone")
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 arch/arm/boot/dts/r8a7793.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index 61dd291d907da2f5..039b225175262e4b 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -89,7 +89,7 @@
 
 			trips {
 				cpu-crit {
-					temperature	= <115000>;
+					temperature	= <95000>;
 					hysteresis	= <0>;
 					type		= "critical";
 				};
-- 
1.9.1
