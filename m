Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] usb: renesas_usbhs: Use devm_usb_get_phy_by_phandle()
Date: Mon, 27 Jun 2016 21:09:19 +0900
Message-ID: <1467029359-6812-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1467029359-6812-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch uses devm_usb_get_phy_by_phandle() instead of usb_get_phy()
for device tree environment. This change is not compabile with the
previous code, but it is no problem because nobody calls usb_bind_phy()
for this driver now.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas_usbhs.txt | 3 ++-
 drivers/usb/renesas_usbhs/mod_gadget.c                  | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
index b604056..a419aea 100644
--- a/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
+++ b/Documentation/devicetree/bindings/usb/renesas_usbhs.txt
@@ -24,8 +24,9 @@ Optional properties:
   - renesas,buswait: Integer to use BUSWAIT register
   - renesas,enable-gpio: A gpio specifier to check GPIO determining if USB
 			 function should be enabled
-  - phys: phandle + phy specifier pair
+  - phys: phandle of *Generic PHY* + phy specifier pair
   - phy-names: must be "usb"
+  - usb-phy: phandle of usb phy
   - dmas: Must contain a list of references to DMA specifiers.
   - dma-names : named "ch%d", where %d is the channel number ranging from zero
                 to the number of channels (DnFIFOs) minus one.
diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 6e60297..ba1da69 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -1071,7 +1071,12 @@ int usbhs_mod_gadget_probe(struct usbhs_priv *priv)
 		goto usbhs_mod_gadget_probe_err_gpriv;
 	}
 
-	gpriv->transceiver = usb_get_phy(USB_PHY_TYPE_UNDEFINED);
+	gpriv->transceiver = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
+	if (PTR_ERR(gpriv->transceiver) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_add_udc;
+	}
+
 	dev_info(dev, "%stransceiver found\n",
 		 !IS_ERR_OR_NULL(gpriv->transceiver) ? "" : "no ");
 
-- 
1.9.1

