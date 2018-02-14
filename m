Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:32260 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754202AbeBNG23 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 01:28:29 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 4/4] arm64: defconfig: Enable USB 3.0 peripheral for R-Car
Date: Wed, 14 Feb 2018 15:23:32 +0900
Message-Id: <1518589412-7330-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the R-Car's USB 3.0 peripheral controller.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 29650e1..ceafd26 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -445,6 +445,7 @@ CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_ULPI=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_RENESAS_USB3=m
 CONFIG_USB_ULPI_BUS=y
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
-- 
1.9.1
