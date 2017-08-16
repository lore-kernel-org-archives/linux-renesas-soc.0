Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33193 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751969AbdHPUca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 16:32:30 -0400
Received: by mail-oi0-f50.google.com with SMTP id f11so47814417oic.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 13:32:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501512320.git.horms+renesas@verge.net.au>
References: <cover.1501512320.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Aug 2017 22:32:29 +0200
Message-ID: <CAK8P3a1mN8o4UNzHeZAnWi+177a7oTx+HcNUAJf-Nb+KnND0QQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v4.14
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

On Mon, Jul 31, 2017 at 5:05 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
>
> * Add debug-ll support to RZ/G1M (r8a7743) SoC
>
>   Chris Paterson says, "RZ/G1M uses SCIF0 for the debug console, like most
>   of the R-Car Gen2 SoCs."
>
> * Remove ARCH_SHMOBILE_MULTI
>
>   Geert Uytterhoeven says, "The migration from ARCH_SHMOBILE_MULTI to
>   ARCH_RENESAS has been completed in v4.12..."
>
> * Correct arch timer frequency on RZ/G1M (r8a7743) SoC
>
>   Geert Uytterhoeven says, "According to the datasheet, the frequency of
>   the ARM architecture timer on RZ/G1E depends on the frequency of the ZS
>   clock..."
>
> * Add support for CPG/MSSR bindings
>
>   Geert Uytterhoeven says, "When using the new CPG/MSSR bindings, there is
>   no longer a "renesas,rcar-gen2-cpg-clocks" node, and the code to obtain
>   the external clock crystal frequency falls back to a default of 20 MHz.
>   While this is correct for all upstream R-Car Gen2 and RZ/G1 boards, this
>   is not necessarily the case for out-of-tree third party boards.
>
>   Add support for finding the external clock crystal oscillator on RZ/G1M,
>   and on R-Car H2, M2-W, and M2-N using the new CPG/MSSR bindings, through
>   the corresponding "renesas,r8a77xx-cpg-mssr" nodes."
>
> * Obtain jump stub region from DT
>
>   Geert Uytterhoeven says, "Add support for obtaining from DT the SRAM
>   region to store the jump stub for CPU core bringup, according to the
>   renesas,smp-sram DT bindings."

Pulled into next/soc, thanks!

      Arnd
