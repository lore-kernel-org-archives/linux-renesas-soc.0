Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:48028 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751843AbdH2KNk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 06:13:40 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/2] ARM: dts: iwg20d-q7: Add chosen node
Date: Tue, 29 Aug 2017 10:56:22 +0100
Message-Id: <1504000583-21996-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1504000583-21996-1-git-send-email-biju.das@bp.renesas.com>
References: <1504000583-21996-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
v1-->v2
    Position the chosen node similar to r8a7791(R-Car M2) SoC.

 arch/arm/boot/dts/r8a7743-iwg20d-q7.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
index 4ff27d2..e30c586 100644
--- a/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
+++ b/arch/arm/boot/dts/r8a7743-iwg20d-q7.dts
@@ -20,6 +20,11 @@
 		ethernet0 = &avb;
 	};
 
+	chosen {
+		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
+		stdout-path = "serial0:115200n8";
+	};
+
 	vcc_sdhi1: regulator-vcc-sdhi1 {
 		compatible = "regulator-fixed";
 
-- 
1.9.1
