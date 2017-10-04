Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:54337 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751268AbdJDKO1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 06:14:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] dt-bindings: pwm: Add R-Car D3 device tree bindings
Date: Wed,  4 Oct 2017 19:10:38 +0900
Message-Id: <1507111838-9647-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add device tree bindings for the PWM controller found on R-Car D3 SoCs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
index 7e94b80..74c1180 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
@@ -9,6 +9,7 @@ Required Properties:
  - "renesas,pwm-r8a7794": for R-Car E2
  - "renesas,pwm-r8a7795": for R-Car H3
  - "renesas,pwm-r8a7796": for R-Car M3-W
+ - "renesas,pwm-r8a77995": for R-Car D3
 - reg: base address and length of the registers block for the PWM.
 - #pwm-cells: should be 2. See pwm.txt in this directory for a description of
   the cells format.
-- 
1.9.1
