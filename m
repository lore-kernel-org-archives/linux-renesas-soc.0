Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:53884 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdH3JxO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 05:53:14 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: display: renesas: dw-hdmi: Drop bogus node name suffix
Date: Wed, 30 Aug 2017 11:53:01 +0200
Message-Id: <1504086781-4974-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Node names should not use numerical suffixes if the nodes can be
distinguished by unit-address.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index 83382a422f309dba..19b57f1183f2af3b 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -37,7 +37,7 @@ Optional properties:
 
 Example:
 
-	hdmi0: hdmi0@fead0000 {
+	hdmi0: hdmi@fead0000 {
 		compatible = "renesas,r8a7795-dw-hdmi";
 		reg = <0 0xfead0000 0 0x10000>;
 		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.7.4
