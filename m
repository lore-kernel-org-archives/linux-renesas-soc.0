Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp6-v.fe.bosch.de ([139.15.237.11]:28552 "EHLO
	smtp6-v.fe.bosch.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752008AbcERLVJ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 18 May 2016 07:21:09 -0400
Received: from vsmta14.fe.internet.bosch.com (unknown [10.4.98.54])
	by imta24.fe.bosch.de (Postfix) with ESMTP id 1C70FD80217
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:08 +0200 (CEST)
Received: from SI-HUB1000.de.bosch.com (vsgw24.fe.internet.bosch.com [10.4.98.24])
	by vsmta14.fe.internet.bosch.com (Postfix) with ESMTP id BDABFA40827
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 May 2016 13:21:07 +0200 (CEST)
From: Dirk Behme <dirk.behme@de.bosch.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	<linux-renesas-soc@vger.kernel.org>
CC: Dirk Behme <dirk.behme@de.bosch.com>
Subject: [PATCH v2 2/6] clk: renesas: rcar: Document renesas,modemr
Date: Wed, 18 May 2016 13:19:04 +0200
Message-ID: <1463570348-32349-3-git-send-email-dirk.behme@de.bosch.com>
In-Reply-To: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
References: <1463570348-32349-1-git-send-email-dirk.behme@de.bosch.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

Document the "renesas,modemr" property, which allows the Clock Pulse
Generator driver to obtain the values of the mode pin using syscon and
regmap.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
index 394d725..31182f0 100644
--- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
@@ -39,6 +39,8 @@ Required Properties:
 	Domain bindings in
 	Documentation/devicetree/bindings/power/power_domain.txt.
 
+  - renesas,modemr: Reference to the RST module node, and register offset of
+		    the Mode Monitor Register (MODEMR) inside the RST module
 
 Examples
 --------
@@ -52,6 +54,7 @@ Examples
 		clock-names = "extal", "extalr";
 		#clock-cells = <2>;
 		#power-domain-cells = <0>;
+		renesas,modemr = <&rst 0x60>;
 	};
 
 
-- 
2.8.0
