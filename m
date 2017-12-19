Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:46170 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752906AbdLSQCL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 11:02:11 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] dt-bindings: pwm: renesas-tpu: Correct example TPU register block size
Date: Tue, 19 Dec 2017 17:02:06 +0100
Message-Id: <1513699327-27357-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
References: <1513699327-27357-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The Timer Pulse Unit on R-Mobile A1 has registers that lie outside the
declared register block.  Enlarge the register block size to fix this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
index 1aadc804dae4e30b..641b5b4c648340ee 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
@@ -22,6 +22,6 @@ Example: R8A7740 (R-Car A1) TPU controller node
 
 	tpu: pwm@e6600000 {
 		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-		reg = <0xe6600000 0x100>;
+		reg = <0xe6600000 0x148>;
 		#pwm-cells = <3>;
 	};
-- 
2.7.4
