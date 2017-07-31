Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42651 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750987AbdGaPEE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Jul 2017 11:04:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 03/10] ARM: shmobile: defconfig: Replace USB_XHCI_RCAR by USB_XHCI_PLATFORM
Date: Mon, 31 Jul 2017 17:03:34 +0200
Message-Id: <3c0aee084eb24408721da21fc401cd0c389b237b.1501511664.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1501511664.git.horms+renesas@verge.net.au>
References: <cover.1501511664.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

USB_XHCI_RCAR is no longer enabled, as it now has a dependency on
USB_XHCI_PLATFORM, instead of selecting USB_XHCI_PLATFORM.
As the latter selects the former if ARCH_RENESAS, fix this by replacing
USB_XHCI_RCAR by USB_XHCI_PLATFORM in shmobile_defconfig.

Fixes: f879fc32aa0c96fb ("usb: host: xhci-rcar: Avoid long wait in xhci_reset()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/configs/shmobile_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 297ef8e584f3..d63938024237 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -176,7 +176,7 @@ CONFIG_SND_SOC_AK4642=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_RCAR=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_R8A66597_HCD=y
-- 
2.1.4
