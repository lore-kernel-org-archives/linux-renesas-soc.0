Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:38480 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754181AbdGJN20 (ORCPT
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
Subject: [PATCH 9/9] ARM: multi_v7_defconfig: Enable DMA for Renesas serial ports
Date: Mon, 10 Jul 2017 15:28:22 +0200
Message-Id: <1499693302-25120-10-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

DMA for (H)SCIF(A|B) serial ports on Renesas R-Car Gen2 and RZ/G1 SoCs
is considered stable, hence enable it by default.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ea2075d8e185f7aa..072a455008df9751 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -330,6 +330,7 @@ CONFIG_SERIAL_IMX_CONSOLE=y
 CONFIG_SERIAL_SH_SCI=y
 CONFIG_SERIAL_SH_SCI_NR_UARTS=20
 CONFIG_SERIAL_SH_SCI_CONSOLE=y
+CONFIG_SERIAL_SH_SCI_DMA=y
 CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_VT8500=y
-- 
2.7.4
