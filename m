Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:19424 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751504AbdJWRJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2017 13:09:58 -0400
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH v2 1/9] ARM: dts: iwg22d: Use /dev/ttySC3 as debug console
Date: Mon, 23 Oct 2017 18:09:22 +0100
Message-Id: <1508778570-28795-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1508778570-28795-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The BSP release from iWave uses /dev/ttySC3 as debug console, this patch
renames the alias accordingly for compatibility.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
Changes in v2:
* replaced serial0 with serial3 in stdout-path

 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
index 52153ec..edadeee 100644
--- a/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts
@@ -16,13 +16,13 @@
 	compatible = "iwave,g22d", "iwave,g22m", "renesas,r8a7745";
 
 	aliases {
-		serial0 = &scif4;
+		serial3 = &scif4;
 		ethernet0 = &avb;
 	};
 
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=dhcp";
-		stdout-path = "serial0:115200n8";
+		stdout-path = "serial3:115200n8";
 	};
 
 	vccq_sdhi0: regulator-vccq-sdhi0 {
-- 
2.7.4
