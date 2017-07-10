Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from andre.telenet-ops.be ([195.130.132.53]:38708 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754168AbdGJN20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jul 2017 09:28:26 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms@verge.net.au>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/9] ARM: shmobile: defconfig: Replace USB_XHCI_RCAR by USB_XHCI_PLATFORM
Date: Mon, 10 Jul 2017 15:28:15 +0200
Message-Id: <1499693302-25120-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

USB_XHCI_RCAR is no longer enabled, as it now has a dependency on
USB_XHCI_PLATFORM, instead of selecting USB_XHCI_PLATFORM.
As the latter selects the former if ARCH_RENESAS, fix this by replacing
USB_XHCI_RCAR by USB_XHCI_PLATFORM in shmobile_defconfig.

Fixes: f879fc32aa0c96fb ("usb: host: xhci-rcar: Avoid long wait in xhci_reset()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 04cd18424016eba5..bfbeae3f6a884987 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -175,7 +175,7 @@ CONFIG_SND_SOC_AK4642=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_XHCI_RCAR=y
+CONFIG_USB_XHCI_PLATFORM=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
 CONFIG_USB_R8A66597_HCD=y
-- 
2.7.4
