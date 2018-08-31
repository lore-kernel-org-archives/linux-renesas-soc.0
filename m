Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:33031 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727200AbeHaK4T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 06:56:19 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] dt-bindings: usb: renesas_usbhs: add clock-names property
Date: Fri, 31 Aug 2018 15:48:38 +0900
Message-Id: <1535698119-10132-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3 needs to enable clocks of both host and peripheral.
Otherwise, other side device cannot work correctly. So, this patch
adds a property of clock-names for R-Car Gen3 as an optional.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 087140a..a8fa3ec 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -37,6 +37,8 @@ Optional properties:
   - dmas: Must contain a list of references to DMA specifiers.
   - dma-names : named "ch%d", where %d is the channel number ranging from zero
                 to the number of channels (DnFIFOs) minus one.
+  - clock-names: For a "renesas,rcar-gen3-usbhs" compatible device,
+		 "hsusb" and "ehci/ohci" can be set.
 
 Example:
 	usbhs: usb@e6590000 {
-- 
1.9.1
