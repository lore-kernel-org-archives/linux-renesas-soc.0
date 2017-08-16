Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34180 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751649AbdHPIM6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 04:12:58 -0400
Received: by mail-pg0-f68.google.com with SMTP id y192so4700871pgd.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 01:12:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502814088-29767-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1502814088-29767-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 10:12:57 +0200
Message-ID: <CAMuHMdXoYF28SrRKKc3=fvt9avoiKdthZzN-V7nGotB1gkt0ng@mail.gmail.com>
Subject: Re: [PATCH] ARM: debug-ll: Add support for r8a7745
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Russell King <linux@armlinux.org.uk>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Fabrizio,

On Tue, Aug 15, 2017 at 6:21 PM, Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Enable low-level debugging support for RZ/G1E (r8a7745). RZ/G1E uses
> SCIF4 for the debug console.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug

> @@ -1568,6 +1576,7 @@ config DEBUG_UART_PHYS
>         default 0xe6c40000 if DEBUG_RMOBILE_SCIFA0
>         default 0xe6c50000 if DEBUG_RMOBILE_SCIFA1
>         default 0xe6c80000 if DEBUG_RMOBILE_SCIFA4
> +       default 0xe6ee0000 if DEBUG_RCAR_GEN2_SCIF4

Please keep the list sorted by physical address.

>         default 0xe6e58000 if DEBUG_RCAR_GEN2_SCIF2
>         default 0xe6e60000 if DEBUG_RCAR_GEN2_SCIF0
>         default 0xe8008000 if DEBUG_R7S72100_SCIF2

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
