Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:39730 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932210AbeCKU1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Mar 2018 16:27:21 -0400
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: thermal: rcar-thermal: add R8A77995 support
Date: Mon, 12 Mar 2018 05:26:34 +0900
Message-Id: <1520799995-26347-3-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
References: <1520799995-26347-1-git-send-email-ykaneko0929@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
index 349e635..b2829cb 100644
--- a/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
+++ b/Documentation/devicetree/bindings/thermal/rcar-thermal.txt
@@ -12,6 +12,7 @@ Required properties:
 			    - "renesas,thermal-r8a7791" (R-Car M2-W)
 			    - "renesas,thermal-r8a7792" (R-Car V2H)
 			    - "renesas,thermal-r8a7793" (R-Car M2-N)
+			    - "renesas,thermal-r8a77995" (R-Car D3)
 - reg			: Address range of the thermal registers.
 			  The 1st reg will be recognized as common register
 			  if it has "interrupts".
-- 
1.9.1
