Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:35636 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbdFOHg7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jun 2017 03:36:59 -0400
Received: from avalon.ideasonboard.com (unknown [IPv6:2001:268:c037:db14:f920:322a:1f4a:5bdb])
        by galahad.ideasonboard.com (Postfix) with ESMTPSA id 1D82B2034A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jun 2017 09:36:33 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: r8a7795: Add support for the DU
Date: Thu, 15 Jun 2017 10:37:15 +0300
Message-Id: <20170615073716.12395-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170615073716.12395-1-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add a compatible string and VSP links to the DU node. The H3 ES1.x and
H3 ES2.0 are compatible save for the links to the VSPs that are
described explicitly in DT, so there's no need for a new ES2-specific
compatible string.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a7795.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 87df66b56f59..68c99842b3dd 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1743,6 +1743,7 @@
 		};
 
 		du: display@feb00000 {
+			compatible = "renesas,du-r8a7795";
 			reg = <0 0xfeb00000 0 0x80000>,
 			      <0 0xfeb90000 0 0x14>;
 			reg-names = "du", "lvds.0";
@@ -1756,6 +1757,7 @@
 				 <&cpg CPG_MOD 721>,
 				 <&cpg CPG_MOD 727>;
 			clock-names = "du.0", "du.1", "du.2", "du.3", "lvds.0";
+			vsps = <&vspd0 &vspd1 &vspd2 &vspd0>;
 			status = "disabled";
 
 			ports {
-- 
Regards,

Laurent Pinchart
