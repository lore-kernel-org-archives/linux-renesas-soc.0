Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:33707 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752233AbdHPVGg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 17:06:36 -0400
Received: by mail-oi0-f49.google.com with SMTP id f11so48642989oic.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 14:06:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501514100.git.horms+renesas@verge.net.au>
References: <cover.1501514100.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Aug 2017 23:06:35 +0200
Message-ID: <CAK8P3a1GwoJ6hB7m+s+ADn6qg0YVoNXkBoVp4JLH3QJY70QK2w@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Updates for v4.14
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

On Mon, Jul 31, 2017 at 5:19 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Renesas ARM Based SoC DT Updates for v4.14
>
> Changes of note:
>
> * Add pin controller support to the RZ/G1M (r8a7743) SoC and
>   RZ/A1 (r7s72100) SoCs now that the driver is available in v4.13-rc1.
>
> * Add GPIO support to the RZ/G1M (r8a7743) SoC now that the driver
>   is availabe in v4.13-rc1.
>
> * Enable MMCIF0 and Ethernet AVB support on the RZ/G1M (r8a7743) SoC and
>   the iWave-RZG1M-20M Qseven SOM. This depends on newly added pin
>   controller support noted above.
>
> * Use R-Car Gen 2 fallback binding for vin nodes
>
>   This makes binding use consistent across R-Car Gen 2 SoCs.
>   It does not have any run-time effect
>
> * Use SMP jump stub SRAM region from DT on R-Car Gen 2 SoCs
>
>   Geert Uytterhoeven says, "The R-Car Gen2 platform code for CPU core
>   bringup needs to copy a jump stub to on-SoC SRAM.  Currently it uses a
>   hardcoded address pointing to ICRAM1."
>
> * Add Inter Connect RAM to R-Car Gen 2 and RZ/G1 SoCs
>
>   Geert Uytterhoeven says, "R-Car Gen2 and RZ/G1 SoCs contain two or three
>   blocks of SRAM, which can be used for several purposes.  One such purpose
>   is holding a jump stub for CPU core bringup."
> * Use generic compatible string for I2C EEPROM for RZ/A1 (r7s72100) SoC
>   and koelsch board.
>
>   This is part of a tree-wide cleanup by Javier Martinez Canillas

Pulled into next/dt, thanks!

       Arnd
