Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33741 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752344AbdGKJNu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 05:13:50 -0400
Date: Tue, 11 Jul 2017 11:13:39 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Olof Johansson <olof@lixom.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/9] ARM: renesas: shmobile and multi_v7 defconfig updates
Message-ID: <20170711091338.GI4517@verge.net.au>
References: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499693302-25120-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 03:28:13PM +0200, Geert Uytterhoeven wrote:
> 	Hi Arnd, Kevin, Magnus, Olof, Simon,
> 
> This patch series updates shmobile_defconfig and multi_v7_defconfig to
> (re-)enable some features:
>   - Re-enable R-Car PCIe (shmobile_defconfig),
>   - Re-enable R-Car XHCI (shmobile_defconfig),
>   - Re-enable R-Car sound (both),
>   - Update DRM bridge (both),
>   - Enable serial port DMA (both).
> 
> There also a patch included to refresh shmobile_defconfig.
> To avoid conflicts, I didn't refresh multi_v7_defconfig (although it could
> definitely use a refresh), and only made "simple" changes to it.

Thanks, all applied.

Personally I would be in favour of co-ordinating a refresh of
multi_v7_defconfig.

> 
> Thanks!
> 
> Geert Uytterhoeven (9):
>   ARM: shmobile: defconfig: Enable missing PCIE_RCAR dependency
>   ARM: shmobile: defconfig: Replace USB_XHCI_RCAR by USB_XHCI_PLATFORM
>   ARM: shmobile: defconfig: Replace SND_SOC_RSRC_CARD by
>     SND_SIMPLE_SCU_CARD
>   ARM: shmobile: defconfig: Replace DRM_RCAR_HDMI by generic bridge
>     options
>   ARM: shmobile: defconfig: Enable DMA for serial ports
>   ARM: shmobile: defconfig: Refresh
>   ARM: multi_v7_defconfig: Replace SND_SOC_RSRC_CARD by
>     SND_SIMPLE_SCU_CARD
>   ARM: multi_v7_defconfig: Replace DRM_RCAR_HDMI by generic bridge
>     options
>   ARM: multi_v7_defconfig: Enable DMA for Renesas serial ports
> 
>  arch/arm/configs/multi_v7_defconfig |  5 +++--
>  arch/arm/configs/shmobile_defconfig | 16 +++++++++-------
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> -- 
> 2.7.4
> 
> Gr{oetje,eeting}s,
> 
> 						Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
> 							    -- Linus Torvalds
> 
