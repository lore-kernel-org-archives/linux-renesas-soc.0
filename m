Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:59033 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727524AbeJDXWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 19:22:49 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: pwm: renesas-tpu: Document r8a7744 support
Date: Thu,  4 Oct 2018 17:21:34 +0100
Message-Id: <1538670094-40946-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Document r8a7744 specific compatible strings. No driver change is
needed as the fallback compatible string "renesas,tpu" activates the
right code in the driver.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
This patch is tested against next-20181004
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
index d53a167..6d6f680 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
@@ -6,6 +6,7 @@ Required Properties:
     - "renesas,tpu-r8a73a4": for R8A73A4 (R-Mobile APE6) compatible PWM controller.
     - "renesas,tpu-r8a7740": for R8A7740 (R-Mobile A1) compatible PWM controller.
     - "renesas,tpu-r8a7743": for R8A7743 (RZ/G1M) compatible PWM controller.
+    - "renesas,tpu-r8a7744": for R8A7744 (RZ/G1N) compatible PWM controller.
     - "renesas,tpu-r8a7745": for R8A7745 (RZ/G1E) compatible PWM controller.
     - "renesas,tpu-r8a7790": for R8A7790 (R-Car H2) compatible PWM controller.
     - "renesas,tpu": for generic R-Car and RZ/G1 TPU PWM controller.
-- 
2.7.4
