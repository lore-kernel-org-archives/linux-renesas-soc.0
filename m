Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:43462 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751906AbeC3DOZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Mar 2018 23:14:25 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH/RFT v2 2/3] dt-bindings: thermal: rcar-thermal: add R8A77995 support
Date: Fri, 30 Mar 2018 12:13:02 +0900
Message-Id: <1522379583-4503-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
References: <1522379583-4503-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
index 349e635..5ab5fcd 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
@@ -3,7 +3,8 @@
 Required properties:
 - compatible		: "renesas,thermal-<soctype>",
 			   "renesas,rcar-gen2-thermal" (with thermal-zone) or
-			   "renesas,rcar-thermal" (without thermal-zone) as fallback.
+			   "renesas,rcar-thermal" (without thermal-zone) as
+                           fallback except R-Car D3.
 			  Examples with soctypes are:
 			    - "renesas,thermal-r8a73a4" (R-Mobile APE6)
 			    - "renesas,thermal-r8a7743" (RZ/G1M)
@@ -12,13 +13,15 @@ Required properties:
 			    - "renesas,thermal-r8a7791" (R-Car M2-W)
 			    - "renesas,thermal-r8a7792" (R-Car V2H)
 			    - "renesas,thermal-r8a7793" (R-Car M2-N)
+			    - "renesas,thermal-r8a77995" (R-Car D3)
 - reg			: Address range of the thermal registers.
 			  The 1st reg will be recognized as common register
 			  if it has "interrupts".
 
 Option properties:
 
-- interrupts		: use interrupt
+- interrupts		: use interrupt.
+                          Should contain 3 interrupts for R-Car D3.
 
 Example (non interrupt support):
 
-- 
1.9.1
