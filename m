Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <horms@verge.net.au>, <magnus.damm@gmail.com>
CC: <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2] arm64: defconfig: Add Renesas R-Car USB 3.0 driver support
Date: Thu, 21 Apr 2016 20:39:32 +0900
Message-ID: <1461238772-3580-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 Changes from v1:
  - Remove unrelated change (CONFIG_FHANDLE)
  - Remove commit log because the xhci-plat driver is possible to fix
    the long wait issue.

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a44ef99..9cf9c85 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -192,7 +192,7 @@ CONFIG_SND_SOC_AK4613=y
 CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_PLATFORM=y
+CONFIG_USB_XHCI_RCAR=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
-- 
1.9.1
