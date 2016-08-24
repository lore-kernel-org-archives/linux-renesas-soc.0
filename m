Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:11633 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753884AbcHXI41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 04:56:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/4] usb: host: xhci: plat: use XHCI_PLAT_RENESAS_RCAR_PRIV macro for R-Car
Date: Wed, 24 Aug 2016 17:52:41 +0900
Message-ID: <1472028762-6640-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch uses XHCI_PLAT_RENESAS_RCAR_PRIV macro to make
the xhci_plat_priv data.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/host/xhci-plat.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index ed56bf9..c1a6b5a 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -88,17 +88,8 @@ static const struct xhci_plat_priv xhci_plat_marvell_armada = {
 	.init_quirk = xhci_mvebu_mbus_init_quirk,
 };
 
-static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen2 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V1,
-	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
-};
-
-static const struct xhci_plat_priv xhci_plat_renesas_rcar_gen3 = {
-	.firmware_name = XHCI_RCAR_FIRMWARE_NAME_V2,
-	.init_quirk = xhci_rcar_init_quirk,
-	.plat_start = xhci_rcar_start,
-};
+XHCI_PLAT_RENESAS_RCAR_PRIV(gen2, XHCI_RCAR_FIRMWARE_NAME_V1);
+XHCI_PLAT_RENESAS_RCAR_PRIV(gen3, XHCI_RCAR_FIRMWARE_NAME_V2);
 
 static const struct of_device_id usb_xhci_of_match[] = {
 	{
-- 
1.9.1
