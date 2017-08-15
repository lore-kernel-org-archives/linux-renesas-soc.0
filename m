Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:34400 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753069AbdHOP6F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 11:58:05 -0400
Received: by mail-oi0-f49.google.com with SMTP id x3so11172375oia.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2017 08:58:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501511664.git.horms+renesas@verge.net.au>
References: <cover.1501511664.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 15 Aug 2017 17:58:03 +0200
Message-ID: <CAK8P3a3dXC-jt8qDJnC-P13_9hDXseqYji6378_WXThPdvJXWQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Defconfig Updates for v4.14
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 31, 2017 at 5:03 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> ----------------------------------------------------------------
> Renesas ARM Based SoC Defconfig Updates for v4.14
>
> * Enable DMA for Renesas serial ports
>
>   Geert Uytterhoeven says, "DMA for (H)SCIF(A|B) serial ports on Renesas
>   R-Car Gen2 and RZ/G1 SoCs is considered stable, hence enable it by
>   default.".
>
> * Enable Ethernet AVB
>
>   For the iWave RZ/G1M Q7 SOM
>
> * Replace DRM_RCAR_HDMI by generic bridge options
> * Replace SND_SOC_RSRC_CARD by SND_SIMPLE_SCU_CARD
> * Replace USB_XHCI_RCAR by USB_XHCI_PLATFORM
> * Enable missing PCIE_RCAR dependency
>
>   Defconfig updates for various Kconfig updates covering
>   renamed Kconfig symbols, now missing dependancies and so on.

Pulled into next/defconfig, thanks!

        Arnd
