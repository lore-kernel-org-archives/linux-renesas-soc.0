Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:51122 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754173AbdGJN20 (ORCPT
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
Subject: [PATCH 0/9] ARM: renesas: shmobile and multi_v7 defconfig updates
Date: Mon, 10 Jul 2017 15:28:13 +0200
Message-Id: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

	Hi Arnd, Kevin, Magnus, Olof, Simon,

This patch series updates shmobile_defconfig and multi_v7_defconfig to
(re-)enable some features:
  - Re-enable R-Car PCIe (shmobile_defconfig),
  - Re-enable R-Car XHCI (shmobile_defconfig),
  - Re-enable R-Car sound (both),
  - Update DRM bridge (both),
  - Enable serial port DMA (both).

There also a patch included to refresh shmobile_defconfig.
To avoid conflicts, I didn't refresh multi_v7_defconfig (although it could
definitely use a refresh), and only made "simple" changes to it.

Thanks!

Geert Uytterhoeven (9):
  ARM: shmobile: defconfig: Enable missing PCIE_RCAR dependency
  ARM: shmobile: defconfig: Replace USB_XHCI_RCAR by USB_XHCI_PLATFORM
  ARM: shmobile: defconfig: Replace SND_SOC_RSRC_CARD by
    SND_SIMPLE_SCU_CARD
  ARM: shmobile: defconfig: Replace DRM_RCAR_HDMI by generic bridge
    options
  ARM: shmobile: defconfig: Enable DMA for serial ports
  ARM: shmobile: defconfig: Refresh
  ARM: multi_v7_defconfig: Replace SND_SOC_RSRC_CARD by
    SND_SIMPLE_SCU_CARD
  ARM: multi_v7_defconfig: Replace DRM_RCAR_HDMI by generic bridge
    options
  ARM: multi_v7_defconfig: Enable DMA for Renesas serial ports

 arch/arm/configs/multi_v7_defconfig |  5 +++--
 arch/arm/configs/shmobile_defconfig | 16 +++++++++-------
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
