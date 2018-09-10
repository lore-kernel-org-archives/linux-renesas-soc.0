Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:4933 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727799AbeIJOr3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 10:47:29 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 2/3] dt-bindings: usb: renesas_usbhs: add clock-names property
Date: Mon, 10 Sep 2018 18:52:19 +0900
Message-Id: <1536573140-24123-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1536573140-24123-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

R-Car Gen3 needs to enable clocks of both host and peripheral.
Otherwise, other side device cannot work correctly. So, this patch
adds a property of clock-names for R-Car Gen3 as an optional.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index 087140a..dbdb92c 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -26,7 +26,9 @@ Required properties:
 
   - reg: Base address and length of the register for the USBHS
   - interrupts: Interrupt specifier for the USBHS
-  - clocks: A list of phandle + clock specifier pairs
+  - clocks: A list of phandle + clock specifier pairs. In case of
+	    "renesas,rcar-gen3-usbhs" compatible device, first clock should be
+	    peripheral and second one should be host.
 
 Optional properties:
   - renesas,buswait: Integer to use BUSWAIT register
-- 
1.9.1
