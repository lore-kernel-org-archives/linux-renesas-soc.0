Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36472 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752339AbdHPVig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 17:38:36 -0400
Received: by mail-oi0-f46.google.com with SMTP id g131so49177627oic.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 14:38:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501509525.git.horms+renesas@verge.net.au>
References: <cover.1501509525.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Aug 2017 23:38:35 +0200
Message-ID: <CAK8P3a1iaMrJ0dvS67uw9Am4CoGbcZQdZw2H7OQ6aabHHWnuxQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.14
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
> Renesas ARM64 Based SoC DT Updates for v4.14
>
> * Add usb2.0 for R-Car H3 (r8a7795) ES2.0 SoC
>
> * Add R-Car D3 (r8a77995) SoC and Draak board support
>
>   Adds minimal support for the R-Car D3 SoC and the Draak development
>   board, allowing to boot from a ramdisk using a serial console.
>
> * Add Add VC6 clock generator to R-Car H3 (r8a7795)/Salvator-XS board
>
>   The VC6 is an I2C-controlled programmable clock generator, used on the
>   board to provide a display dot clock. Add it to DT.
>
> * Add missing second pair of DMA names to MSIOF nodes to
>   R-Car M3-W (r8a7796) SoC
>
>   MSIOF0 and MSIOF1 are tied to two DMA controllers through two pairs of
>   DMA specifiers.  However, the second pair of corresponding DMA names was
>   missing.
>
> * Add support for the DU to R-Car H3 (r8a7795) SoC
>
>   Add a compatible string and VSP links to the DU node. The H3 ES1.x and H3
>   ES2.0 are compatible save for the links to the VSPs that are described
>   explicitly in DT, so there's no need for a new ES2-specific compatible
>   string.
>
> * Enable HDMI on R-Car H3 (r8a7795) and M3-W (r8a7796) ULCB boards
>
> * Enable DU on R-Car M3-W (r8a7796) Salvator-X board
>
> * Enable I2C for DVFS on R-Car H3 (r8a7795) and M3-W (r8a7796) ULCB boards
>
> * Add Add DRIF support to R-Car H3 (r8a7795) and M3-W (r8a7796) SoCs
>
>   Ramesh Shanmugasundaram says, "R-Car Gen3 DRIF is a SPI like receive only
>   slave device."
>
> * Move CPG_AUDIO_CLK_I from board to soc files
>
>   Geert Uytterhoeven says, "The definition of CPG_AUDIO_CLK_I is
>   SoC-specific, not board-specific."
>
> * Add IMR-LX4 support to R-Car H3 (r8a7795) and M3-W (r8a7796) SoCs
>
>   Sergei Shtylyov says, "The image renderer light extended 4 (IMR-LX4) or
>   the distortion correction engine is a drawing processor with a simple
>   instruction system capable of referencing data on an external memory as
>   2D texture data and performing texture mapping and drawing with respect
>   to any shape that is split into triangular objects."

Pulled into next/dt64, thanks!

       Arnd
