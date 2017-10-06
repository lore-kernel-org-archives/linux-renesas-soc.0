Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:29783 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751654AbdJFQuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 12:50:07 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2] usb: renesas_usbhs: Add compatible string for r8a7743/5
Date: Fri,  6 Oct 2017 17:49:34 +0100
Message-Id: <1507308574-32047-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support for r8a7743/5 SoCs. The Renesas RZ/G1[ME]
(R8A7743/5) usbhs is identical to the R-Car Gen2 family.

No driver change is needed due to the fallback compatible value
"renesas,rcar-gen2-usbhs".
Adding the SoC-specific compatible values here has two purposes:
  1. Document which SoCs have this hardware module,
  2. Allow checkpatch to validate compatible values.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1-->v2
   * Modified the patch description
   * Rebased on the below R-Car D3 patch
     https://patchwork.kernel.org/patch/9982267/

This patch is tested against Linux next tag next-20170929 +
  https://patchwork.kernel.org/patch/9982267/

 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index e79f6e4..47394ab 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -3,6 +3,8 @@ Renesas Electronics USBHS driver
 Required properties:
   - compatible: Must contain one or more of the following:
 
+	- "renesas,usbhs-r8a7743" for r8a7743 (RZ/G1M) compatible device
+	- "renesas,usbhs-r8a7745" for r8a7745 (RZ/G1E) compatible device
 	- "renesas,usbhs-r8a7790" for r8a7790 (R-Car H2) compatible device
 	- "renesas,usbhs-r8a7791" for r8a7791 (R-Car M2-W) compatible device
 	- "renesas,usbhs-r8a7792" for r8a7792 (R-Car V2H) compatible device
@@ -11,7 +13,7 @@ Required properties:
 	- "renesas,usbhs-r8a7795" for r8a7795 (R-Car H3) compatible device
 	- "renesas,usbhs-r8a7796" for r8a7796 (R-Car M3-W) compatible device
 	- "renesas,usbhs-r8a77995" for r8a77995 (R-Car D3) compatible device
-	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 compatible device
+	- "renesas,rcar-gen2-usbhs" for R-Car Gen2 or RZ/G1 compatible devices
 	- "renesas,rcar-gen3-usbhs" for R-Car Gen3 compatible device
 
 	When compatible with the generic version, nodes must list the
-- 
1.9.1
