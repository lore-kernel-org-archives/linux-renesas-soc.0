Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:32992 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751223AbdH2IBH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 04:01:07 -0400
Received: by mail-pf0-f178.google.com with SMTP id r62so8311323pfj.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Aug 2017 01:01:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
References: <705d6de1-a037-f1e1-8c61-7b5aa5e0f30a@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Aug 2017 10:01:06 +0200
Message-ID: <CAMuHMdVuBqSLjMg+r1y7_TRSDL5r1tLhTewfgr5xU9hZup=PLA@mail.gmail.com>
Subject: Re: clk: renesas: rcar-gen3: Status of Z* clocks?
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Tue, Aug 29, 2017 at 9:51 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> as mentioned previously since ages I'm back looking at the RCar3 status in
> recent mainline (4.13-rc7). While doing so, it looks to me that some Z*
> clock patches from recent BSP
>
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-bsp.git/log/?h=v4.9/rcar-3.5.8
>
> are not in mainline clock configuration, yet. E.g.:
>
> Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
> Takeshi Kihara | clk: renesas: r8a7795: Add ZG clock
> Takeshi Kihara | clk: renesas: r8a7795: Add Z2 clock
> Takeshi Kihara | clk: renesas: r8a7795: Add Z clock
> Takeshi Kihara | clk: renesas: rcar-gen3: Adjust output of PLL4 as 3DGE
> clock divider input
> Takeshi Kihara | clk: renesas: rcar-gen3: Add ZG clock divider support
> Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clock errata workaround in
> PLL0 clk driver
> Dien Pham | clk: renesas: rcar-gen3: Add PLL0 clk driver support
> Dien Pham | clk: renesas: rcar-gen3: Adjust output of PLL0, PLL2 as
> SYSC-CPUs input
> Takeshi Kihara | clk: renesas: rcar-gen3: Add Z2 clock divider support
> Takeshi Kihara | clk: renesas: rcar-gen3: Add Z clock divider support
>
> Are there any plans to pick these, already? Or, if not, would it be fine to
> pick them from the BSP and just submit them here? Or is some major rework
> needed?

Yes, this is WIP, cfr. "[PATCH v2 0/6] clk: renesas: r8a779[56]: Add Z and Z2
clock support" (https://www.spinics.net/lists/arm-kernel/msg602197.html).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
